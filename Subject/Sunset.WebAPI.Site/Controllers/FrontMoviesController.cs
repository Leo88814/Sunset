using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunset.WebAPI.Site.Controllers
{
    public class FrontMoviesController : Controller
    {
        public ActionResult MovieBlockbuster()
        {
            return View();
        }
        public ActionResult MovieDetail()
        {
            return View();
        }
        public ActionResult MovieComingSoon()
        {
            return View();
        }
        public ActionResult MovieComingSoonDetail()
        {
            return View();
        }
    }
}