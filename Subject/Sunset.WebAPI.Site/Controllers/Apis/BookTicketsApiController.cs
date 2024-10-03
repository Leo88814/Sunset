using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Repositories;
using Sunset.WebAPI.Site.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Sockets;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Apis
{

	public class BookTicketsApiController : ApiController
	{
		private readonly BookTicketsService _service;

		public BookTicketsApiController()
		{
			_service = new BookTicketsService();
		}

		public IHttpActionResult GetMovie()
		{
			var allMovie = _service.GetAllMovieInfo();

			return Ok(allMovie);
		}

		[HttpGet]
		[Route("api/BookTicketsApi/ChoiceDates/{id}")]
		public IHttpActionResult GetDate(int id)
		{
			var allDate = _service.GetDateInfo(id);

			if (allDate == null)
			{
				return NotFound();
			}
			return Ok(allDate);
		}
	}
}
