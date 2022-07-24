using HealthInsuranceService.Serveices.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Serveices
{
    public class CompanyService : Repository<HealthInsuranceService.Data.Company>
    {
        public CompanyService()
        {
            
        }
    }
}