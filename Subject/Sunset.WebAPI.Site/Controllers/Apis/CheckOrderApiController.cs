using Sunset.WebAPI.Site.Models.EFModels;
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
        [Route("api/CheckOrderApi/CheckOrder/{movieScheduleId}/{seats}")]
        public IHttpActionResult CheckCurrentOrder(int movieScheduleId, string seats)
        {

            List<int> seatIds;
            try
            {
                seatIds = seats.Split(',').Select(int.Parse).ToList();
            }
            catch (FormatException)
            {
                return BadRequest("Invalid seat IDs format");
            }

            var checkOrder = _service.CheckOrder(movieScheduleId, seatIds);

            if (checkOrder == null)
            {
                return NotFound();
            }
            return Ok(checkOrder);
        }

    }
}
