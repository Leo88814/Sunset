using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class MemberLoginDto
	{
		public string Email { get; set; }
		public string Password { get; set; }
	}
}