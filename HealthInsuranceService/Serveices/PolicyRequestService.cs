using HealthInsuranceService.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace HealthInsuranceService.Serveices.Repository
{
    public class PolicyRequestService : Repository<PolicyRequest>
    {
        public override PolicyRequest Get(object id)
        {
            try
            {
                return tbl.Include(x => x.Policy).Include(x => x.Employee).Where(x => x.RequestId.Equals((int)id)).FirstOrDefault();
            }
            catch (Exception)
            {
                return null;
            }
        }
        public override IEnumerable<PolicyRequest> GetAll()
        {
            try
            {
                return tbl.Include(x => x.Policy).Include(x => x.Employee).AsEnumerable();
            }
            catch (Exception)
            {
                return Enumerable.Empty<PolicyRequest>();
            }
        }
    }
}