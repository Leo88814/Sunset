using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class ChoiceSeatsDto
	{
		public int SeatId { get; set; }
		public string SeatNumber { get; set; }
		public bool SeatStatus { get; set; }

	}
}