using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography.X509Certificates;
using System.Web.Http;
using System.Web.Routing;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;
using Theater_Admin.Models.Vms;

namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("apis/showtime")]
    public class ShowTimesApiController : ApiController
    {
        private readonly ShowtimeService _service;
        IShowTimeRepository _repo = new ShowtimeRepository();

        public ShowTimesApiController()
        {
            _service = new ShowtimeService(_repo);
        }


        [HttpGet]
        [Route("GetMoviesByIds")]
        public IHttpActionResult GetMoviesByIds(string ids)
        {
            var _db = new AppDbContext();
            if (string.IsNullOrEmpty(ids))
            {
                return BadRequest("No movie IDs provided");
            }

            var movieIds = ids.Split(',').Select(int.Parse).ToList();
            var movies = _db.MovieInfos
                .Where(m => movieIds.Contains(m.Id))
                .Select(m => new { m.Id, m.MovieName })
                .ToList();

            return Ok(movies);
        }

        [HttpGet]
        [Route("GetDatesByIds")]
        public IHttpActionResult GetDatesByIds(string ids)
        {
            var db = new AppDbContext();
            if (string.IsNullOrEmpty(ids))
            {
                return BadRequest("No date IDs provided");
            }

            var dateIds = ids.Split(',').Select(int.Parse).ToList();
            var dates = db.ShowDates
                .Where(d => dateIds.Contains(d.Id))
                .Select(d => new { d.Id, d.ShowTimeDate })
                .ToList();

            return Ok(dates);
        }

        [HttpGet]
        [Route("GetAll")]
        public IHttpActionResult GetAll(int id)
        {
            
           var allShowTime = _service.GetShowTimesInAud(id);
            return Ok(allShowTime);
        }


        [HttpPost]
        [Route("Create")]
        public IHttpActionResult CreateShowTime(ShowtimeVm vm)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {




                ShowtimeDto showTimeDto = MvcApplication._mapper.Map<ShowtimeDto>(vm);


                _service.AddShowTime(showTimeDto);
                return StatusCode(HttpStatusCode.NoContent);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpDelete]
        [Route("Delete/{id}")]
        public IHttpActionResult DeleteShowtime(int id)
        {
            try
            {
                _service.DeleteShowtime(id);
                return Ok(new { message = "場次已成功刪除" });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("GetAllOnAirMovies")]
        public IHttpActionResult GetAllOnAirMovies()
        {
            var _db = new AppDbContext();

            var movies = _db.MovieInfos.Where(x => x.OnAir == true).Select(x => new
            {
                x.Id,
                x.MovieName,
            }).ToList();
            return Ok(movies);
        }
    }
}
