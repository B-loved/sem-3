using HealthInsuranceService.Serveices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectAspMVC.Areas.Admin.Controllers
{
    public class LogController : Controller
    {
        private AdminService admin = new AdminService();

        public ActionResult Login()
        {
            if (Session["Login"] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            var rs = admin.GetAll().Where(x => x.UserName == username && x.Password == password).FirstOrDefault();
            if (rs != null)
            {
                Session["Login"] = new Models.Bussiness.Admin { User = rs.UserName, Email = rs.Email };
                return RedirectToAction("Index", "Home");
            }
            ViewBag.msg = "Fail to login!";
            return View();
        }

        public ActionResult Logout()
        {
            Session["Login"] = null;
            return RedirectToAction("Login");
        }
    }
}