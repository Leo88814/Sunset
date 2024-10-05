using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class CancelOrderDto
	{
	    public int OrderId { get; set; }
		public string MemberId { get; set; }
	}
}