﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class MovieComingSoonDto
	{
		public int Id { get; set; }
		public string MovieName { get; set; }
		public string Grading { get; set; }
		public string Duration { get; set; }
		public DateTime PremiereDate { get; set; }

		public string MainPicture { get; set; }
		public string GenreName { get; set; }
	}
}