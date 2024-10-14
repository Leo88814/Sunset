using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class CurrentBalanceDto
	{
        public int Id { get; set; }
        public decimal CurrentBalance { get; set; }
    }
}