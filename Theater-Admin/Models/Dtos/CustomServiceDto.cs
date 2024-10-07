using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Dtos
{
    public class CustomServiceDto
    {
        public int Id { get; set; }
        public  string Question { get; set; }
        public string Answer { get; set; }
    }
}