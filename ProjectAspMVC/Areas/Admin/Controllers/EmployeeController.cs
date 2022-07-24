using HealthInsuranceService.Data;
using HealthInsuranceService.Serveices;
using PagedList;
using ProjectAspMVC.Areas.Admin.Models.Bussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectAspMVC.Areas.Admin.Controllers
{
    [Log]
    public class EmployeeController : Controller
    {
        private EmployeeService employee;
        private PolicyOnEmployeeService poe;
        public EmployeeController()
        {
            employee = new EmployeeService();
            poe = new PolicyOnEmployeeService();
        }
        // GET: Admin/Employee
        public ActionResult Index(int? page, string search)
        {
            ViewBag.Search = search;
            var _page = page ?? 1;
            var data = employee.GetAll()
                .Where(x =>
                {
                    if (String.IsNullOrEmpty(search))
                    {
                        return true;
                    }
                    return x.FirstName.ToLower().Contains(search.ToLower()) ||
                            x.LastName.ToLower().Contains(search.ToLower());
                })
                .OrderBy(x => x.Id).ToPagedList(_page, 20);
            return View(data);
        }
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(Employee e)
        {
            if (ModelState.IsValid)
            {
                employee.Add(e);
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Edit(int id)
        {
            return View(employee.Get(id));
        }

        [HttpPost]
        public ActionResult Edit(Employee e)
        {
            if (ModelState.IsValid)
            {
                employee.Edit(e);
                return RedirectToAction("Index");
            }
            return View();
        }
        //Delete Employee
        public ActionResult Delete(int id)
        {
            employee.Delete(id);
            return RedirectToAction("Index");
        }
        //List policies of employee
        public ActionResult PoliciesOfEmp(int id)
        {
            ViewBag.EmpId = id;
            return View(poe.GetAll().Where(x => x.EmployeeId == id));
        }

        //Delete Policy of employee
        public ActionResult DeletePolicyOfEmployee(int policyId)
        {
            var rs = poe.GetAll().Where(x => x.PolicyId == policyId).FirstOrDefault();
            var empId = rs.EmployeeId;
            poe.Delete(rs);
            return RedirectToAction("PoliciesOfEmp", new { id = empId});
        }
    }
}