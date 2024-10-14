using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http.Results;
using static Sunset.WebAPI.Site.Models.Dtos.CheckOrderDto;
using static Sunset.WebAPI.Site.Models.Dtos.ChoiceDatesDto;
using static Sunset.WebAPI.Site.Models.Dtos.GetCurrentOrderDto;


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
				 .Where(m =>m.PremiereDate <= DateTime.Today)
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
			.Where(m => m.ShowDate.ShowTimeDate >= DateTime.Today)
			.OrderBy(m => m.ShowDate.ShowTimeDate)
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
				}).OrderBy(t => t.StartTime).ToList()
			})
			.OrderBy(item => item.ShowtimeDate)
			.ToList();
			return allDate;
		}

		public List<ChoiceSeatsDto> GetChoicedSeat(int movieId, int showdateId, int showtimeId)
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
		public CheckOrderDto CheckOrder(int movieScheduleId, List<int> seatIds)
		{

			var movieSchedule = _db.MovieReleaseSchedules
				.Where(mr => mr.Id == movieScheduleId)
				.Select(mr => new MovieSchedule
				{	
					Id = mr.MovieInfo.Id,
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

			return new CheckOrderDto
			{
				MovieScheduleInfo = movieSchedule,
				ChoiceSeatInfo = seats,
			};
		}

        public List<GetTicketsInfoDto> GetTicketsInfo()
        {
			var ticket = _db.Tickets
				.Select(t => new GetTicketsInfoDto
                {
                Id = t.Id,
                TicketType = t.TicketType,
                TicketPrice = t.TicketPrice
                })
            .ToList();

			return ticket;
        }

		public Member GetMemberByEmail(string email)
		{
			return _db.Members.FirstOrDefault(m => m.Email == email);
		}

		public CurrentBalanceDto GetCurrentBalance(int memberId)
		{
			var currentBalance = _db.Members
				.Where(m => m.Id == memberId)
				.Select(m => new CurrentBalanceDto
				{
					Id = m.Id,
					CurrentBalance = m.CurrentBalance
				})
				.FirstOrDefault();

			return  currentBalance;
		}

		public bool PostOrder(PostOrderDto dto, int memberId,string orderNumber)
		{
			var member = _db.Members.FirstOrDefault(o => o.Id == memberId);
			if (member == null)
			{
				return false;
			}
			else
			{
				// 建立 Order 物件並新增到 DbSet 中
				var order = new Order
				{
					MovieReleaseScheduleId = dto.DataForOrder.MovieReleaseScheduleId,
					MemberId = memberId,
					OrderDate = DateTime.Now,
					TotalTicketCount = dto.DataForOrder.TotalTicketCount,
					TotalAmount = dto.DataForOrder.TotalAmount,
					PaymentStatus = "已付款",
					OrderNumber = orderNumber
				};
				_db.Orders.Add(order); 
				var resp = _db.SaveChanges();
				// 建立並新增 OrderDetail
				var new_order = _db.Orders.FirstOrDefault(o => o.OrderNumber == orderNumber);
				foreach (var detailData in dto.DataForOrderDetail)
				{

					var orderDetail = new OrderDetail
					{
						TicketId = detailData.TicketId,
						OrderId = new_order.Id, // 關聯到已經追蹤的 Order
						SeatId = detailData.SeatId,
						TicketNumber = GenerateTicketNumber() // 假設這是一個生成票號的方法
					};
					//Console.Write(orderDetail);
					_db.OrderDetails.Add(orderDetail);
					_db.SaveChanges();
				}

				// 建立並新增 MovieRating
				var movieRating = new MovieRating
				{
					MemberId = memberId,
					MovieInfoId = dto.DataForMovieRating.MovieInfoId,
					Order = order, // 關聯到已經追蹤的 Order
					Rating = null
				};
				_db.MovieRatings.Add(movieRating);
                _db.SaveChanges();

                try
				{
                    member.CurrentBalance -= dto.DataForRemainingBalance.CurrentBalance;
                    _db.Entry(member).Property(m => m.CurrentBalance).IsModified = true;
                    _db.SaveChanges();
					return true;
				}
				catch (Exception ex)
				{
					Console.WriteLine(ex.Message);
					return false;
				}
			}
		}

        public GetCurrentOrderDto GetCurrentOrder(int memberIdInt)
        {
				var order = _db.Orders
					.Where(o => o.MemberId == memberIdInt)
					.OrderByDescending(o => o.OrderDate)
					.Select(o => new GetCurrentOrderDto
					{
						OrderDate = o.OrderDate,
						OrderNumber = o.OrderNumber,
						MovieName = o.MovieReleaseSchedule.MovieInfo.MovieName,
						ShowTimeDate = o.MovieReleaseSchedule.ShowDate.ShowTimeDate,
						StartTime = o.MovieReleaseSchedule.ShowTime.StartTime,
						AuditoriumName = o.MovieReleaseSchedule.Auditorium.AuditoriumName,
						TicketDetails = o.OrderDetails.Select(od => new TicketDetailDto
						{
							TicketNumber = od.TicketNumber,
							SeatNumber = od.Seat.SeatNumber,
		
						}).ToList()
					})
					.FirstOrDefault();
            return order;
        }

		private static readonly object _lock = new object();
		private static long _lastTicks = 0;

		private string GenerateTicketNumber()
		{
			string timestamp;
			int randomNumber;

			lock (_lock)
			{
				var now = DateTime.Now;
				if (now.Ticks <= _lastTicks)
				{
					now = new DateTime(_lastTicks + 1);
				}
				_lastTicks = now.Ticks;
				timestamp = now.Ticks.ToString();

				var random = new Random((int)(now.Ticks & 0xFFFFFFFF));
				randomNumber = random.Next(1000, 9999);
			}

			var ticketNumber = $"TIC-{timestamp}-{randomNumber}";
			return ticketNumber;
		}

      
    }
}