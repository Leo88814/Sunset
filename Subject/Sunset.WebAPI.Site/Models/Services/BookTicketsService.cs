using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Exts;
using Sunset.WebAPI.Site.Models.Repositories;
using Sunset.WebAPI.Site.Repositories;
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
        public List<GetTicketsInfoDto> GetTicketsInfo()
        {
			return _repo.GetTicketsInfo();
        }
        public GetMovieScheduleDto GetMovieScheduleId(int movieId, int showdateId, int showtimeId)
		{
			return _repo.GetMovieScheduleId(movieId, showdateId, showtimeId);
		}

		public CheckOrderDto CheckOrder(int movieScheduleId, List<int> seatIds)
		{
			return _repo.CheckOrder(movieScheduleId, seatIds);
		}

		public Member GetMemberByEmail(string email)
		{
			return _repo.GetMemberByEmail(email);
		}

		public CurrentBalanceDto GetCurrentBalance(string memberId)
		{
			int memberIdInt = int.Parse(memberId);
			return _repo.GetCurrentBalance(memberIdInt);
		}

		public bool PostOrder(PostOrderDto dto, string memberId)
		{
			int memberIdInt = int.Parse(memberId);
			var timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
			var random = new Random();
			var randomNumber = random.Next(1000, 9999);

			var orderNumber = "MOV-" + timestamp + "-" + randomNumber;
			return _repo.PostOrder(dto, memberIdInt,orderNumber);
		}

        public GetCurrentOrderDto GetCurrentOrder(string memberId)
        {
            int memberIdInt = int.Parse(memberId);
            return _repo.GetCurrentOrder(memberIdInt);
        }
    }
}