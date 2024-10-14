using Sunset.WebAPI.Site.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    public class GetTicketsInfoApiController : ApiController
    {
        private readonly BookTicketsService _service;
        public GetTicketsInfoApiController()
        {
            _service = new BookTicketsService(); 
        }
        [HttpGet]
        [Route("api/GetTicketsInfoApi/")]
        public IHttpActionResult GetTicketsInfo()
        {
            var ticket = _service.GetTicketsInfo();

            return Ok(ticket);
        }
    }
}
