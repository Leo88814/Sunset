using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class MovieBlockbusterDto
	{
        public int Id { get; set; } 
        public string MovieName { get; set; }
		public string Grading { get; set; }
		public string Duration { get; set; }

		public string MainPicture { get; set; }
        public decimal? TotalRating { get; set; } 
        public string GenreName { get; set; }
		public double AverageRating { get; set; } // 新增的屬性，用於儲存平均評分
	}
}