namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Topup
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public decimal TopUpAmount { get; set; }

        public DateTime OrderTime { get; set; }

        [Required]
        [StringLength(50)]
        public string OrderNumber { get; set; }

        public virtual Member Member { get; set; }
    }
}
