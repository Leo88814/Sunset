namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TransactionHistory")]
    public partial class TransactionHistory
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public DateTime TransactionDate { get; set; }

        public decimal TopUpAmount { get; set; }

        public decimal Amount { get; set; }

        public virtual Member Member { get; set; }
    }
}
