using Sunset.WebAPI.Site.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    public class HomeApiController : ApiController
    {
		private readonly HomeService _service;
        public HomeApiController()
        {
            _service = new HomeService();
        }

		[HttpGet]
		[Route("api/HomeApi/")]
		public IHttpActionResult GetMainPicture(int id)
		{
			var mainPicture = _service.GetMainPicture(id);

			if (mainPicture == null)
			{
				return NotFound();
			}
			return Ok(mainPicture);
		}
	}
}
