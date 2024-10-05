using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class TopupDto
    {
        public int Id { get; set; }
        public string OrderNumber { get; set; }
        public decimal Amount { get; set; }
        public DateTime OrderTime { get; set; } // 新增的屬性
    }
}