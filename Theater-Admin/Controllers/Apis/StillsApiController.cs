using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Services.Description;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;
using Theater_Admin.Models.Vms;

namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("apis/stills")]
    public class StillsApiController : ApiController
    {
        private readonly StillService _service;
        IStillRepository _repo = new StillRepository();

        public StillsApiController()
        {
            _service = new StillService(_repo);
        }

        [HttpGet]
        [Route("getall/{movieId}")]
        public IHttpActionResult GetAllStills(int movieId)
        {
            var still = _service.GetAllStills(movieId);

            return Ok(still);
        }

        [Route("Create")]
        public IHttpActionResult AddStill(StillVm vm)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            StillDto stillDto = MvcApplication._mapper.Map<StillDto>(vm);


            try
            {
                _service.AddStill(stillDto);
                return StatusCode(HttpStatusCode.NoContent);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [Route("UploadImage")]
        public IHttpActionResult UploadImage()
        {
            try
            {
                if (HttpContext.Current.Request.Files.Count > 0)
                {
                    var file = HttpContext.Current.Request.Files[0];
                    var fileName = _service.UploadMovieImage(file);
                    if (fileName != null)
                    {
                        return Ok(new { FileName = fileName });
                    }
                }
                return BadRequest("No file uploaded");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [Route("delete/{Stillid}")]
        public IHttpActionResult DeleteStill(int stillId)
        {
            _service.DeleteStill(stillId);

            return Ok();
        }
    }
}
