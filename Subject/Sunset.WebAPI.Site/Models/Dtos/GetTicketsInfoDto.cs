using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class GetTicketsInfoDto
    {
        public int Id { get; set; }
        public string TicketType { get; set; }
        public decimal TicketPrice { get; set; }

        public int TicketPriceAsInt => (int)Math.Round(TicketPrice);
    }
}