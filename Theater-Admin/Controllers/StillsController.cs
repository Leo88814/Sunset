using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;
using Theater_Admin.Models.Vms;

namespace Theater_Admin.Controllers
{
    public class StillsController : Controller
    {
        private StillService _service;
        private IStillRepository _repo = new StillRepository();
        public StillsController()
        {
            _service = new StillService(_repo);
        }
        // GET: Stills
        public ActionResult GetAllStills(/*int movieId*/)
        {
            //var stillPage = _service.GetAllStills(movieId);

            //return View(stillPage);
            return View();
        }



        public ActionResult AddStill()
        {
            return View();
        }
        public ActionResult Delete()
        {
            return View();
        }
    }
}