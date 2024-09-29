using Sunset.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Exts
{
	public static class ChoiceMoviesDto_Ext 
	{
		public static ChoiceMoviesDto MatchPath(this ChoiceMoviesDto dto, string path)
		{
			dto.MainPicture = path + dto.MainPicture;

			return dto;
		}

		public static List<ChoiceMoviesDto> MatchPath(this List<ChoiceMoviesDto> dto, string path)
		{
			return dto.Select(x => x.MatchPath(path)).ToList();
		}

	}
}