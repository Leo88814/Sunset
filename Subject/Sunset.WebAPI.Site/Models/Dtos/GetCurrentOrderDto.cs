using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using static Sunset.WebAPI.Site.Models.Dtos.ChoiceDatesDto;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class GetCurrentOrderDto
    {
     
            public int Id { get; set; }

            public int MovieReleaseScheduleId { get; set; }

            public int MemberId { get; set; }

            public DateTime OrderDate { get; set; }

            public int TotalTicketCount { get; set; }
        
            public string OrderNumber { get; set; }
 
            public int OrderDetailId { get; set; }

            public int TicketId { get; set; }

            public int OrderId { get; set; }

            public int SeatId { get; set; }

            public string TicketNumber { get; set; }
             public string MovieName { get; set; }
            public DateTime ShowTimeDate { get; set; }

             public TimeSpan StartTime { get; set; }
            public string AuditoriumName { get; set; }
            public string SeatNumber { get; set; }
            public string TicketType { get; set; }

            [NotMapped] // 不將此屬性映射到資料庫
            public string ShowtimeDateString => ShowTimeDate.ToString("yyyy-MM-dd"); // 格式化成 "YYYY-MM-DD" 字串

            [NotMapped]
            public string StartTimeMin => StartTime.ToString(@"hh\:mm");
             public List<TicketDetailDto> TicketDetails { get; set; }
    }
        public class TicketDetailDto
        {
            public string TicketNumber { get; set; }
            public string SeatNumber { get; set; }

        }
}