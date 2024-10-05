using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Repositories
{
	public class HomeRepository
	{
		private readonly AppDbContext _db;
        public HomeRepository()
        {
			_db = new AppDbContext();
		}

		public List<HomeDto.HomeIndexPicture> GetHomePicture()
		{
			var movieImages = _db.MovieImages
				.Where(mig => mig.stills == "Main1.jpg" || mig.stills == "Main2.jpg" || mig.stills == "Main4.jpg")
				.Select(mig => new HomeDto.HomeIndexPicture
				{
					Id = mig.Id,
					Stills = mig.stills
				})
				.ToList();

			return movieImages;
		}

        public List<HomeDto.HomeIndexFeaturedFilms> GetTopFive(int count = 5)
        {
            var topFive = _db.MovieInfos
                .OrderByDescending(mi => mi.TotalRating)
				.Take(count)
                .Select(mi => new HomeDto.HomeIndexFeaturedFilms
                {
                    Id = mi.Id,
                    MovieName = mi.MovieName,
                    EnglishName = mi.EnglishName,
                    MainPicture = mi.MainPicture,
                    TotalRating = mi.TotalRating
                })
                .ToList();
            
			return topFive;
        }
    }
}