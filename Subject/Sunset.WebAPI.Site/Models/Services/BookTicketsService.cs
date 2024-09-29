using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Exts;
using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Services
{
	public class BookTicketsService
	{
		private readonly BookTicketsRepository _repo;

		public BookTicketsService()
		{
			_repo = new BookTicketsRepository();
		}
		public List<ChoiceMoviesDto> GetAllMovieInfo()
		{
			var path = "../images/";
			var indexMovie = _repo.GetAllMovie();
			indexMovie.MatchPath(path);

			return indexMovie;
		}

		public List<ChoiceDatesDto> GetDateInfo(int id)
		{
			var path = "../images/";
			var indexMovieDate = _repo.GetMovieDate(id);
			indexMovieDate.MatchPath(path);

			return indexMovieDate;
		}
	}
}