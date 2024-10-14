using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Vms
{
    public class MovieReleaseScheduleIdVm
    {
        public string MovieName { get; set; }
        public string AuditorinmName { get; set; }

        
        public DateTime ShowDate { get; set; }
    }
}