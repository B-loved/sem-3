using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Data
{
    public class PolicyRequest
    {
        [Key]
        public int RequestId { get; set; }
        [DataType(DataType.Date)]
        public DateTime RequestDate { get; set; }
       
        public int EmployeeId { get; set; }
        
        public int PolicyId { get; set; }
        public string Status { get; set; }

        [ForeignKey("EmployeeId")]
        public Employee Employee { get; set; }

        [ForeignKey("PolicyId")]
        public Policy Policy { get; set; }
    }
}