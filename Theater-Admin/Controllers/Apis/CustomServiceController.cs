using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.InteropServices;
using System.Web.Http;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Services;
using Theater_Admin.Models.Vms;

namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("apis/customqa")]
    
    public class CustomServiceController : ApiController
    {

        private CustomQAService _service;

        public CustomServiceController()
        {
            _service = new CustomQAService();
        }

        [Route("update/{dto.Id}")]
        [HttpPut]
        public IHttpActionResult Edit(CustomServiceVm vm)
        {
            CustomServiceDto dto = MvcApplication._mapper.Map<CustomServiceDto>(vm);
            _service.Update(dto);

            return Ok(dto);
        }

        [Route("getall")]
        [HttpGet]
        public IHttpActionResult GetAll()
        {

            var dtos = _service.GetAll();
            return Ok(dtos);
        }
    }
}
