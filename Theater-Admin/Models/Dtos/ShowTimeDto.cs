using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Dtos
{
    public class ShowTimeDto
    {
        public int MovieId { get; set; }
        public int ShowdateId { get; set; }
        public int AuditoriunId { get; set; }
        public DateTime ShowDate { get; set; }

        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
    }
}