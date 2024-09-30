using Sunset.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Exts
{
	public static class ChoiceDatesDto_Ext
	{

		public static ChoiceDatesDto MatchPath(this ChoiceDatesDto dto, string path)
		{
			dto.MainPicture = path + dto.MainPicture;

			return dto;
		}

		public static List<ChoiceDatesDto> MatchPath(this List<ChoiceDatesDto> dto, string path)
		{
			return dto.Select(x => x.MatchPath(path)).ToList();
		}
	}
}