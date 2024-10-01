using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Results;
using static Sunset.WebAPI.Site.Models.Dtos.CheckOrderDto;
using static Sunset.WebAPI.Site.Models.Dtos.ChoiceDatesDto;


namespace Sunset.WebAPI.Site.Models.Repositories
{
	public class BookTicketsRepository
	{
		private readonly AppDbContext _db;

		public BookTicketsRepository()
		{

			_db = new AppDbContext();
		}

		public List<ChoiceMoviesDto> GetAllMovie()
		{

			var allMovie = _db.MovieInfos
				 .AsNoTracking()
				 .OrderBy(m => m.Id)
				 .Select(m => new ChoiceMoviesDto
				 {
					 Id = m.Id,
					 MovieName = m.MovieName,
					 MainPicture = m.MainPicture,
				 })
			 .ToList();

			return allMovie;
		}


		public List<ChoiceDatesDto> GetMovieDate(int id)
		{
			var allDate = _db.MovieReleaseSchedules
			.AsNoTracking()
			.Where(m => m.MovieInfoId == id)
			.GroupBy(sd => new
			{
				sd.MovieInfoId,
				sd.MovieInfo.MovieName,
				sd.MovieInfo.MainPicture,
				sd.ShowDate.Id,
				sd.ShowDate.ShowTimeDate
			})
			.Select(g => new ChoiceDatesDto
			{
				Id = g.Key.MovieInfoId,
				MovieName = g.Key.MovieName,
				MainPicture = g.Key.MainPicture,
				DateId = g.Key.Id, 
				ShowtimeDate = g.Key.ShowTimeDate,
				Times = g.Select(t => new ShowtimeDto
				{
					TimeId = t.ShowTime.Id,
					StartTime = t.ShowTime.StartTime,
				}).ToList()
			})
			.ToList();

			return allDate;
		}

		public List<ChoiceSeatsDto> GetChoicedSeat(int movieId,int showdateId,int showtimeId)
		{
			var choicedSeat = _db.Orders
            .Where(o => o.MovieReleaseSchedule.MovieInfoId == movieId
                     && o.MovieReleaseSchedule.ShowDateId == showdateId
                     && o.MovieReleaseSchedule.ShowTimeId == showtimeId)
            .Join(_db.OrderDetails,
                  o => o.Id,
                  od => od.OrderId,
                  (o, od) => new { Order = o, OrderDetail = od })
            .Join(_db.Seats,
                  joined => joined.OrderDetail.SeatId,
                  s => s.Id,
                  (joined, s) => new ChoiceSeatsDto
                  {
                      SeatId = s.Id,
                      SeatNumber = s.SeatNumber,
                      SeatStatus = s.SeatStatus
                  })
            .ToList();

            return choicedSeat;

		}

        public List<ChoiceSeatsDto> GetAllSeat()
        {
			var allSeats = _db.Seats
				.Select(s => new ChoiceSeatsDto
				{
					SeatId = s.Id,
					SeatNumber = s.SeatNumber,
					SeatStatus = s.SeatStatus,
				}).ToList();

			return allSeats;
        }

        public GetMovieScheduleDto GetMovieScheduleId(int movieId, int showdateId, int showtimeId)
        {
            var movieScheduleId = _db.MovieReleaseSchedules
                .Where(mr => mr.MovieInfoId == movieId
                      && mr.ShowDateId == showdateId
                      && mr.ShowTimeId == showtimeId)
				.Select(mr => mr.Id)
				.FirstOrDefault();

            return new GetMovieScheduleDto 
			{ Id = movieScheduleId };
        }
        public CheckOrderDto CheckOrder(int movieScheduleId, List<int> seatIds/*, int memberId*/) 
		{
			var movieSchedule = _db.MovieReleaseSchedules
				.Where(mr => mr.Id == movieScheduleId)
				.Select(mr => new MovieSchedule
				{
					MovieName = mr.MovieInfo.MovieName,
					MainPicture = mr.MovieInfo.MainPicture,
					ShowtimeDate = mr.ShowDate.ShowTimeDate,
					StartTime = mr.ShowTime.StartTime,
					AuditoriumName = mr.Auditorium.AuditoriumName,
				}).FirstOrDefault();

			var seats = _db.Seats
                 .Where(s => seatIds.Contains(s.Id))
				.Select(s => new ChoicedSeats
                {
					Id = s.Id,
					SeatNumber = s.SeatNumber
				}).ToList();

			//var member = _db.Members
			//	.Where(m => m.Id == memberId)
			//	.Select(m => new MemberCurrentBalance
			//	{
			//		Id = m.Id,
			//		CurrentBalance = m.CurrentBalance,
			//	}).FirstOrDefault();

            return new CheckOrderDto
            {
                MovieScheduleInfo = movieSchedule,
                ChoiceSeatInfo = seats,
                //MemberBalance = member
            };
        }

       
    }
}