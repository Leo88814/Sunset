using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Repositories;
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
            var dbContext = new AppDbContext(); // 確保這裡有正確的 AppDbContext 初始化
            var repository = new MovieDetailRepository(dbContext);
            _blockbusterService = new MovieBlockbusterService();
            _detailService = new MovieDetailService(repository);
            _comingSoonService = new MovieComingSoonService();
        }

        [HttpGet]
        [Route("MovieBlockbuster")]
        public IHttpActionResult MovieBlockbuster()
        {
            var allMovie = _blockbusterService.GetInfo();
            return Ok(allMovie); // 確保返回JSON格式
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
