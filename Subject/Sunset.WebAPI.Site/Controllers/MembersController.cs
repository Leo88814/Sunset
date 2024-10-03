using Sunset.WebAPI.Site.Models.ViewModels;
using Sunset.WebAPI.Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sunset.WebAPI.Site.Models.Services;
using Sunset.WebAPI.Site.Models.Dtos;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Sunset.WebAPI.Site.Controllers
{
	public class MembersController : Controller
	{

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