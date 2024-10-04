namespace Sunset.WebAPI.Site.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MovieInfos")]
    public partial class MovieInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MovieInfo()
        {
            MovieImages = new HashSet<MovieImage>();
            MovieRatings = new HashSet<MovieRating>();
            MovieReleaseSchedules = new HashSet<MovieReleaseSchedule>();
            ShowTimes = new HashSet<ShowTime>();
        }

        public int Id { get; set; }

        public int GenreId { get; set; }

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

        public decimal? TotalRating { get; set; }

        public virtual MovieGenre MovieGenre { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieImage> MovieImages { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieRating> MovieRatings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieReleaseSchedule> MovieReleaseSchedules { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShowTime> ShowTimes { get; set; }
    }
}
