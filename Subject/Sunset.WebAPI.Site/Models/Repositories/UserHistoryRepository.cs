using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Sunset.WebAPI.Site.Repositories
{
	public class UserHistoryRepository
	{
		private readonly AppDbContext _context;

		public UserHistoryRepository(AppDbContext context)
		{
			_context = context;
		}

		public List<UserHistoryDto> GetUserHistoryByMemberId(string memberId)
		{
			var orders = _context.Orders
				.Where(o => o.MemberId.ToString() == memberId) // 確保 MemberId 是字串類型
				.Include(o => o.MovieReleaseSchedule) // 包含導航屬性
				.Include(o => o.MovieReleaseSchedule.MovieInfo) // 包含導航屬性
				.Include(o => o.MovieReleaseSchedule.ShowTime) // 包含 ShowTime 導航屬性
				.Include(o => o.MovieReleaseSchedule.ShowDate) // 包含 ShowDate 導航屬性
				.Include(o => o.MovieRatings) // 包含 MovieRatings 導航屬性
				.ToList(); // 先執行查詢並轉換為 List

			// 在查詢完成後進行轉換
			return orders.Select(o => new UserHistoryDto
			{
				Id = o.Id,
				MovieReleaseScheduleId = o.MovieReleaseScheduleId,
				MemberId = o.MemberId,
				OrderDate = o.OrderDate,
				TotalTicketCount = o.TotalTicketCount,
				TotalAmount = o.TotalAmount,
				PaymentStatus = o.PaymentStatus,
				OrderNumber = o.OrderNumber,
				MainPicture = o.MovieReleaseSchedule.MovieInfo.MainPicture,
				MovieName = o.MovieReleaseSchedule.MovieInfo.MovieName,
				ShowTime = o.MovieReleaseSchedule.ShowTime.StartTime.ToString(), // 顯示時間
				ShowDate = o.MovieReleaseSchedule.ShowDate.ShowTimeDate.ToString("yyyy-MM-dd"), // 顯示日期
				Rating = o.MovieRatings.FirstOrDefault()?.Rating // 顯示評分
			}).ToList();
		}

		public UserHistoryDto GetUserHistoryDetail(string orderNumber)
		{
			var order = _context.Orders
				.Where(o => o.OrderNumber == orderNumber) // 使用 OrderNumber 來查詢
				.Include(o => o.MovieReleaseSchedule) // 包含導航屬性
				.Include(o => o.MovieReleaseSchedule.MovieInfo) // 包含導航屬性
				.Include(o => o.OrderDetails.Select(od => od.Seat)) // 包含 OrderDetails 和 Seat 導航屬性
				.Include(o => o.OrderDetails.Select(od => od.Ticket)) // 加入這行
				.FirstOrDefault(); // 查詢單個訂單

			if (order == null)
			{
				return null;
			}

			// 在查詢完成後進行轉換
			return new UserHistoryDto
			{
				Id = order.Id,
				MovieReleaseScheduleId = order.MovieReleaseScheduleId,
				MemberId = order.MemberId,
				OrderDate = order.OrderDate,
				TotalTicketCount = order.TotalTicketCount,
				TotalAmount = order.TotalAmount,
				PaymentStatus = order.PaymentStatus,
				OrderNumber = order.OrderNumber,
				MainPicture = order.MovieReleaseSchedule.MovieInfo.MainPicture,
				MovieName = order.MovieReleaseSchedule.MovieInfo.MovieName,
				ShowTime = order.MovieReleaseSchedule.ShowTime.StartTime.ToString(), // 顯示時間
				ShowDate = order.MovieReleaseSchedule.ShowDate.ShowTimeDate.ToString("yyyy-MM-dd"), // 顯示日期
				Rating = order.MovieRatings.FirstOrDefault()?.Rating, // 顯示評分
				Tickets = order.OrderDetails.Select(od => new TicketInfo
				{
					TicketNumber = od.TicketNumber,
					SeatNumber = od.Seat.SeatNumber,
					TicketType = od.Ticket.TicketType, // 新增這行
					TicketPrice = od.Ticket.TicketPrice // 新增這行
				}).ToList() // 直接從資料庫抓取票號和座位號
			};
		}

		public bool RateOrder(int orderId, int rating)
		{
			var order = _context.Orders.Include(o => o.MovieRatings).FirstOrDefault(o => o.Id == orderId);
			if (order == null)
			{
				return false;
			}

			var movieRating = order.MovieRatings.FirstOrDefault();
			if (movieRating == null)
			{
				movieRating = new MovieRating
				{
					OrderId = orderId,
					MemberId = order.MemberId,
					MovieInfoId = order.MovieReleaseSchedule.MovieInfoId,
					Rating = rating
				};
				_context.MovieRatings.Add(movieRating);
			}
			else
			{
				movieRating.Rating = rating;
			}

			_context.SaveChanges();
			return true;
		}

		public Member GetMemberByEmail(string email)
		{
			return _context.Members.FirstOrDefault(m => m.Email == email);
		}

		public Order GetOrderByOrderNumber(string orderNumber)
		{
			return _context.Orders.FirstOrDefault(o => o.OrderNumber == orderNumber);
		}

		public bool CancelOrder(int orderId, string memberId)
		{
			var order = GetOrderById(orderId);
			if (order == null || order.MemberId.ToString() != memberId)
			{
				return false;
			}

			order.PaymentStatus = "Cancelled";
			_context.SaveChanges();
			return true;
		}

		public Order GetOrderById(int orderId)
		{
			return _context.Orders.FirstOrDefault(o => o.Id == orderId);
		}

	}
}