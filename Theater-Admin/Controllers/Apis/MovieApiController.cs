using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;
using WebGrease.Configuration;
using Newtonsoft.Json;
using Theater_Admin.Models.Vms;
using System.Threading.Tasks;
namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("apis/movie")]
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



        //public IHttpActionResult GetMovie(int id)
        //{
        //    var movie = _service.GetMovieById(id);
        //    if (movie == null)
        //        return NotFound();

        //    return Ok(movie);
        //}


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
   
        [HttpPost]
        [Route("Create")]
        public IHttpActionResult PostMovie(MovieVm movieVm)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            MovieDto movieDto = MvcApplication._mapper.Map<MovieDto>(movieVm);


            try
            {
                _service.AddMovie(movieDto);
                return StatusCode(HttpStatusCode.NoContent);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("Get{id}")]
        public IHttpActionResult GetMovie(int id)
        {


            var movie = _service.GetMovieById(id);

            if (movie == null)
            {
                return NotFound();
            }

            return Ok(movie);
        }

        [Route("Update/{dto.id}")]
        [HttpPut]
        public IHttpActionResult EditMovie(MovieVm vm)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            MovieDto dto = MvcApplication._mapper.Map<MovieDto>(vm);
  

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

