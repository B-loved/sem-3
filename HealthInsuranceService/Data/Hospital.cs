using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Data
{
    public class Hospital
    {
        public int HospitalId { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Location { get; set; }
        public string Url { get; set; }

        public ICollection<Policy> Policies { get; set; }
    }
}