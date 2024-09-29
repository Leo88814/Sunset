namespace Sunset.WebAPI.Site.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            MovieRatings = new HashSet<MovieRating>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }

        public int MovieInfoId { get; set; }

        public int MemberId { get; set; }

        public int ShowTimeId { get; set; }

        public int ShowDateId { get; set; }

        public DateTime OrderDate { get; set; }

        public int TotalTicketCount { get; set; }

        public decimal TotalAmount { get; set; }

        [Required]
        [StringLength(20)]
        public string PaymentStatus { get; set; }

        [Required]
        [StringLength(50)]
        public string OrderNumber { get; set; }

        public virtual Member Member { get; set; }

        public virtual MovieInfo MovieInfo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieRating> MovieRatings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual ShowDate ShowDate { get; set; }

        public virtual ShowTime ShowTime { get; set; }
    }
}
