namespace Sunset.WebAPI.Site.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MovieImage
    {
        public int Id { get; set; }

        public int MovieInfoId { get; set; }

        [Required]
        [StringLength(100)]
        public string stills { get; set; }

        public virtual MovieInfo MovieInfo { get; set; }
    }
}
