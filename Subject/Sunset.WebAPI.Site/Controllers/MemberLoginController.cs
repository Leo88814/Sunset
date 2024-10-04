using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

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
		

		public ActionResult Logout()
		{
			Session.Abandon();
			FormsAuthentication.SignOut();

			return RedirectToAction("MemberLogin", "MemberLogin");
		}
	}
}