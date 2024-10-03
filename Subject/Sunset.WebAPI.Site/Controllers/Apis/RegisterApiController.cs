using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    public class RegisterApiController : ApiController
    {
		private readonly MemberService _service;
		public RegisterApiController()
		{
			_service = new MemberService();
		}

		public IHttpActionResult RegisterMember(RegisterDto dto)
		{
			_service.Register(dto);

			return Ok(dto);
		}
	}
}
