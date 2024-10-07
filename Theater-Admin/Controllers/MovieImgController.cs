using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;

namespace Theater_Admin.Controllers
{
    public class MovieImgController : Controller
    {

        public MovieImgController()
        {
            
        }
        // GET: MovieImg
        public ActionResult Index()
        {
            return View();
        }

        [Route("{id}/AllStills")]
        public ActionResult MovieStills(int movieId)
        {
            return View();
        }
    }
}