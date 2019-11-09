using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;
using CsvHelper.Configuration.Attributes;


namespace TransactionsAPI.Models
{
    public class Transaction
    {
        [Index(0)]
        [Required]
        [JsonPropertyName("id")]
        [StringLength(50, MinimumLength = 1)]
        public string Id { get; set; }

        [IgnoreDataMember]
        public string Payment
        {
            get
            {
                return Amount.ToString("0.00", System.Globalization.CultureInfo.InvariantCulture) + " " + CurrencyCode;
            }
        }

        [Index(1)]
        [Required]
        [JsonIgnore]
        public double Amount { get; set; }

        [Index(2)]
        [Required]
        [JsonIgnore]
        [StringLength(3, MinimumLength = 3)]
        public string CurrencyCode { get; set; }

        [Index(3)]
        [Required]
        [JsonIgnore]
        public DateTime Date { get; set; }

        [Index(4)]
        [Required]
        [JsonPropertyName("Status")]
        [StringLength(1, MinimumLength = 1)]
        public string Status { get; set; }

    }
}