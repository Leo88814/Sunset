using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class MovieReleaseScheduleDto
    {
        public int ShowtimeId { get; set; }  // 唯一識別場次
        public DateTime Date { get; set; }  // 日期
        public DateTime FullDateTime { get; set; }  // 日期加上時間，確保完整時間戳
        public string Time { get; set; }  // 用來顯示格式化的時間
    }

}