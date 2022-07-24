using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Data
{
    public class Policy
    {
        [Key]
        public int Id { get; set; }

        public string PolicyName { get; set; }

        public string Description { get; set; }

        [DataType(DataType.Currency)]
        public decimal Amount { get; set; }

        [DataType(DataType.Currency)]
        public decimal EMI { get; set; }

        public int? CompanyId { get; set; }

        public int? HospitalId { get; set; }

        [ForeignKey("HospitalId")]
        public Hospital Hospital { get; set; }

        [ForeignKey("CompanyId")]
        public Company Company { get; set; }
    }
}