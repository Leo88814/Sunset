namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Auditorium
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Auditorium()
        {
            MovieReleaseSchedules = new HashSet<MovieReleaseSchedule>();
            ShowTimes = new HashSet<ShowTime>();
        }

        public int Id { get; set; }

        public int CinemaId { get; set; }

        [Required]
        [StringLength(100)]
        public string AuditoriumName { get; set; }

        public int SeatCapacity { get; set; }

        [Required]
        [StringLength(20)]
        public string AuditoriumStatus { get; set; }

        public virtual Cinema Cinema { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieReleaseSchedule> MovieReleaseSchedules { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShowTime> ShowTimes { get; set; }
    }
}
