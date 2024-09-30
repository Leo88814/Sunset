using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunset.WebAPI.Site.Controllers
{
    public class LoginsController : Controller
    {
        public ActionResult Login()
        {
            return View();
        }
    }
}