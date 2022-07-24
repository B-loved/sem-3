using HealthInsuranceService.Data;
using HealthInsuranceService.Serveices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectAspMVC.Controllers
{
    public class AccountController : Controller
    {
        HealthInsuranceDB db;
        public AccountController()
        {
            db = new HealthInsuranceDB();
        }
        // GET: Account
        public ActionResult Login()
        {
            if (Session["IsLogedIn"]!= null)
            {
                return RedirectToAction("Index","Policy");
            }
            else
            {
                return View();
            }
            
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            Employee employee = db.Employees.SingleOrDefault(x => x.User == username && x.Password == password);
            if (employee != null)
            {
                Session["IsLogedIn"] = true;
                Session["EmployeeId"] = employee.Id;
                Session["EmployeeName"] = employee.LastName;
                return RedirectToAction("Index","Policy");
            }
            ViewBag.Error = "Wrong Username/Password";
            return View();
        }
        public ActionResult Logout()
        {
            Session["IsLogedIn"] = null;
            return RedirectToAction("Login", "Account");
        }
    }
}