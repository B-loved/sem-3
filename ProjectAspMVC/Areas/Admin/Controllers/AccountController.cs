using HealthInsuranceService.Serveices;
using ProjectAspMVC.Areas.Admin.Models.Bussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectAspMVC.Areas.Admin.Controllers
{
    [Log]
    public class AccountController : Controller
    {
        private AdminService admin = new AdminService();

        [HttpPost]
        public string ChangePassword(string username, string password, string newpassword)
        {
            var rs = admin.GetAll().Where(x => x.UserName == username && x.Password == password).FirstOrDefault();
            if (rs != null)
            {
                rs.Password = newpassword;
                admin.Save();
                return "success";
            }
            return "fail";
        }
    }
}