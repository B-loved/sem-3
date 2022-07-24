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
    public class CompanyController : Controller
    {
        private CompanyService cpn;

        public CompanyController()
        {
            cpn = new CompanyService();
        }
        // List of companies
        public ActionResult Index(int? page, string search)
        {
            ViewBag.Search = search;
            var _page = page ?? 1;
            var data = cpn.GetAll().OrderBy(x => x.CompanyId)
                .Where(x => {
                    if (String.IsNullOrEmpty(search))
                    {
                        return true;
                    }
                    return x.CompanyName.ToLower().Contains(search.ToLower());
                })
                .ToPagedList(_page, 2);
            return View(data);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Company company)
        {
            if (ModelState.IsValid)
            {
                cpn.Add(company);
                ViewBag.message = "Add new company success!";

                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Edit(int id)
        {
            return View(cpn.Get(id));
        }
        [HttpPost]
        public ActionResult Edit(Company company)
        {
            if (ModelState.IsValid)
            {
                cpn.Edit(company);
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Delete(int id)
        {
            cpn.Delete(id);
            return RedirectToAction("Index");
        }
    }
}