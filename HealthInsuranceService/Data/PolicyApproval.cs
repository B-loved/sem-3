using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Data
{
    public class PolicyApproval
    {
        [Key]
        public int RequestId { get; set; }
        [DataType(DataType.Date)]
        public DateTime ApprovalDate { get; set; }
        [StringLength(100)]
        public string Reason { get; set; }
        [StringLength(10)]
        public string Status { get; set; }

        [ForeignKey("RequestId")]
        public PolicyRequest PolicyRequest { get; set; }
    }
}