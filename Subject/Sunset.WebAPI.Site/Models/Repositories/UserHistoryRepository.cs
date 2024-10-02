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
                ShowDate = o.MovieReleaseSchedule.ShowDate.ShowTimeDate.ToString("yyyy-MM-dd") // 顯示日期
            }).ToList();
        }
    }
}