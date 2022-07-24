using HealthInsuranceService.Data;
using HealthInsuranceService.Serveices.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace HealthInsuranceService.Serveices
{
    public class PolicyOnEmployeeService : Repository<HealthInsuranceService.Data.PoliciesOnEmployee>
    {
        public override IEnumerable<PoliciesOnEmployee> GetAll()
        {
            try
            {
                return tbl.Include(x => x.Employee).Include(x => x.Policy);
            }
            catch (Exception)
            {
                return Enumerable.Empty<PoliciesOnEmployee>();
            }
        }
    }
}