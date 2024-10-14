using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;
using Theater_Admin.Models.Vms;

namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("apis/aud")]
    public class AuditoriunApiController : ApiController
    {
        private readonly AuditoriumService _service;
        IAuditoriumRepository _repo = new AuditoriumRepository();

        public AuditoriunApiController()
        {
            _service = new AuditoriumService(_repo);
        }
        [Route("GetAll")]
        [HttpGet]
        public IHttpActionResult GetllAuditorium()
        {
           var auditoriums = _service.GetAllAuditoriums();
            return Ok(auditoriums);
        }


        [Route("edit/{vm.id}")]
        [HttpPut]
        public IHttpActionResult EditAuditorium(AuditoriumVm vm)
        {
            AuditoriumDto dto = MvcApplication._mapper.Map<AuditoriumDto>(vm);
            _service.UpdateAuditorium(dto);
            return Ok(dto);
        }
    }
}
