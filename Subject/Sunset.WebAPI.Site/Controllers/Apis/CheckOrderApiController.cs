using Sunset.WebAPI.Site.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    public class CheckOrderApiController : ApiController
    {
        private readonly BookTicketsService _service;

        public CheckOrderApiController()
        {
            _service = new BookTicketsService();
        }
        [HttpGet]
        [Route("api/CheckOrderApi/GetMovieScheduleId/{movieId}/{showdateId}/{showtimeId}")]
        public IHttpActionResult GetMovieSchedule(int movieId, int showdateId, int showtimeId)
        {
            var movieSchedule = _service.GetMovieScheduleId(movieId, showdateId, showtimeId);

            if (movieSchedule == null)
            {
                return NotFound();
            }
            return Ok(movieSchedule);
        }

        [HttpGet]
        [Route("api/CheckOrderApi/CheckOrder/{movieScheduleId}/{seatIds}")]
        public IHttpActionResult CheckCurrentOrder(int movieScheduleId, List<int> seatIds/*, int memberId*/)
        {
			
			var checkOrder = _service.CheckOrder(movieScheduleId, seatIds /*, showtimeId*/);

            if (checkOrder == null)
            {
                return NotFound();
            }
            return Ok(checkOrder);
        }
    }
}
