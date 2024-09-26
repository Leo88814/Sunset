namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Movie
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Movie()
        {
            MovieRatings = new HashSet<MovieRating>();
            MovieReleaseSchedules = new HashSet<MovieReleaseSchedule>();
            Showtimes = new HashSet<Showtime>();
        }

        public int Id { get; set; }

        public int GenreId { get; set; }

        public int MovieImageId { get; set; }

        [Required]
        [StringLength(100)]
        public string MovieName { get; set; }

        [Required]
        [StringLength(100)]
        public string EnglishName { get; set; }

        [Required]
        [StringLength(50)]
        public string Grading { get; set; }

        [Column(TypeName = "text")]
        public string Synopsis { get; set; }

        [StringLength(255)]
        public string TrailerURL { get; set; }

        [Column(TypeName = "date")]
        public DateTime PremiereDate { get; set; }

        public bool OnAir { get; set; }

        [Required]
        [StringLength(100)]
        public string Director { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string MovieCast { get; set; }

        [Required]
        [StringLength(50)]
        public string MovieLanguage { get; set; }

        [Required]
        [StringLength(20)]
        public string Duration { get; set; }

        [Required]
        [StringLength(100)]
        public string Distributor { get; set; }

        [Required]
        [StringLength(100)]
        public string MainPicture { get; set; }

        public virtual MovieGenre MovieGenre { get; set; }

        public virtual MovieImage MovieImage { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieRating> MovieRatings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieReleaseSchedule> MovieReleaseSchedules { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Showtime> Showtimes { get; set; }
    }
}
