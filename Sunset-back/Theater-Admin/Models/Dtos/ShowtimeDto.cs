using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Dtos
{
    public class ShowtimeDto
    {
        public int Id { get; set; }
        public int MovieInfoId { get; set; }
        public int ShowDateId { get; set; }
        public int AuditoriumId { get; set; }
        public DateTime ShowDateTime { get; set; }

        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
    }
}