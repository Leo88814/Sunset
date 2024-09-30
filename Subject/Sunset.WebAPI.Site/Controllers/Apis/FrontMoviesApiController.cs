using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Services;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Api
{
    [RoutePrefix("api/FrontMoviesApiController")]
    public class FrontMoviesApiController : ApiController
    {
        private readonly MovieBlockbusterService _blockbusterService;
        private readonly MovieDetailService _detailService;
		private readonly MovieComingSoonService _comingSoonService;

		public FrontMoviesApiController()
        {
            _blockbusterService = new MovieBlockbusterService();
            _detailService = new MovieDetailService();
            _comingSoonService = new MovieComingSoonService();
		}

        [HttpGet]
        [Route("MovieBlockbuster")]
        public IHttpActionResult MovieBlockbuster()
        {
            var allMovie = _blockbusterService.GetInfo();
            return Ok(allMovie);
        }

		[HttpGet]
		[Route("MovieComingSoon")]
		public IHttpActionResult MovieComingSoon()
		{
			var allMovie = _comingSoonService.GetInfo();
			return Ok(allMovie);
		}

		[HttpGet]
		[Route("MovieComingSoonDetail")]
		public IHttpActionResult MovieComingSoonDetail(int id)
		{
			var detailMovie = _detailService.GetMovieDetailById(id);
			if (detailMovie == null)
			{
				return NotFound();
			}
			return Ok(detailMovie);
		}

		[HttpGet]
        [Route("MovieDetail")]
        public IHttpActionResult MovieDetail(int id)
        {
            var detailMovie = _detailService.GetMovieDetailById(id);
            if (detailMovie == null)
            {
                return NotFound();
            }
            return Ok(detailMovie);
        }
    }
}
