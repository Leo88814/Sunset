using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Vms
{
    public class AuditoriumVm
    {
        public int Id { get; set; }
        public int CinemaId { get; set; }
        public string AuditoriumName { get; set; }
        public string AuditoriumStatus { get; set; }
        public int SeatCapacity { get; set; }
    }
}