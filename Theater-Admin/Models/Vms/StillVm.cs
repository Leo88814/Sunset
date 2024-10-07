using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Vms
{
    public class StillVm
    {
        public int Id { get; set; }
        public int MovieInfoId { get; set; }
        public string stills { get; set; }
    }
}