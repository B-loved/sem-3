using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthInsuranceService.Serveices.Repository
{
    interface IRepository<T> where T : class
    {
        IEnumerable<T> GetAll();
        T Get(object id);
        T Add(T entity);
        T Edit(T entity);
        bool Delete(object id);
    }
}
