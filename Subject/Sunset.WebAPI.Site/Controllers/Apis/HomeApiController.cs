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
		[Route("api/HomeApi/MainPicture")]
		public IHttpActionResult GetMainPicture()
		{
			var mainPicture = _service.GetMainPicture();

			if (mainPicture == null)
			{
				return NotFound();
			}
			return Ok(mainPicture);
		}

        [HttpGet]
        [Route("api/HomeApi/TopFive")]
        public IHttpActionResult GetTopFive()
        {
            var topFive = _service.GetTopFive();

            if (topFive == null)
            {
                return NotFound();
            }
            return Ok(topFive);
        }
    }
}
