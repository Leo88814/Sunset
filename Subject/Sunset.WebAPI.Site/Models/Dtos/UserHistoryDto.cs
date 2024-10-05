using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class UserHistoryDto
    {
        public int Id { get; set; }
        public int MovieReleaseScheduleId { get; set; }
        public int MemberId { get; set; }
        public DateTime OrderDate { get; set; }
        public int TotalTicketCount { get; set; }
        public decimal Amount { get; set; }
        public decimal TotalAmount { get; set; }
        public string PaymentStatus { get; set; }
        public string OrderNumber { get; set; }
        public string MainPicture { get; set; }
        public string MovieName { get; set; }
        public string ShowTime { get; set; } // 顯示時間
        public string ShowDate { get; set; } // 顯示日期
        public int? Rating { get; set; } // 顯示評分
        public List<TicketInfo> Tickets { get; set; } // 新增票號和座位號列表
    }

    public class TicketInfo
    {
        public string TicketNumber { get; set; }
        public string SeatNumber { get; set; }
        public string TicketType { get; set; } // 新增這行
        public decimal TicketPrice { get; set; } // 新增這行
    }
}