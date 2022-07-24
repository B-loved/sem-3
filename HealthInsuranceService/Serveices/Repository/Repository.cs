using HealthInsuranceService.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Serveices.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        protected HealthInsuranceDB db;
        protected DbSet<T> tbl;
        public Repository()
        {
            db = new HealthInsuranceDB();
            tbl = db.Set<T>();
        }
        public T Add(T entity)
        {
            try
            {
                tbl.Add(entity);
                db.SaveChanges();
                return entity;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public virtual bool Delete(object id)
        {
            try
            {
                tbl.Remove(Get(id));
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public virtual bool Delete(T entity)
        {
            try
            {
                tbl.Remove(entity);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public T Edit(T entity)
        {
            try
            {
                db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return entity;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public virtual T Get(object id)
        {
            try
            {
                return tbl.Find(id);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public virtual IEnumerable<T> GetAll()
        {
            try
            {
                return tbl.AsEnumerable();
            }
            catch (Exception)
            {
                return Enumerable.Empty<T>();
            }
        }
        public void Save()
        {
            db.SaveChanges();
        }
    }
}