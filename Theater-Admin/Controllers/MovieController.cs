using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;

namespace Theater_Admin.Controllers
{
   
    public class MovieController : Controller
    {
        private MovieService _service;
        private IMovieRepository _repo = new MovieRepository();
        public MovieController()
        {
            _service = new MovieService(_repo);
        }
        // GET: Movie
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

       
        public ActionResult Add()
        {
            return View();
        }

       
        public ActionResult Edit(int id)
        {
            var movie = _service.GetMovieById(id);
            return View(movie);
        }

        public ActionResult Delete()
        {
            return View();
        }


    }
}