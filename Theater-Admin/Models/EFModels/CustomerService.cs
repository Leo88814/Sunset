namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CustomerService")]
    public partial class CustomerService
    {
        public int Id { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Question { get; set; }

        [Column(TypeName = "text")]
        public string Answer { get; set; }
    }
}
