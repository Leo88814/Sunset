using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Dtos
{
    public class StillDto
    {
        public int Id { get; set; }
        public int MovieInfoId { get; set; }
        public string Stills { get; set; }
    }
}