using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI.WebControls;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Services;
using Theater_Admin.Models.Vms;

namespace Theater_Admin.Controllers
{
    public class UsersController : Controller
    {
        
        public ActionResult test()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }

        [Authorize]
        public ActionResult Main()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Login(LoginVm vm)
        {
            if (ModelState.IsValid)
            {
                Result result = handleLogin(vm);
                if (result.IsSuccess)
                {
                    (string url, HttpCookie cookie) = ProcessLogin(vm.Account);
                    Response.Cookies.Add(cookie);
                    return Redirect(url);
                  
                }

                ModelState.AddModelError(string.Empty, result.ErrorMessage);

            }
            return View(vm);

        }

        private (string url, HttpCookie cookie) ProcessLogin(string account)
        {
            var roles = string.Empty;
            var ticket = new FormsAuthenticationTicket(1, account, DateTime.Now, DateTime.Now.AddDays(2), false, roles, "/");

            var value = FormsAuthentication.Encrypt(ticket);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, value);

            var url = FormsAuthentication.GetRedirectUrl(account, true);
            return (url, cookie);
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();

            return RedirectToAction("Login", "Users");
        }



        private Result handleLogin(LoginVm vm)
        {
            try
            {
                var service = new UserService();

                LoginDto dto = MvcApplication._mapper.Map<LoginDto>(vm);

                Result validateResult = service.ValidateLogin(dto);


                return validateResult;


            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            }
        }

    }
}