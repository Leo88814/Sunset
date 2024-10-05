using Sunset.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Exts
{
	public static class HomeDto_Ext
	{
		public static HomeDto.HomeIndexPicture MatchPath(this HomeDto.HomeIndexPicture dto, string path)
		{
			dto.Stills = path + dto.Stills;

			return dto;
		}

		public static List<HomeDto.HomeIndexPicture> MatchPath(this List<HomeDto.HomeIndexPicture> dto, string path)
		{
			return dto.Select(x => x.MatchPath(path)).ToList();
		}

        
		public static HomeDto.HomeIndexFeaturedFilms MatchPath(this HomeDto.HomeIndexFeaturedFilms dto, string path)
        {
            dto.MainPicture = path + dto.MainPicture;

            return dto;
        }

        public static List<HomeDto.HomeIndexFeaturedFilms> MatchPath(this List<HomeDto.HomeIndexFeaturedFilms> dto, string path)
        {
            return dto.Select(x => x.MatchPath(path)).ToList();
        }
    }
}