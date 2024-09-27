namespace Theater_Admin.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MovieRating
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public int MovieId { get; set; }

        public int OrderId { get; set; }

        public int? Rating { get; set; }

        public virtual Member Member { get; set; }

        public virtual Movie Movy { get; set; }

        public virtual Order Order { get; set; }
    }
}
