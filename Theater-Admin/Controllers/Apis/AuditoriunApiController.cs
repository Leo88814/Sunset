using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;

namespace Theater_Admin.Controllers.Apis
{
    public class AuditoriunApiController : ApiController
    {
        private readonly AuditoriumService _service;
        IAuditoriumRepository _repo = new AuditoriumRepository();

        [Route("GetAll")]
        [HttpGet]
        public IHttpActionResult GetllAuditorium()
        {
         
            return Ok();
        }
    }
}
