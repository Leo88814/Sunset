using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class PostOrderDto
	{
		public OrderDto DataForOrder { get; set; }
		
		public List<OrderDetailDto> DataForOrderDetail { get; set; }

		public MovieRatingDto DataForMovieRating { get; set; }

		public RemainingBalanceDto DataForRemainingBalance { get; set; }
	}

	public class OrderDto 
	{
		public int Id { get; set; }

		public int MovieReleaseScheduleId { get; set; }

		public int MemberId { get; set; }

		public DateTime OrderDate { get; set; }

		public int TotalTicketCount { get; set; }

		public decimal TotalAmount { get; set; }

		public string PaymentStatus { get; set; }

		public string OrderNumber { get; set; }
	}
	public class OrderDetailDto
	{
		public int Id { get; set; }

		public int TicketId { get; set; }

		public int OrderId { get; set; }

		public int SeatId { get; set; }

		public string TicketNumber { get; set; }

	}
	public class MovieRatingDto
	{
		public int Id { get; set; }

		public int MemberId { get; set; }

		public int MovieInfoId { get; set; }

		public int OrderId { get; set; }

		public int? Rating { get; set; }
	}

	public class RemainingBalanceDto
	{
		public int Id { get; set; }
		public decimal CurrentBalance { get; set; }
	}
}