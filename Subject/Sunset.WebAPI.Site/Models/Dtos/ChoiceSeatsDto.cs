using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class ChoiceSeatsDto
	{
		public int Id { get; set; }
		public int AuditoriumId { get; set; }
		public int SeatId { get; set; }
		public string SeatNumber { get; set; }
		public string SeatStatus { get; set; }

		public int TicketId { get; set; }
		public string TicketType{ get; set; }
		public int TicketPrice { get; set; }
	}
}