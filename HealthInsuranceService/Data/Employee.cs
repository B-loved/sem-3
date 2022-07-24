using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Data
{
    public class Employee
    {
        [Key]
        public int Id { get; set; }
        public string Designation { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime JoinDate { get; set; }

        [DataType(DataType.Currency)]
        public decimal Salary { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Email{ get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Status { get; set; }
    }
}