namespace Sunset.WebAPI.Site.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MovieReleaseSchedule
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MovieReleaseSchedule()
        {
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }

        public int MovieInfoId { get; set; }

        public int AuditoriumId { get; set; }

        public int ShowTimeId { get; set; }

        public int? ShowDateId { get; set; }

        public virtual Auditorium Auditorium { get; set; }

        public virtual MovieInfo MovieInfo { get; set; }

        public virtual ShowDate ShowDate { get; set; }

        public virtual ShowTime ShowTime { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
