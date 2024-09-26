namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Showtime
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Showtime()
        {
            MovieReleaseSchedules = new HashSet<MovieReleaseSchedule>();
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }

        public int MovieId { get; set; }

        public int AuditoriumId { get; set; }

        [Column(TypeName = "date")]
        public DateTime ShowtimeDate { get; set; }

        public TimeSpan StartTime { get; set; }

        public TimeSpan EndTime { get; set; }

        public virtual Auditorium Auditorium { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieReleaseSchedule> MovieReleaseSchedules { get; set; }

        public virtual Movie Movy { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
