namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MovieReleaseSchedule
    {
        public int Id { get; set; }

        public int MovieId { get; set; }

        public int AuditoriumId { get; set; }

        public int ShowtimeId { get; set; }

        [Column(TypeName = "date")]
        public DateTime ReleaseDate { get; set; }

        public virtual Auditorium Auditorium { get; set; }

        public virtual Movie Movy { get; set; }

        public virtual Showtime Showtime { get; set; }
    }
}
