using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Vms
{
    public class MovieVm
    {

        public int Id { get; set; }

        public int GenreId { get; set; }
 
        public string MovieName { get; set; }
        
        public string EnglishName { get; set; }
     
        public string Grading { get; set; }

        public string Synopsis { get; set; }

        public string TrailerURL { get; set; }
     
        public DateTime PremiereDate { get; set; }

        public bool OnAir { get; set; }

        public string Director { get; set; }

        public string MovieCast { get; set; }

        public string MovieLanguage { get; set; }

        public string Duration { get; set; }

        public string Distributor { get; set; }
      
        public string MainPicture { get; set; }

    }
}