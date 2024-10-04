using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Exts;
using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Services
{
	public class HomeService
	{
		private readonly HomeRepository _repo;
        public HomeService()
        {
			_repo = new HomeRepository();
		}

        public List<HomeDto.HomeIndexPicture> GetMainPicture()
		{
			var path = "../images/";
			var indexMovie = _repo.GetHomePicture();
			indexMovie.MatchPath(path);

			return indexMovie;
		}
	}
}