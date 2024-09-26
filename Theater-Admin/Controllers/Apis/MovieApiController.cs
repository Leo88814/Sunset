using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;
using WebGrease.Configuration;

namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("Apis/Movie")]
    public class MovieApiController : ApiController
    {
        private readonly MovieService _service;
        IMovieRepository _repo = new MovieRepository();

        public MovieApiController()
        {
            _service = new MovieService(_repo);
        }

        [Route("GetMovies")]
        [HttpGet]
        public IHttpActionResult GetMovies()
        {
            var movies = _service.GetAllMovies();

            return Ok(movies);
        }


       
        public IHttpActionResult GetMovie(int id)
        {
            var movie = _service.GetMovieById(id);
            if (movie == null)
                return NotFound();

            return Ok(movie);
        }


        [HttpPost]
        [Route("Create")]
        public IHttpActionResult PostMovie(MovieDto movie)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

           _service.AddMovie(movie);
            return StatusCode(System.Net.HttpStatusCode.NoContent);


        }


        [Route("Update/{dto.id}")]
        [HttpPut]
        public IHttpActionResult PutMovie(MovieDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

  

            _service.UpdateMovie(dto);
            return StatusCode(System.Net.HttpStatusCode.NoContent);
        }

        //// DELETE api/movies/5
        //public IHttpActionResult DeleteMovie(int id)
        //{
        //    var movie = _movieService.GetMovieById(id);
        //    if (movie == null)
        //        return NotFound();

        //    _movieService.DeleteMovie(id);
        //    return Ok(movie);
        //}
    }
}

