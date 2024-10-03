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
			var movieDate = _repo.GetMovieDate(id);
			movieDate.MatchPath(path);

			return movieDate;
		}

		public List<ChoiceSeatsDto> GetChoicedSeatInfo(int movieId, int showdateId, int showtimeId)
		{
			var choicedSeats = _repo.GetChoicedSeat(movieId, showdateId, showtimeId);
			var allSeats = _repo.GetAllSeat();

			allSeats.ForEach(se => {
				if (choicedSeats.Any(c => c.SeatId == se.SeatId))
				{
					se.SeatStatus = false;
				}
			});
			return allSeats;
		}
		public GetMovieScheduleDto GetMovieScheduleId(int movieId, int showdateId, int showtimeId)
		{
			var movieScheduleId = _repo.GetMovieScheduleId(movieId, showdateId, showtimeId);


			return movieScheduleId;
		}

		public CheckOrderDto CheckOrder(int movieScheduleId, List<int> seatIds/*, int memberId*/)
		{
			var orderdetail = _repo.CheckOrder(movieScheduleId, seatIds/*, memberId*/);

			return orderdetail;
		}
	}
}