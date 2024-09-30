using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class ChoiceSeatsDto
	{
		public int OrderId { get; set; }
		public int MovieInfoId { get; set; }
		public string MovieName { get; set; }
		public int SeatId { get; set; }
		public string SeatNumber { get; set; }
		public string SeatStatus { get; set; }

	}
}