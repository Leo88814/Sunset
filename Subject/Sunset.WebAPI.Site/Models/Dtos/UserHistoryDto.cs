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
		public decimal TotalAmount { get; set; }
		public string PaymentStatus { get; set; }
		public string OrderNumber { get; set; }
		public string MainPicture { get; set; }
		public string MovieName { get; set; }
		public string ShowTime { get; set; } // 新增時間欄位
		public string ShowDate { get; set; } // 新增日期欄位
	}
}