using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
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

  //      [HttpPost]
  //      [Route("api/MembersApi/Login")]
  //      public IHttpActionResult Login()
		//{
		//	var memberinfo = _service.Login();

		//	return Ok(memberinfo);
		//}


    }
}
