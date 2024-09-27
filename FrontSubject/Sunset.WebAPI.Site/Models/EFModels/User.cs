namespace Sunset.WebAPI.Site.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        public int Id { get; set; }

        [Required]
        [StringLength(255)]
        public string Account { get; set; }

        [Required]
        [StringLength(255)]
        public string Password { get; set; }
    }
}
