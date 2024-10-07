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
			var movieImages = _db.MediaSlides
				.Where(mig => mig.IndexPicture == "Main1.jpg" || mig.IndexPicture == "Main2.jpg" || mig.IndexPicture == "Main4.jpg")
				.Select(mig => new HomeDto.HomeIndexPicture
				{
					Id = mig.Id,
                    IndexPicture = mig.IndexPicture
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