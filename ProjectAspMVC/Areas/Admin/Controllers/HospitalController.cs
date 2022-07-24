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
    public class HospitalController : Controller
    {
        private HospitalService hospital;
        public HospitalController()
        {
            hospital = new HospitalService();
        }
        // GET: Admin/Hospital
        public ActionResult Index(int? page, string search)
        {
            ViewBag.Search = search;
            var _page = page ?? 1;
            var data = hospital.GetAll()
                .Where(x => {
                    if (String.IsNullOrEmpty(search))
                    {
                        return true;
                    }
                    return x.Name.ToLower().Contains(search.ToLower());
                })
                .OrderBy(x => x.HospitalId).ToPagedList(_page, 20);
            return View(data);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Hospital h)
        {
            if (ModelState.IsValid)
            {
                hospital.Add(h);
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Edit(int id)
        {
            return View(hospital.Get(id));
        }
        [HttpPost]
        public ActionResult Edit(Hospital h)
        {
            if (ModelState.IsValid)
            {
                hospital.Edit(h);
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Delete(int id)
        {
            return RedirectToAction("Index");
        }
    }
}