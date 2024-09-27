using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;

namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("Apis/aud")]
    public class AuditoriunApiController : ApiController
    {
        private readonly AuditoriumService _service;
        IAuditoriumRepository _repo = new AuditoriumRepository();

        public AuditoriunApiController()
        {
            _service = new AuditoriumService();
        }
        [Route("GetAll")]
        [HttpGet]
        public IHttpActionResult GetllAuditorium()
        {
           var auditoriums = _service.GetAllAuditoriums();
            return Ok(auditoriums);
        }


        [Route("edit/{dto.Id}")]
        [HttpPut]
        public IHttpActionResult EditAuditorium(AuditoriumDto dto)
        {
            _service.UpdateAuditorium(dto);
            return Ok(dto);
        }
    }
}
