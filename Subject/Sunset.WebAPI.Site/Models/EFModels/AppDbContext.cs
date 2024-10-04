using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Sunset.WebAPI.Site.Models.EFModels
{
	public partial class AppDbContext : DbContext
	{
		public AppDbContext()
			: base("name=AppDbContext")
		{
		}

		public virtual DbSet<Auditorium> Auditoriums { get; set; }
		public virtual DbSet<Cinema> Cinemas { get; set; }
		public virtual DbSet<CustomerService> CustomerServices { get; set; }
		public virtual DbSet<Member> Members { get; set; }
		public virtual DbSet<MovieGenre> MovieGenres { get; set; }
		public virtual DbSet<MovieImage> MovieImages { get; set; }
		public virtual DbSet<MovieInfo> MovieInfos { get; set; }
		public virtual DbSet<MovieRating> MovieRatings { get; set; }
		public virtual DbSet<MovieReleaseSchedule> MovieReleaseSchedules { get; set; }
		public virtual DbSet<OrderDetail> OrderDetails { get; set; }
		public virtual DbSet<Order> Orders { get; set; }
		public virtual DbSet<Seat> Seats { get; set; }
		public virtual DbSet<ShowDate> ShowDates { get; set; }
		public virtual DbSet<ShowTime> ShowTimes { get; set; }
		public virtual DbSet<Ticket> Tickets { get; set; }
		public virtual DbSet<Topup> Topups { get; set; }
		public virtual DbSet<TransactionHistory> TransactionHistories { get; set; }
		public virtual DbSet<User> Users { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Auditorium>()
				.Property(e => e.AuditoriumName)
				.IsUnicode(false);

			modelBuilder.Entity<Auditorium>()
				.Property(e => e.AuditoriumStatus)
				.IsUnicode(false);

			modelBuilder.Entity<Auditorium>()
				.HasMany(e => e.MovieReleaseSchedules)
				.WithRequired(e => e.Auditorium)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Auditorium>()
				.HasMany(e => e.ShowTimes)
				.WithRequired(e => e.Auditorium)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cinema>()
				.Property(e => e.CinemasName)
				.IsUnicode(false);

			modelBuilder.Entity<Cinema>()
				.Property(e => e.Location)
				.IsUnicode(false);

			modelBuilder.Entity<Cinema>()
				.Property(e => e.Description)
				.IsUnicode(false);

			modelBuilder.Entity<Cinema>()
				.Property(e => e.CinermasPicture)
				.IsUnicode(false);

			modelBuilder.Entity<Cinema>()
				.HasMany(e => e.Auditoriums)
				.WithRequired(e => e.Cinema)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<CustomerService>()
				.Property(e => e.Question)
				.IsUnicode(false);

			modelBuilder.Entity<CustomerService>()
				.Property(e => e.Answer)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Account)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Password)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Email)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.PhoneNumber)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.CurrentBalance)
				.HasPrecision(10, 0);

			modelBuilder.Entity<Member>()
				.Property(e => e.MemberName)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Address)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.ConfirmCode)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.MovieRatings)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.Orders)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.Topups)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.TransactionHistories)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MovieGenre>()
				.Property(e => e.GenreName)
				.IsUnicode(false);

			modelBuilder.Entity<MovieGenre>()
				.HasMany(e => e.MovieInfos)
				.WithRequired(e => e.MovieGenre)
				.HasForeignKey(e => e.GenreId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MovieImage>()
				.Property(e => e.stills)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.MovieName)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.EnglishName)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.Grading)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.Synopsis)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.TrailerURL)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.Director)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.MovieCast)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.MovieLanguage)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.Duration)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.Distributor)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.MainPicture)
				.IsUnicode(false);

			modelBuilder.Entity<MovieInfo>()
				.Property(e => e.TotalRating)
				.HasPrecision(2, 1);

			modelBuilder.Entity<MovieInfo>()
				.HasMany(e => e.MovieImages)
				.WithRequired(e => e.MovieInfo)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MovieInfo>()
				.HasMany(e => e.MovieRatings)
				.WithRequired(e => e.MovieInfo)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MovieInfo>()
				.HasMany(e => e.MovieReleaseSchedules)
				.WithRequired(e => e.MovieInfo)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MovieInfo>()
				.HasMany(e => e.ShowTimes)
				.WithRequired(e => e.MovieInfo)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MovieReleaseSchedule>()
				.HasMany(e => e.Orders)
				.WithRequired(e => e.MovieReleaseSchedule)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<OrderDetail>()
				.Property(e => e.TicketNumber)
				.IsUnicode(false);

			modelBuilder.Entity<Order>()
				.Property(e => e.TotalAmount)
				.HasPrecision(10, 0);

			modelBuilder.Entity<Order>()
				.Property(e => e.PaymentStatus)
				.IsUnicode(false);

			modelBuilder.Entity<Order>()
				.Property(e => e.OrderNumber)
				.IsUnicode(false);

			modelBuilder.Entity<Order>()
				.HasMany(e => e.MovieRatings)
				.WithRequired(e => e.Order)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Order>()
				.HasMany(e => e.OrderDetails)
				.WithRequired(e => e.Order)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Seat>()
				.Property(e => e.SeatNumber)
				.IsUnicode(false);

			modelBuilder.Entity<Seat>()
				.HasMany(e => e.OrderDetails)
				.WithRequired(e => e.Seat)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ShowDate>()
				.HasMany(e => e.ShowTimes)
				.WithRequired(e => e.ShowDate)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ShowTime>()
				.HasMany(e => e.MovieReleaseSchedules)
				.WithRequired(e => e.ShowTime)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Ticket>()
				.Property(e => e.TicketType)
				.IsUnicode(false);

			modelBuilder.Entity<Ticket>()
				.Property(e => e.TicketPrice)
				.HasPrecision(10, 0);

			modelBuilder.Entity<Ticket>()
				.HasMany(e => e.OrderDetails)
				.WithRequired(e => e.Ticket)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Topup>()
				.Property(e => e.TopUpAmount)
				.HasPrecision(10, 0);

			modelBuilder.Entity<Topup>()
				.Property(e => e.OrderNumber)
				.IsUnicode(false);

			modelBuilder.Entity<TransactionHistory>()
				.Property(e => e.TopUpAmount)
				.HasPrecision(10, 0);

			modelBuilder.Entity<TransactionHistory>()
				.Property(e => e.Amount)
				.HasPrecision(10, 0);

			modelBuilder.Entity<User>()
				.Property(e => e.Account)
				.IsUnicode(false);

			modelBuilder.Entity<User>()
				.Property(e => e.Password)
				.IsUnicode(false);
		}
	}
}
