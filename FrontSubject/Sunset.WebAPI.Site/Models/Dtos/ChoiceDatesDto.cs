using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class ChoiceDatesDto
    {
        public int Id { get; set; }
        public int DateId { get; set; }
        [DataType(DataType.Date)]
        public DateTime ShowtimeDate { get; set; }

        public int TimeId { get; set; }
        [DataType(DataType.DateTime)]
        public TimeSpan StartTime { get; set; }

        // 新增一個額外的屬性來格式化日期
        [NotMapped] // 不將此屬性映射到資料庫
        public string ShowtimeDateString => ShowtimeDate.ToString("yyyy/MM/dd");  // 格式化成 "YYYY-MM-DD" 字串

        [NotMapped] // 不將此屬性映射到資料庫
        public string StartTimeMin => StartTime.ToString(@"hh\:mm");
    }
}