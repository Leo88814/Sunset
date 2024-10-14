USE [master]
GO
/****** Object:  Database [BookMovie]    Script Date: 2024/10/7 下午 03:17:03 ******/
CREATE DATABASE [BookMovie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookMovie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookMovie.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookMovie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookMovie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookMovie] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookMovie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookMovie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookMovie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookMovie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookMovie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookMovie] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookMovie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookMovie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookMovie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookMovie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookMovie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookMovie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookMovie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookMovie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookMovie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookMovie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookMovie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookMovie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookMovie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookMovie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookMovie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookMovie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookMovie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookMovie] SET RECOVERY FULL 
GO
ALTER DATABASE [BookMovie] SET  MULTI_USER 
GO
ALTER DATABASE [BookMovie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookMovie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookMovie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookMovie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookMovie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookMovie] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookMovie', N'ON'
GO
ALTER DATABASE [BookMovie] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookMovie] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookMovie]
GO
/****** Object:  User [sa5]    Script Date: 2024/10/7 下午 03:17:03 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[Auditoriums]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoriums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CinemaId] [int] NOT NULL,
	[AuditoriumName] [varchar](100) NOT NULL,
	[SeatCapacity] [int] NOT NULL,
	[AuditoriumStatus] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Auditoriums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinemas]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinemas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CinemasName] [varchar](100) NOT NULL,
	[Location] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[CinermasPicture] [varchar](100) NULL,
 CONSTRAINT [PK_Cinemas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerService]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [text] NOT NULL,
	[Answer] [text] NULL,
 CONSTRAINT [PK_CustomerService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaSlides]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaSlides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IndexPicture] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MediaSlides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](10) NULL,
	[CurrentBalance] [decimal](10, 0) NOT NULL,
	[MemberName] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Address] [varchar](255) NULL,
	[MemberStatus] [bit] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[ConfirmCode] [varchar](50) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MovieGenres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieImages]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieInfoId] [int] NOT NULL,
	[stills] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MovieImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieInfos]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieInfos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenreId] [int] NOT NULL,
	[MovieName] [varchar](100) NOT NULL,
	[EnglishName] [varchar](100) NOT NULL,
	[Grading] [varchar](50) NOT NULL,
	[Synopsis] [text] NULL,
	[TrailerURL] [varchar](255) NULL,
	[PremiereDate] [date] NOT NULL,
	[OnAir] [bit] NOT NULL,
	[Director] [varchar](100) NOT NULL,
	[MovieCast] [text] NOT NULL,
	[MovieLanguage] [varchar](50) NOT NULL,
	[Duration] [varchar](20) NOT NULL,
	[Distributor] [varchar](100) NOT NULL,
	[MainPicture] [varchar](100) NOT NULL,
	[TotalRating] [decimal](2, 1) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieRatings]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieRatings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[MovieInfoId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_MovieRatings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieReleaseSchedules]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieReleaseSchedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieInfoId] [int] NOT NULL,
	[AuditoriumId] [int] NOT NULL,
	[ShowTimeId] [int] NOT NULL,
	[ShowDateId] [int] NULL,
 CONSTRAINT [PK_MovieReleaseSchedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[TicketNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieReleaseScheduleId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalTicketCount] [int] NOT NULL,
	[TotalAmount] [decimal](10, 0) NOT NULL,
	[PaymentStatus] [varchar](20) NOT NULL,
	[OrderNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SeatNumber] [varchar](10) NOT NULL,
	[SeatStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShowDates]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowDates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShowTimeDate] [date] NOT NULL,
 CONSTRAINT [PK_Showdate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShowTimes]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowTimes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieInfoId] [int] NOT NULL,
	[ShowDateId] [int] NOT NULL,
	[AuditoriumId] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Showtimes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketType] [varchar](20) NOT NULL,
	[TicketPrice] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topups]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[TopUpAmount] [decimal](10, 0) NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[OrderNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Topups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TopUpAmount] [decimal](10, 0) NOT NULL,
	[Amount] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_TransactionHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/10/7 下午 03:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Auditoriums] ADD  CONSTRAINT [DF_Auditoriums_AuditoriumStatus]  DEFAULT ('可使用') FOR [AuditoriumStatus]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CurrentBalance]  DEFAULT ((0)) FOR [CurrentBalance]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_IsConfirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_PaymentStatus]  DEFAULT ('已付款') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[Auditoriums]  WITH CHECK ADD  CONSTRAINT [FK_Auditoriums_Cinemas] FOREIGN KEY([CinemaId])
REFERENCES [dbo].[Cinemas] ([Id])
GO
ALTER TABLE [dbo].[Auditoriums] CHECK CONSTRAINT [FK_Auditoriums_Cinemas]
GO
ALTER TABLE [dbo].[MovieImages]  WITH CHECK ADD  CONSTRAINT [FK_MovieImages_MovieInfos] FOREIGN KEY([MovieInfoId])
REFERENCES [dbo].[MovieInfos] ([Id])
GO
ALTER TABLE [dbo].[MovieImages] CHECK CONSTRAINT [FK_MovieImages_MovieInfos]
GO
ALTER TABLE [dbo].[MovieInfos]  WITH CHECK ADD  CONSTRAINT [FK_MovieInfos_MovieGenres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[MovieGenres] ([Id])
GO
ALTER TABLE [dbo].[MovieInfos] CHECK CONSTRAINT [FK_MovieInfos_MovieGenres]
GO
ALTER TABLE [dbo].[MovieRatings]  WITH CHECK ADD  CONSTRAINT [FK_MovieRatings_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[MovieRatings] CHECK CONSTRAINT [FK_MovieRatings_Members]
GO
ALTER TABLE [dbo].[MovieRatings]  WITH CHECK ADD  CONSTRAINT [FK_MovieRatings_MovieInfos] FOREIGN KEY([MovieInfoId])
REFERENCES [dbo].[MovieInfos] ([Id])
GO
ALTER TABLE [dbo].[MovieRatings] CHECK CONSTRAINT [FK_MovieRatings_MovieInfos]
GO
ALTER TABLE [dbo].[MovieRatings]  WITH CHECK ADD  CONSTRAINT [FK_MovieRatings_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[MovieRatings] CHECK CONSTRAINT [FK_MovieRatings_Orders]
GO
ALTER TABLE [dbo].[MovieReleaseSchedules]  WITH CHECK ADD  CONSTRAINT [FK_MovieReleaseSchedules_Auditoriums] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditoriums] ([Id])
GO
ALTER TABLE [dbo].[MovieReleaseSchedules] CHECK CONSTRAINT [FK_MovieReleaseSchedules_Auditoriums]
GO
ALTER TABLE [dbo].[MovieReleaseSchedules]  WITH CHECK ADD  CONSTRAINT [FK_MovieReleaseSchedules_MovieInfos] FOREIGN KEY([MovieInfoId])
REFERENCES [dbo].[MovieInfos] ([Id])
GO
ALTER TABLE [dbo].[MovieReleaseSchedules] CHECK CONSTRAINT [FK_MovieReleaseSchedules_MovieInfos]
GO
ALTER TABLE [dbo].[MovieReleaseSchedules]  WITH CHECK ADD  CONSTRAINT [FK_MovieReleaseSchedules_ShowDates] FOREIGN KEY([ShowDateId])
REFERENCES [dbo].[ShowDates] ([Id])
GO
ALTER TABLE [dbo].[MovieReleaseSchedules] CHECK CONSTRAINT [FK_MovieReleaseSchedules_ShowDates]
GO
ALTER TABLE [dbo].[MovieReleaseSchedules]  WITH CHECK ADD  CONSTRAINT [FK_MovieReleaseSchedules_ShowTimes] FOREIGN KEY([ShowTimeId])
REFERENCES [dbo].[ShowTimes] ([Id])
GO
ALTER TABLE [dbo].[MovieReleaseSchedules] CHECK CONSTRAINT [FK_MovieReleaseSchedules_ShowTimes]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Seats] FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seats] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Seats]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Tickets] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Tickets]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_MovieReleaseSchedules] FOREIGN KEY([MovieReleaseScheduleId])
REFERENCES [dbo].[MovieReleaseSchedules] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_MovieReleaseSchedules]
GO
ALTER TABLE [dbo].[ShowTimes]  WITH CHECK ADD  CONSTRAINT [FK_Showtimes_Auditoriums] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditoriums] ([Id])
GO
ALTER TABLE [dbo].[ShowTimes] CHECK CONSTRAINT [FK_Showtimes_Auditoriums]
GO
ALTER TABLE [dbo].[ShowTimes]  WITH CHECK ADD  CONSTRAINT [FK_ShowTimes_MovieInfos] FOREIGN KEY([MovieInfoId])
REFERENCES [dbo].[MovieInfos] ([Id])
GO
ALTER TABLE [dbo].[ShowTimes] CHECK CONSTRAINT [FK_ShowTimes_MovieInfos]
GO
ALTER TABLE [dbo].[ShowTimes]  WITH CHECK ADD  CONSTRAINT [FK_Showtimes_ShowDates] FOREIGN KEY([ShowDateId])
REFERENCES [dbo].[ShowDates] ([Id])
GO
ALTER TABLE [dbo].[ShowTimes] CHECK CONSTRAINT [FK_Showtimes_ShowDates]
GO
ALTER TABLE [dbo].[Topups]  WITH CHECK ADD  CONSTRAINT [FK_Topups_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Topups] CHECK CONSTRAINT [FK_Topups_Members]
GO
ALTER TABLE [dbo].[TransactionHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransactionHistory_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[TransactionHistory] CHECK CONSTRAINT [FK_TransactionHistory_Members]
GO
ALTER TABLE [dbo].[MovieInfos]  WITH CHECK ADD  CONSTRAINT [CK_Movies] CHECK  (([TotalRating]>(-0.1) AND [TotalRating]<(5.1)))
GO
ALTER TABLE [dbo].[MovieInfos] CHECK CONSTRAINT [CK_Movies]
GO
ALTER TABLE [dbo].[MovieRatings]  WITH CHECK ADD  CONSTRAINT [CK_MovieRatings] CHECK  (([Rating]>(0) AND [Rating]<(6)))
GO
ALTER TABLE [dbo].[MovieRatings] CHECK CONSTRAINT [CK_MovieRatings]
GO
USE [master]
GO
ALTER DATABASE [BookMovie] SET  READ_WRITE 
GO
