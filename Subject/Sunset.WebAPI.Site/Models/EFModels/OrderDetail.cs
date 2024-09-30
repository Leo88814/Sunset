namespace Sunset.WebAPI.Site.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OrderDetail
    {
        public int Id { get; set; }

        public int TicketId { get; set; }

        public int OrderId { get; set; }

        public int SeatId { get; set; }

        [Required]
        [StringLength(20)]
        public string TicketNumber { get; set; }

        public virtual Order Order { get; set; }

        public virtual Seat Seat { get; set; }

        public virtual Ticket Ticket { get; set; }
    }
}
