using Sunset.WebAPI.Site.Models;
using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Services;
using Sunset.WebAPI.Site.Models.ViewModels;
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

		public ActionResult ChangeProfile()
		{
			return View();
		}

		public ActionResult ChangePassword()
		{
			return View();
		}
		[Authorize]
		[HttpPost]
		public ActionResult ChangePassword(ChangePasswordVm vm)
		{
			string account = User.Identity.Name;
			Result result = HandleChangePassword(account, vm);

			if (result.IsSuccess)
			{
                TempData["SuccessMessage"] = "密碼已成功更改！";
              
                return RedirectToAction("ChangePassword", "MemberLogin"); //更新成功，回到會員中心頁
			}

			ModelState.AddModelError(string.Empty, result.ErrorMessage);
			return View(vm);
		}

		private Result HandleChangePassword(string account, ChangePasswordVm vm)
		{
			var service = new MemberService();
			try
			{
				ChangePasswordDto dto = WebApiApplication._mapper.Map<ChangePasswordDto>(vm);
				service.ChangePassword(account, dto);

				return Result.Success();
			}
			catch (Exception ex)
			{
				return Result.Fail(ex.Message);
			}
		}

		public ActionResult Logout()
		{
			Session.Abandon();
			FormsAuthentication.SignOut();

			return RedirectToAction("Index", "Home");
		}
	}
}