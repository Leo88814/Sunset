using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Dtos
{
    public class UserDto
    {
        public int Id { get; set; }
        public string Account { get; set; }
        public string Password { get; set; }
    }
}