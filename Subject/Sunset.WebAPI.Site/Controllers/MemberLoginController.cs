using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunset.WebAPI.Site.Controllers
{
    public class MemberLoginController : Controller
    {
		// GET: MemberLogin
		public ActionResult Register()
		{
			return View();
		}

		public ActionResult RegisterConfirm()
		{
			return View();
		}

		public ActionResult MemberLogin()
		{
			return View();
		}
	}
}