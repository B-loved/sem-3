using HealthInsuranceService.Data;
using HealthInsuranceService.Serveices;
using HealthInsuranceService.Serveices.Repository;
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
    public class PolicyController : Controller
    {
        private CompanyService company;
        private HospitalService hospital;
        private PolicyService policy;
        private PolicyRequestService request;
        private PolicyApprovalService approval;
        private PolicyOnEmployeeService policyOnEmployee;
        private EmployeeService employee;
        public PolicyController()
        {
            company = new CompanyService();
            hospital = new HospitalService();
            policy = new PolicyService();
            request = new PolicyRequestService();
            approval = new PolicyApprovalService();
            employee = new EmployeeService();
            policyOnEmployee = new PolicyOnEmployeeService();
        }
        #region Policies
        //List of policies
        public ActionResult Index(int? page, string search)
        {
            ViewBag.Search = search;
            int _page = page ?? 1;
            var data = policy.GetAll()
                .Where(x => {
                    if (String.IsNullOrEmpty(search))
                    {
                        return true;
                    }
                    return x.PolicyName.ToLower().Contains(search.ToLower());
                })
                .OrderBy(x => x.Id).ToPagedList(_page, 20);
            return View(data);
        }
        //Add policy
        public ActionResult AddPolicy()
        {
            ViewBag.CompanyId = new SelectList(company.GetAll(), "CompanyId", "CompanyName");
            ViewBag.HospitalId = new SelectList(hospital.GetAll(), "HospitalId", "Name");
            return View();
        }

        [HttpPost]
        public ActionResult AddPolicy(Policy p)
        {
            ViewBag.CompanyId = new SelectList(company.GetAll(), "CompanyId", "CompanyName");
            ViewBag.HospitalId = new SelectList(hospital.GetAll(), "HospitalId", "Name");
            if (ModelState.IsValid)
            {
                policy.Add(p);
                return RedirectToAction("Index");
            }
            return View();
        }
        //Edit Policy
        public ActionResult EditPolicy(int id)
        {
            var data = policy.Get(id);
            ViewBag.CompanyId = new SelectList(company.GetAll(), "CompanyId", "CompanyName", data.CompanyId);
            ViewBag.HospitalId = new SelectList(hospital.GetAll(), "HospitalId", "Name", data.HospitalId);
            
            return View(data);
        }
        [HttpPost]
        public ActionResult EditPolicy(Policy p)
        {
            ViewBag.CompanyId = new SelectList(company.GetAll(), "CompanyId", "CompanyName");
            ViewBag.HospitalId = new SelectList(hospital.GetAll(), "HospitalId", "Name");
            if (ModelState.IsValid)
            {
                policy.Edit(p);
                return RedirectToAction("Index");
            }
            return View();
        }
        //Delete Policy
        public ActionResult DeletePolicy(int id)
        {
            policy.Delete(id);
            return RedirectToAction("Index");
        }
        #endregion

        #region Related to the request
        //List of Policy Requested
        public ActionResult RequestPolicy()
        {
            return View();
        }
        public ActionResult GetData(int? page, string status)
        {
            int _page = page ?? 1;
            var data = request.GetAll().OrderBy(x => x.RequestId).Where((x) => {
                if (status == "All")
                {
                    return true;
                }
                else
                {
                    return x.Status.Equals(string.IsNullOrEmpty(status) ? "waiting" : status);
                }
            }).ToPagedList(_page, 20);
            return PartialView("_GetRequest", data);
        }
        //Details of Request
        public ActionResult RequestDetails(int id)
        {
            var data = request.Get(id);
            return View(data);
        }
        //View approval
        public ActionResult Accept(int id)
        {
            var r = request.Get(id);
            ViewBag.Id = r.RequestId;
            ViewBag.PolicyName = r.Policy.PolicyName;
            ViewBag.EmployeeName = r.Employee.FirstName + " " + r.Employee.LastName;
            return View();
        }
        //Accept Request
        [HttpPost]
        public ActionResult Accept(PolicyApproval arv)
        {
            var a = approval.Add(arv);
            if (a != null)
            {
                request.Get(arv.RequestId).Status = "Accepted";
                request.Save();
                return RedirectToAction("RequestPolicy");
            }
            else
            {
                return View();
            }
        }
        //Reject Request
        public ActionResult Reject(int id)
        {
            request.Get(id).Status = "Declined";
            return RedirectToAction("RequestPolicy");
        }
        #endregion

        #region Policy on Employee
        //Add Policy on Employee
        public ActionResult AddPolicyOnEmployee()
        {
            ViewBag.EmployeeId = new SelectList(
                employee.GetAll().Select(x => new { Id = x.Id, Name = x.FirstName + " " + x.LastName }),
                "Id", "Name"
                );
            ViewBag.PolicyId = new SelectList(policy.GetAll(), "Id", "PolicyName");
            return View();
        }
        [HttpPost]
        public ActionResult AddPolicyOnEmployee(PoliciesOnEmployee poe)
        {
            ViewBag.EmployeeId = new SelectList(
                employee.GetAll().Select(x => new { Id = x.Id, Name = x.FirstName + " " + x.LastName }),
                "Id", "Name"
                );
            ViewBag.PolicyId = new SelectList(policy.GetAll(), "Id", "PolicyName");
            if (ModelState.IsValid)
            {
                policyOnEmployee.Add(poe);
                return RedirectToAction("Index");
            }
            return View();
        }
        #endregion
    }
}