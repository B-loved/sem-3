using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Data
{
    public class PoliciesOnEmployee
    {
        [Key, Column(Order = 0)]
        public int EmployeeId { get; set; }

        [Key, Column(Order = 1)]
        public int PolicyId { get; set; }
        [DataType(DataType.Date)]
        public DateTime PolicyStartDate { get; set; }
        [DataType(DataType.Date)]
        public DateTime PolicyEndDate { get; set; }
        public decimal PolicyDuration { get; set; }

        [ForeignKey("EmployeeId")]
        public Employee Employee { get; set; }

        [ForeignKey("PolicyId")]
        public Policy Policy { get; set; }

    }
}