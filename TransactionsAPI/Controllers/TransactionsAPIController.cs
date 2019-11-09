using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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

        // GET: api/TransactionsAPI/byCurrency/USD
        [HttpGet("byCurrency/{currency}")]
        public IEnumerable<Transaction> GetTransactionsAPIByCurrency(string currency)
        {
            return _context.Transactions.Where(c => c.CurrencyCode.Equals(currency)).AsEnumerable();
        }

        // GET: api/TransactionsAPI/byStatus/R
        [HttpGet("byStatus/{status}")]
        public IEnumerable<Transaction> GetTransactionsAPIByStatus(string status)
        {
            return _context.Transactions.Where(c => c.Status.Equals(status)).AsEnumerable();
        }

        // GET: api/TransactionsAPI/byDateRange?startDate=2001-01-24T16:09:15&endDate=2002-02-24T16:09:15
        [HttpGet("byDateRange")]
        public IEnumerable<Transaction> GetTransactionsAPIByStatus(DateTime startDate, DateTime endDate)
        {
            return _context.Transactions.Where(c => c.Date >= startDate && c.Date <= endDate).AsEnumerable();
        }



        private bool TransactionExists(string id)
        {
            return _context.Transactions.Any(e => e.Id == id);
        }
    }
}
