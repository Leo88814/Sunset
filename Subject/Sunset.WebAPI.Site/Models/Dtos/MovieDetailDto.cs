using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class MovieDetailDto
    {
        public int Id { get; set; }
        public string MovieName { get; set; }
        public string EnglishName { get; set; }
        public int MovieImageId { get; set; }
        public string TrailerURL { get; set; }
        public string Director { get; set; }
        public string MovieCast { get; set; }
        public DateTime PremiereDate { get; set; }
        public string MovieLanguage { get; set; }

        public string Distributor { get; set; }
        public List<string> stills { get; set; }
        public string Synopsis { get; set; }
        public string Grading { get; set; }
        public string Duration { get; set; }
        public string MainPicture { get; set; }
        public decimal? TotalRating { get; set; }
        public string GenreName { get; set; }
        public double AverageRating { get; set; } // 新增的平均評價屬性
        public List<MovieReleaseScheduleDto> Showtimes { get; set; }
    }
}