using HealthInsuranceService.Data;
using HealthInsuranceService.Serveices.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace HealthInsuranceService.Serveices
{
    public class PolicyService : Repository<Policy>
    {
        public override IEnumerable<Policy> GetAll()
        {
            try
            {
                return tbl.Include(x => x.Company);
            }
            catch (Exception)
            {
                return Enumerable.Empty<Policy>();
            }
        }
        public override Policy Get(object id)
        {
            try
            {
                return tbl.Include(x => x.Company).Where(x => x.Id.Equals((int)id)).SingleOrDefault();
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}