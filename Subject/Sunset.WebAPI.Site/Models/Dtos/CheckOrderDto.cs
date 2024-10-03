using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using static Sunset.WebAPI.Site.Models.Dtos.ChoiceDatesDto;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class CheckOrderDto
    {
		
		public MovieSchedule MovieScheduleInfo { get; set; }
        public List<ChoicedSeats> ChoiceSeatInfo { get; set; }
        public MemberCurrentBalance MemberBalance { get; set; }
        public class MovieSchedule
        {
            public int Id { get; set; }
            public string MovieName { get; set; }
            public string MainPicture { get; set; }
          
            public DateTime ShowtimeDate { get; set; }
            [NotMapped] // 不將此屬性映射到資料庫
            public string ShowtimeDateString => ShowtimeDate.ToString("yyyy-MM-dd"); // 格式化成 "YYYY-MM-DD" 字串
           
            public TimeSpan StartTime { get; set; }
            [NotMapped]
            public string StartTimeMin => StartTime.ToString(@"hh\:mm");
           
            public string AuditoriumName { get; set; }
        }

        public class ChoicedSeats
        {
            public int Id { get; set; }
            public string SeatNumber { get; set; }
        }

        public class MemberCurrentBalance
        {
            public int Id { get; set; }
            public decimal CurrentBalance { get; set; }
        }
    }
}