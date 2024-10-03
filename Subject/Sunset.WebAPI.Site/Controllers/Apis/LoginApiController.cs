using Sunset.WebAPI.Site.Models;
using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Services;
using Sunset.WebAPI.Site.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Principal;
using System.Web;
using System.Web.Http;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    public class LoginApiController : ApiController
    {
		private readonly MemberService _service;

		public LoginApiController()
		{
			_service = new MemberService();
		}

		[HttpPost]
		public IHttpActionResult Login(MemberLoginVm vm)
		{

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Result result = HandleLogin(vm);
			if (result.IsSuccess)
			{
				(string url, string token) = ProcessLogin(vm.Email);

				var response = new
				{
					Success = true,
					RedirectUrl = url,
					AuthToken = token
				};

				return Ok(response);
			}
			else
			{
				return BadRequest(result.ErrorMessage);
			}
		}

		private (string url, string token) ProcessLogin(string email)
		{
			var roles = string.Empty; // 沒有用到角色權限，所以存入空白

			// 建立一張認證票
			var ticket = new FormsAuthenticationTicket(
				1,                              // 版本別，沒有特別用處
				email,
				DateTime.Now,                   // 發行日
				DateTime.Now.AddHours(2),        // 到期日
				false,                          // 是否存續
				roles,                          // userdata
				"/"                             // cookie位置
			);

			// 將它加密
			var token = FormsAuthentication.Encrypt(ticket);

			// 取得 return url
			var url = FormsAuthentication.GetRedirectUrl(email, true);  //第二個引數沒有用處

			return (url, token);
		}

		private Result HandleLogin(MemberLoginVm vm)
		{
			try
			{
				MemberLoginDto dto = WebApiApplication._mapper.Map<MemberLoginDto>(vm);
				return _service.ValidateLogin(dto);
			}
			catch (Exception ex)
			{
				return Result.Fail(ex.Message);
			}
		}
	}
}
