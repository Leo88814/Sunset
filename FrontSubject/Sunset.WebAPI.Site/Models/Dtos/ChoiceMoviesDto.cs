using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class ChoiceMoviesDto
    {
        public int Id { get; set; }
        public string MovieName { get; set; }
        public string MainPicture { get; set; }
    }
}