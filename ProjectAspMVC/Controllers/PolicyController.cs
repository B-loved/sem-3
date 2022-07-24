using HealthInsuranceService.Data;
using HealthInsuranceService.Serveices;
using HealthInsuranceService.Serveices.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace ProjectAspMVC.Controllers
{
    [Filter.Autorize]
    public class PolicyController : Controller
    {
        PolicyService policy;
        PolicyRequestService policyRequest;
        
        public PolicyController()
        {
            policy = new PolicyService();
            policyRequest = new PolicyRequestService();
        }
        // GET: Policy
        
        public ActionResult Index(int? page, string key)
        {
            int _page = page ?? 1;
            int _pageSize = 2;
            var data = policy.GetAll().ToList();
            if (!String.IsNullOrEmpty(key))
            {
                data = data.Where(x => x.PolicyName.ToLower().Contains(key.ToLower())).ToList();
                ViewBag.key = key;
            }
            return View(data.OrderBy(x=>x.Id).ToPagedList(_page, _pageSize));
        }
        public ActionResult AddRequest(int id)
        {
            ViewBag.empId = id;
            return View(policyRequest.Get(id));
        }
        [HttpPost]
        public string AddRequest(int empId, int pId) {
            //var p = new PolicyRequest { RequestDate = DateTime.Now, EmployeeId = 2, PolicyId = 1, Status = "true"};
            PolicyRequest pr = new PolicyRequest() { 
                EmployeeId = empId, PolicyId = pId, RequestDate = DateTime.Now.Date,Status = "waiting"
            };
            var request = policyRequest.Add(pr);

            if (request == null)
            {
                return "Order failse";
            }
            else
            {
                return "Order success!";
            }
        }
        public ActionResult Preview(int empId, int policId)
        {
            ViewBag.policy = policy.Get(policId);
            
            var pre = new PolicyRequest();
            pre.EmployeeId = empId;
            pre.PolicyId = policId;
            pre.RequestDate = DateTime.Now;
            pre.Status = "waiting";
            
            return PartialView("Preview", pre);
        }
        public ActionResult Search(string search)
        {
            return View();
        }
        public ActionResult DetailOrder(int? id)
        {
            return View(policyRequest.Get(id));
        }
    }

}