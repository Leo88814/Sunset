using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Vms
{
    public class ShowtimeVm
    {
        public int Id { get; set; }
        public int MovieInfoId { get; set; }
        public int ShowdateId { get; set; }
        public int AuditoriumId { get; set; }
        public DateTime ShowDateTime { get; set; }

        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
    }
}