using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class HomeDto
	{
		public class HomeIndexPicture 
		{
			public int Id { get; set; }
			public string Stills { get; set; }
		}

		public class HomeIndexFeaturedFilms
		{
            public int Id { get; set; }
			public string MainPicture {  get; set; }
            public string MovieName { get; set; }
			public string EnglishName { get; set; }
			public decimal? TotalRating { get; set; }
        }

	}
}