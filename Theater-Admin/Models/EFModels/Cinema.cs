namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Cinema
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cinema()
        {
            Auditoriums = new HashSet<Auditorium>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string CinemasName { get; set; }

        [Required]
        [StringLength(255)]
        public string Location { get; set; }

        [Column(TypeName = "text")]
        public string Description { get; set; }

        [StringLength(100)]
        public string CinermasPicture { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Auditorium> Auditoriums { get; set; }
    }
}
