using HealthInsuranceService.Serveices;
using HealthInsuranceService.Serveices.Repository;
using ProjectAspMVC.Areas.Admin.Models.Bussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectAspMVC.Areas.Admin.Controllers
{
    public class ReportController : Controller
    {
        private EmployeeService emp = new EmployeeService();
        private PolicyOnEmployeeService poe = new PolicyOnEmployeeService();
        private PolicyRequestService requests = new PolicyRequestService();

        public ActionResult ListEmployee()
        {
            return View(emp.GetAll());
        }
        public ActionResult ListEmployeePDF()
        {
            return new Rotativa.ActionAsPdf("ListEmployee");
        }

        public ActionResult PoliciesOfEmployee(int id)
        {
            var data = poe.GetAll().Where(x => x.EmployeeId == id);
            ViewBag.EmpName = data.FirstOrDefault().Employee.FirstName + " " + data.FirstOrDefault().Employee.LastName;
            return View(data);
        }

        public ActionResult PoliciesOfEmployeePDF(int id)
        {
            return new Rotativa.ActionAsPdf("PoliciesOfEmployee", new { id = id });
        }

        public ActionResult RequestOfEmployee(int id)
        {
            var data = requests.GetAll().Where(x => x.EmployeeId == id);
            ViewBag.EmpName = data.FirstOrDefault().Employee.FirstName + " " + data.FirstOrDefault().Employee.LastName;
            return View(data);
        }
        public ActionResult RequestOfEmployeePDF(int id)
        {
            return new Rotativa.ActionAsPdf("RequestOfEmployee", new { id = id });
        }

        
        public ActionResult RequestByDate(string _StartDate, string _EndDate)
        {
            if (_StartDate == ""){_StartDate = null;}
            if (_EndDate == ""){_EndDate = null;}
            string now = DateTime.Now.ToShortDateString();
            DateTime EndDate = DateTime.Parse(_EndDate ?? _StartDate ?? now);
            DateTime StartDate = DateTime.Parse(_StartDate ?? _EndDate ?? now);
            ViewBag.Start = _StartDate ?? _EndDate ?? now;
            ViewBag.End = _EndDate ?? _StartDate ?? now;

            var data = requests.GetAll()
                .Where(x => x.RequestDate.Date.CompareTo(StartDate.Date) >= 0 && x.RequestDate.Date.CompareTo(EndDate.Date) <= 0);
            return View(data);
        }
        [HttpPost]
        public ActionResult RequestByDatePDF(string StartDate, string EndDate)
        {
            return new Rotativa.ActionAsPdf("RequestByDate",new { _StartDate = StartDate, _EndDate = EndDate});
        }
    }
}