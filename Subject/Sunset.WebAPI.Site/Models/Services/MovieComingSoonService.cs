using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Services
{
	public class MovieComingSoonService
	{
		private readonly MovieComingSoonRepository _repository;

		public MovieComingSoonService()
		{
			_repository = new MovieComingSoonRepository();
		}

		public List<MovieComingSoonDto> GetInfo()
		{
			var path = "../images/";
			var indexMovie = _repository.GetMovies();
			MatchPath(indexMovie, path); // 呼叫 MatchPath 方法來修正路徑
			return indexMovie;
		}


		private void MatchPath(List<MovieComingSoonDto> movies, string path)
		{
			foreach (var movie in movies)
			{
				movie.MainPicture = path + movie.MainPicture;
			}
		}
		public List<MovieComingSoonDto> GetMovies()
		{
			return _repository.GetMovies();
		}
	}
}