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
			var path = "~/images/";
			var MovieDate = _repo.GetMovieDate(id);
			MovieDate.MatchPath(path);

			return MovieDate;
		}

		internal object GetSeatInfo(int id)
		{
			var MovieSeats = _repo.GetMovieSeat(id);
			return MovieSeats;
		}
	}
}