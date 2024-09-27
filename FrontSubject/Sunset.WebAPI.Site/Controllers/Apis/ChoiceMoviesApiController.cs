using Sunset.WebAPI.Site.Models.Repositories;
using Sunset.WebAPI.Site.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    [RoutePrefix("api/ChoiceMoviesApi")]
    public class ChoiceMoviesApiController : ApiController
    {
        public IHttpActionResult Get()
        {
            var allMovie = new BookTicketsService().GetInfo();

            return Ok(allMovie);
        }

        [Route("Date/{id}")]
        public IHttpActionResult GetDate(int id)
        {
            var date = new BookTicketsRepository().GetDate(id);
            return Ok(date);

        }
        //[Route("Time/{id}")]
        //public IHttpActionResult GetTime(int id)
        //{
        //    var time = new BookTicketsRepository().GetTime(id);
        //    return Ok(time);

        //}
    }
}
