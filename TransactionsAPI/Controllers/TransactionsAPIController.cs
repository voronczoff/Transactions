using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;
using CsvHelper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransactionsAPI.Data;
using TransactionsAPI.Models;

namespace Controllers
{
    [Route("api/Transactions")]
    [ApiController]
    public class TransactionsAPIController : ControllerBase
    {
        private readonly TransactionContext _context;
        private readonly long _fileSizeLimit = 1048576;
        private readonly string[] _permittedExtensions = { ".xml", ".csv" };

        public TransactionsAPIController(TransactionContext context)
        {
            _context = context;
        }

        // GET: api/Transactions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Transaction>>> GetTransactions()
        {
            return await _context.Transactions.ToListAsync();
        }

        // GET: api/Transactions/byCurrency/USD
        [HttpGet("byCurrency/{currency}")]
        public IEnumerable<Transaction> GetTransactionsAPIByCurrency(string currency)
        {
            return _context.Transactions.Where(c => c.CurrencyCode.Equals(currency)).AsEnumerable();
        }

        // GET: api/Transactions/byStatus/R
        [HttpGet("byStatus/{status}")]
        public IEnumerable<Transaction> GetTransactionsAPIByStatus(string status)
        {
            return _context.Transactions.Where(c => c.Status.Equals(status)).AsEnumerable();
        }

        // GET: api/Transactions/byDateRange?startDate=2001-01-24T16:09:15&endDate=2002-02-24T16:09:15
        [HttpGet("byDateRange")]
        public IEnumerable<Transaction> GetTransactionsAPIByStatus(DateTime startDate, DateTime endDate)
        {
            return _context.Transactions.Where(c => c.Date >= startDate && c.Date <= endDate).AsEnumerable();
        }

        private bool TransactionExists(string id)
        {
            return _context.Transactions.Any(e => e.Id == id);
        }

        // POST: api/Transactions
        [HttpPost]
        public async Task<IActionResult> OnPostUploadAsync([FromForm(Name = "file")] IFormFile file)
        {
            long size = file.Length;
            string extension = Path.GetExtension(file.FileName).ToLower();

            // check file size
            if (file.Length > _fileSizeLimit)
            {
                return BadRequest(new { error = "File size must not exeed 1 Mb" });
            }

            // check extension
            if (!_permittedExtensions.Contains(extension))
            {
                return BadRequest(new { error = "Unknown format" });
            }

            // to store in random temp file
            var filePath = Path.GetTempFileName();
            using (var stream = System.IO.File.Create(filePath))
            {
                await file.CopyToAsync(stream);
            }

            List<Transaction> transactions = new List<Transaction>();

            // XML Parse
            if (extension == ".xml")
            {
                try
                {
                    transactions = XDocument
                        .Load(@filePath)
                        .Root
                        .Elements("Transaction")
                        .Select(p =>
                        {
                            try
                            {
                                string status = (string)p.Element("Status");
                                switch (status)
                                {
                                    case "Approved":
                                        status = "A";
                                        break;
                                    case "Rejected":
                                        status = "R";
                                        break;
                                    case "Done":
                                        status = "D";
                                        break;
                                    default:
                                        ModelState.AddModelError(string.Empty, "Status " + status + " can not be mapped");
                                        break;
                                }

                                return new Transaction
                                {
                                    Id = (string)p.Attribute("id"),
                                    Amount = (float)p.Element("PaymentDetails").Element("Amount"),
                                    CurrencyCode = (string)p.Element("PaymentDetails").Element("CurrencyCode"),
                                    Status = status,
                                    Date = (DateTime)p.Element("TransactionDate")
                                };
                            }
                            catch (Exception e)
                            {
                                ModelState.AddModelError(string.Empty, "Error in record " + (string)p.Attribute("id") + ": " + e.Message);
                                return null;
                            }
                        })
                        .ToList();

                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    return Ok(new { error = e });
                }
            }

            // CSV Parse
            if (extension == ".csv")
            {
                using (var reader = new StreamReader(@filePath))
                using (var csv = new CsvReader(reader))
                {
                    csv.Configuration.HasHeaderRecord = false;
                    csv.Configuration.Delimiter = ",";
                    csv.Configuration.BadDataFound = null;
                    // csv.Configuration.MissingFieldFound=null;
                    csv.Configuration.IgnoreQuotes = false;
                    // TransactionsAPI = csv.GetRecords<Transaction>().ToList();
                    // csv.Read();
                    // csv.ReadHeader();
                    while (csv.Read())
                    {
                        try
                        {
                            string status = csv.GetField<string>(4).Trim();
                            switch (status)
                            {
                                case "Approved":
                                    status = "A";
                                    break;
                                case "Failed":
                                    status = "R";
                                    break;
                                case "Finished":
                                    status = "D";
                                    break;
                                default:
                                    ModelState.AddModelError(string.Empty, "Status " + status + " can not be mapped");
                                    break;
                            }

                            var record = new Transaction
                            {
                                Id = csv.GetField<string>(0).Trim(),
                                Amount = float.Parse(csv.GetField<string>(1).Trim(), CultureInfo.InvariantCulture),
                                CurrencyCode = csv.GetField<string>(2).Trim(),
                                Date = csv.GetField<DateTime>(3),
                                Status = status,
                            };
                            transactions.Add(record);
                        }
                        catch (Exception e)
                        {
                            ModelState.AddModelError(string.Empty, "Error in record " + csv.GetField<string>(0).Trim() + ": " + e.Message);
                            continue;
                        }
                    }

                }
            }

            // Validate
            foreach (var transaction in transactions)
            {
                TryValidateModel(transaction);
                if (TransactionExists(transaction.Id))
                {
                    ModelState.AddModelError(string.Empty, "Id " + transaction.Id + " already exists in database");
                }
            }

            // Write to DB if there are no errors
            if (ModelState.IsValid)
            {
                foreach (var transaction in transactions)
                {
                    _context.Transactions.Add(transaction);
                    try
                    {
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateException)
                    {
                        if (TransactionExists(transaction.Id))
                        {
                            return Conflict();
                        }
                        else
                        {
                            throw;
                        }
                    }
                }
                return Ok(new { CreatedTransactions = transactions });
            }
            else
            {
                return BadRequest(new { errors = ModelState.Values.SelectMany(v => v.Errors) });
            }

        }

    }
}