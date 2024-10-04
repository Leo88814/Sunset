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
				.Where(mig => mig.stills == "Main1.jpg" || mig.stills == "Main2.jpg" || mig.stills == "Main3.jpg")
				.Select(mig => new HomeDto.HomeIndexPicture
				{
					Stills = mig.stills
				})
				.ToList();

			return movieImages;
		}

	}
}