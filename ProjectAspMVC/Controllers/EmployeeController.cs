using HealthInsuranceService.Data;
using HealthInsuranceService.Serveices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectAspMVC.Controllers
{
    [Filter.Autorize]
    public class EmployeeController : Controller
    {
        EmployeeService db;
        public EmployeeController()
        {
            db = new EmployeeService();
        }
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Detail(int id)
        {
            Session["EmployeeId"] = id;
            return View(db.Get(id));
        }
        public ActionResult Update(int id)
        {
            return View(db.Get(id));
        }
        [HttpPost]
        public ActionResult Update(Employee e,int id)
        {
            var empUser = db.Get(id).User;
            if (e.User == null)
            {
                e.User = empUser;
            }
            db.Edit(e);
            
            return RedirectToAction("Detail", new { id = id});
        }

    }
}