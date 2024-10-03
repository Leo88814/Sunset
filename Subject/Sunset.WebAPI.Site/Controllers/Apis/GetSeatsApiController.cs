using Sunset.WebAPI.Site.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    public class GetSeatsApiController : ApiController
    {
		private readonly BookTicketsService _service;

		public GetSeatsApiController()
		{
			_service = new BookTicketsService();
		}

		[HttpGet]
		[Route("api/GetSeatsApi/ChoiceSeats/{movieId}/{showdateId}/{showtimeId}")]
		public IHttpActionResult GetAllSeat(int movieId, int showdateId, int showtimeId)
		{
			var allSeat = _service.GetChoicedSeatInfo(movieId, showdateId, showtimeId);

			if (allSeat == null)
			{
				return NotFound();
			}
			return Ok(allSeat);
		}

	}
}
