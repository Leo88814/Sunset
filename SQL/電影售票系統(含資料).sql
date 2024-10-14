USE [master]
GO
/****** Object:  Database [BookMovie]    Script Date: 2024/10/8 上午 08:40:18 ******/
CREATE DATABASE [BookMovie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookMovie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookMovie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  User [sa5]    Script Date: 2024/10/8 上午 08:40:19 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[Auditoriums]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[Cinemas]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[CustomerService]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[MediaSlides]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[Members]    Script Date: 2024/10/8 上午 08:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](10) NULL,
	[CurrentBalance] [decimal](10, 0) NOT NULL,
	[MemberName] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Address] [varchar](255) NULL,
	[MemberStatus] [bit] NOT NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmCode] [varchar](50) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[MovieImages]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[MovieInfos]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[MovieRatings]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[MovieReleaseSchedules]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[Seats]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[ShowDates]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[ShowTimes]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[Topups]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2024/10/8 上午 08:40:19 ******/
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
SET IDENTITY_INSERT [dbo].[Auditoriums] ON 
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (1, 1, N'1廳', 48, N'Active')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (2, 1, N'2廳', 48, N'Maintenance')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (3, 1, N'3廳', 48, N'Idle')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (4, 1, N'4廳', 48, N'Idle')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (6, 1, N'5廳', 48, N'Idle')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (7, 1, N'6廳', 48, N'Idle')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (8, 1, N'7廳', 48, N'Idle')
GO
SET IDENTITY_INSERT [dbo].[Auditoriums] OFF
GO
SET IDENTITY_INSERT [dbo].[Cinemas] ON 
GO
INSERT [dbo].[Cinemas] ([Id], [CinemasName], [Location], [Description], [CinermasPicture]) VALUES (1, N'Sunset', N'台北市信義區松壽路18號', N'位於台北101附近的大型影城', NULL)
GO
SET IDENTITY_INSERT [dbo].[Cinemas] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerService] ON 
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (1, N'如何購買電影票？', N'您可以透過我們的官方網站或手機APP進行線上訂票，也可以直接到影城櫃檯購買。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (2, N'退票政策是什麼？', N'電影開演前2小時內可辦理退票，但需收取10%手續費。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (3, N'有哪些優惠方案？', N'我們提供學生優惠、老年優惠以及會員積分兌換等多種優惠方案。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (4, N'如何成為會員？', N'您可以在官網或APP上註冊成為會員，享受專屬優惠。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (5, N'影城內是否可以攜帶外食？', N'為了維護影廳環境，我們不建議攜帶外食入場，但瓶裝水是允許的。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (6, N'遺失物品如何處理？', N'請聯繫影城客服中心，我們會協助您尋找遺失的物品。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (7, N'電影分級制度是什麼？', N'我們遵循台灣電影分級制度：普遍級、保護級、輔導級、限制級。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (8, N'如何預訂團體票？', N'20人以上的團體可以聯繫我們的團體訂票專線進行預訂。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (9, N'影城是否提供無障礙設施？', N'是的，我們的影城都設有無障礙坡道、電梯和專用座位。')
GO
INSERT [dbo].[CustomerService] ([Id], [Question], [Answer]) VALUES (10, N'3D眼鏡是否需要額外付費？', N'3D電影票價中已包含3D眼鏡的租借費用，無需額外付費。')
GO
SET IDENTITY_INSERT [dbo].[CustomerService] OFF
GO
SET IDENTITY_INSERT [dbo].[MediaSlides] ON 
GO
INSERT [dbo].[MediaSlides] ([Id], [IndexPicture]) VALUES (1, N'Main1.jpg')
GO
INSERT [dbo].[MediaSlides] ([Id], [IndexPicture]) VALUES (2, N'Main2.jpg')
GO
INSERT [dbo].[MediaSlides] ([Id], [IndexPicture]) VALUES (3, N'Main4.jpg')
GO
SET IDENTITY_INSERT [dbo].[MediaSlides] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (1, N'movie_lover', N'pass123', N'movie_lover@email.com', N'0912345678', CAST(1000 AS Decimal(10, 0)), N'張小明', CAST(N'1990-05-15' AS Date), N'台北市信義區信義路五段7號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (2, N'cinema_fan', N'fan456', N'cinema_fan@email.com', N'0923456789', CAST(500 AS Decimal(10, 0)), N'李大華', CAST(N'1985-08-20' AS Date), N'台中市西屯區台灣大道四段1086號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (3, N'film_buff', N'buff789', N'film_buff@email.com', N'0934567890', CAST(1500 AS Decimal(10, 0)), N'王美麗', CAST(N'1995-03-10' AS Date), N'高雄市前鎮區中華五路789號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (4, N'popcorn_addict', N'pop000', N'popcorn_addict@email.com', N'0945678901', CAST(800 AS Decimal(10, 0)), N'陳志明', CAST(N'1988-11-30' AS Date), N'台南市東區長榮路一段1號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (5, N'screen_queen', N'queen111', N'screen_queen@email.com', N'0956789012', CAST(2000 AS Decimal(10, 0)), N'林小芳', CAST(N'1992-07-25' AS Date), N'新竹市東區光復路二段101號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (6, N'ticket_master', N'master222', N'ticket_master@email.com', N'0967890123', CAST(1200 AS Decimal(10, 0)), N'黃大維', CAST(N'1987-09-05' AS Date), N'桃園市中壢區中央西路三段150號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (7, N'premiere_pro', N'pro333', N'premiere_pro@email.com', N'0978901234', CAST(1800 AS Decimal(10, 0)), N'吳雅琪', CAST(N'1993-12-18' AS Date), N'新北市板橋區縣民大道二段7號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (8, N'reel_deal', N'deal444', N'reel_deal@email.com', N'0989012345', CAST(600 AS Decimal(10, 0)), N'蔡文心', CAST(N'1991-02-28' AS Date), N'宜蘭市中山路二段238號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (9, N'blockbuster_boy', N'boy555', N'blockbuster_boy@email.com', N'0990123456', CAST(900 AS Decimal(10, 0)), N'鄭大勇', CAST(N'1989-06-12' AS Date), N'花蓮市中山路一段376號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (10, N'silver_screen', N'screen666', N'silver_screen@email.com', N'0901234567', CAST(1100 AS Decimal(10, 0)), N'楊小雯', CAST(N'1994-10-08' AS Date), N'台東市中華路一段684號', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (11, N'QQ00245', N'75A0FF0800DC7369E557EB57160325D1449989E5025449D5EC0601D6387292D5', N'asd46825@gmail.com', N'0987654322', CAST(1000 AS Decimal(10, 0)), N'王曉明', CAST(N'2000-05-09' AS Date), N'台北市永和區', 1, 0, N'b4d6a9182b8c4335ac387143b7eb543a')
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (12, N'AAA', N'049E02FB381FCF4C858F14875B3520837355B0C156B9C08DE60C5582E945E18F', N'qweasdzxc@gmail.com', NULL, CAST(1310 AS Decimal(10, 0)), N'AAA', CAST(N'1985-02-01' AS Date), NULL, 1, 0, N'385a7d7fe36046a6804ab9bf95599a00')
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (13, N'BBB', N'049E02FB381FCF4C858F14875B3520837355B0C156B9C08DE60C5582E945E18F', N'qwer486@gmail.com', NULL, CAST(3300 AS Decimal(10, 0)), N'邱曉葉', CAST(N'1989-05-06' AS Date), NULL, 1, 0, N'4d352412543448aa9f244eda6d861d5b')
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (14, N'AWC', N'049E02FB381FCF4C858F14875B3520837355B0C156B9C08DE60C5582E945E18F', N'zxc8816497@gmail.com', N'0789456123', CAST(1350 AS Decimal(10, 0)), N'洪秀宇', CAST(N'2004-11-30' AS Date), NULL, 1, 0, N'93eaf82205384d2c8373600fd1ff784a')
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (15, N'sa123', N'049E02FB381FCF4C858F14875B3520837355B0C156B9C08DE60C5582E945E18F', N'rfth48726@gmail.com', NULL, CAST(900 AS Decimal(10, 0)), N'葉玉欣', CAST(N'2006-05-24' AS Date), N'台北市大同區', 1, 0, N'01d226cb36264e08b9e7e225f581af5c')
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (16, N'qwe111648', N'049E02FB381FCF4C858F14875B3520837355B0C156B9C08DE60C5582E945E18F', N'gkro269871@gmail.com', NULL, CAST(1780 AS Decimal(10, 0)), N'黃偉峻', CAST(N'1978-03-26' AS Date), NULL, 1, 0, N'b4a3540b306f4b50b6abda251e450098')
GO
INSERT [dbo].[Members] ([Id], [Account], [Password], [Email], [PhoneNumber], [CurrentBalance], [MemberName], [DateOfBirth], [Address], [MemberStatus], [IsConfirmed], [ConfirmCode]) VALUES (17, N'asdwe1254', N'049E02FB381FCF4C858F14875B3520837355B0C156B9C08DE60C5582E945E18F', N'hrfre156@gmail.com', NULL, CAST(780 AS Decimal(10, 0)), N'陳俊源', CAST(N'1995-08-19' AS Date), NULL, 1, 0, N'35ba8788bad441d08f9b9e7700edd607')
GO
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieGenres] ON 
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (1, N'動作')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (2, N'冒險')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (3, N'喜劇')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (4, N'劇情')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (5, N'恐怖')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (6, N'科幻')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (7, N'奇幻')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (8, N'動畫')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (9, N'紀錄片')
GO
INSERT [dbo].[MovieGenres] ([Id], [GenreName]) VALUES (10, N'愛情')
GO
SET IDENTITY_INSERT [dbo].[MovieGenres] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieImages] ON 
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (11, 1, N'68589d63-89d0-42e7-bcba-0b37934188d9.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (12, 1, N'3d64370b-2aa4-4a2e-a553-602f94936da3.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (13, 1, N'341fc0ea-4187-4b55-8da3-386d0de3030d.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (14, 2, N'0a0559e5-1d0c-478e-85ee-9a8f3bb24bf3.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (15, 2, N'347d8c89-4849-45b5-91b4-192cc2561aec.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (16, 2, N'c7343d40-6f03-4640-9c6b-e5c3505dcd36.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (17, 3, N'a8dad6f3-6cfb-4ae0-9edf-b5ce12623de5.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (18, 3, N'9053a60b-31cd-4c1d-a91f-a83777262e27.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (19, 3, N'5af8911f-db1a-42fb-9735-f17c1235cef2.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (20, 4, N'40e83f25-7de9-4ace-aa05-13eaca116b1c.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (21, 4, N'50231018-5f9e-4279-a228-07c27d0b319a.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (22, 4, N'28ca3f04-5b64-47ce-8bb0-d1f56570c0c7.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (23, 5, N'625b88a2-06db-430c-b73d-6388abb6a7af.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (24, 5, N'60f7274d-8c3f-4aa4-941a-9dc82ce47212.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (25, 5, N'9bc2517a-8de4-473e-8693-76dcdc524203.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (26, 6, N'7355f6e3-e13e-4b11-97d1-6318cc2fcab4.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (27, 6, N'6ac9c8d4-46dc-4170-b288-b00a9ac60200.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (28, 7, N'664d11cd-0974-4d8b-9862-634dcbd1b390.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (29, 7, N'19b19b19-4173-4e8a-b4fc-c8e9e32e360c.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (30, 7, N'e43aa83d-4447-4c6c-b8ba-80540fd3c6eb.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (31, 8, N'3e36f3ef-5f2a-46ec-9e49-5933d60869d1.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (32, 8, N'34694eaa-58bb-4f51-8f82-518cb41e73c7.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (33, 8, N'b9add0ca-a506-45da-9cbf-7635bbf7ed44.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (34, 9, N'0e8954b9-6abe-4858-9048-da12af656f9a.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (35, 9, N'260522d1-3b05-4295-a131-ee41fb5c626e.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (36, 9, N'9a417318-9a63-4efb-bfb8-2906fc6c83cd.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (37, 10, N'ba90eecb-f46d-431e-80de-9fd75e523008.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (38, 10, N'a4c87f27-913f-4bd6-a31d-d4bfb5c784fe.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (39, 10, N'f44eac3c-4647-4e53-b05b-7465d9afaec7.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (40, 11, N'b5a9fc4c-fc85-4f09-9043-8589165b7441.jpg')
GO
SET IDENTITY_INSERT [dbo].[MovieImages] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieInfos] ON 
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (1, 4, N'小丑：雙重瘋狂', N'JOKER FOLIE A DEUX', N'輔導級', N'由導演陶德菲利普斯執導，瓦昆菲尼克斯、女神卡卡擔綱主演，分別飾演亞瑟佛萊克／小丑、哈莉奎茵

他不再是獨自一人

亞瑟入獄後遇見哈莉奎茵，他不再是獨自一人，哈莉奎茵也比出開槍手勢，認識後甚至展開共舞，並且畫上笑臉。', N'https://www.youtube.com/embed/BD6Uf4qHEmk?si=vEvUMQJfZ8Tz6wvm', CAST(N'2024-09-30' AS Date), 1, N'陶德菲利普斯', N'瓦昆菲尼克斯、女神卡卡', N'英語', N'138', N'環球影業', N'46ba0fe1-f9d0-44f3-9fa5-bc0be1514646.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (2, 1, N'台北追緝令', N'WEEKEND IN TAIPEI', N'輔導級', N'首部全片在台灣拍攝的好萊塢動作電影，著名台北景點例如西門町商圈、美麗華百樂園、大直植福宮等都出現在片中，《玩命關頭》路克伊凡斯與「韓哥」姜成鎬，以及「金馬影后」桂綸鎂主演。美國緝毒局探員約翰（路克伊凡斯飾演），不僅是超強工作狂，更會犧牲一切、不擇手段，只為順利完成案件。不巧，在命運的捉弄下，他與思維敏捷又難以追捕的頂級「車手」喬伊（桂綸鎂飾演）墜入愛河，最後卻捲入犯罪陰謀當中，迫使兩人分開。', N'https://www.youtube.com/embed/MOGQ4tX2Ssc?si=Hf8QGtDuZTUuLJd-', CAST(N'2024-09-24' AS Date), 1, N'盧貝松', N'路克伊凡斯、姜成鎬、桂綸鎂', N'英語', N'101', N'采昌國際', N'ffc1d111-5d2e-427a-8a46-0f077cd9d69b.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (3, 8, N'我的英雄學院劇場版：You''re Next', N'MY HERO ACADEMIA YOURE NEXT', N'輔導級', N'在《我的英雄學院》作品中，大部分的人類都擁有名為「個性」的力量，但有力量之人卻不一定都屬於正義的一方。只要邪惡出現的地方，必定會有英雄挺身而出拯救眾人。一名天生沒有力量的少年「綠谷出久」從小就憧憬一位頂尖英雄，而他的夢想就是成為偉大的英雄，可是沒有力量的他能實現自己的夢想嗎？雖然困難重重，少年卻依舊不放棄，朝著自己的目標勇往前進。

作為《我的英雄學院》第四部劇場版作品，《我的英雄學院劇場版：You’re Next》將於 8 月 2 日在日本上映，台灣將於9月20日上映。本次的全新原創故事是由原作者堀越耕平擔任總監修與角色原案。', N'https://www.youtube.com/embed/otrs5icGoDs?si=CYVDvk7aBj9oW3rW', CAST(N'2024-09-19' AS Date), 1, N'岡村天齋', N'山下大輝、岡本信彥、佐倉綾音、?裕貴、石川界人、三宅健太', N'日文', N'110', N'羚邦', N'83d73732-371f-430f-82f9-79e4d57a954a.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (4, 1, N'變形金剛：源起', N'TRANSFORMERS ONE', N'普遍級', N'《黑寡婦》史嘉蕾喬韓森、《雷神索爾》克里斯漢斯沃、《捍衛戰士:獨行俠》喬漢姆、《超級瑪利歐兄弟電影版》基根麥可奇、《蜘蛛人:穿越新宇宙》布萊恩泰瑞亨利、《捍衛任務 4》勞倫斯費許朋等人配音。

故事發生在賽博坦，博派和狂派變形金剛的家鄉。講述《變形金剛》宇宙最經典的角色，奧利安派克斯及D-16，是如何從一對並肩作戰的好兄弟成為勢不兩立的死敵，柯博文與密卡登。', N'https://www.youtube.com/embed/3pTqK3Rwomw?si=xXq1fYoqMr56vaef', CAST(N'2024-09-12' AS Date), 1, N'喬許庫利', N'(配音)克里斯漢斯沃、布萊恩泰瑞亨利、史嘉蕾喬韓森、基根麥可奇、史蒂夫布希密、勞倫斯費許朋、喬漢姆', N'英語', N'104', N'派拉蒙影業', N'fae23eb2-f66e-4b35-a123-9f335d06004e.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (5, 8, N'你的名字', N'Your Name', N'普遍級', N'住在深山小鎮的女高中生宮水三葉（上白石萌音 飾），夢見自己變成東京男高中生。憧憬著都市生活的三葉，總在夢中盡情享受都市生活。而住在東京的男高中生立花瀧（神木隆之介 飾），則夢見了自己成為深山小鎮的女高中生。原來他們兩人的身心竟然都對調了，知道彼此存在後的瀧和三葉，終於知道了意外的真相……。', N'https://www.youtube.com/embed/ftWe_pVrtho?si=5FJ9TPaNrL9Jm_1y', CAST(N'2023-07-19' AS Date), 1, N'新海誠', N'神木隆之介 上白石萌音 長澤雅美 市原悅子 成田凌 悠木碧 島崎信長 石川界人 谷花音', N'日語', N'106', N'EMI', N'f641fe54-2ece-470e-a6f0-367ebf438140.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (6, 5, N'薇娜：死後七日', N'VINA(Before 7 Days)', N'限制級', N'★ 震驚全國！印尼最駭人真實靈異事件改編
★ 死者附身好友三分半鐘真實錄音曝光
★ 本片迫使印尼警方相隔八年重啟調查本案
★ 導演因拍攝本片遭到印尼警方扣留七小時
★ 引發現象級觀影熱潮！登上2024印尼恐怖片票房冠軍
★ 她滯留人間七日，只為提出血淚控訴…', N'https://www.youtube.com/embed/BwJy-62Hahw?si=3gtjY2ExZxMeSlho', CAST(N'2024-09-25' AS Date), 1, N'《蘇珊娜：活葬》安吉烏巴拉 Anggy Umbara', N'奈拉丹尼普納馬 Nayla D. Purnama 《屍禁》吉塞爾瑪菲爾曼夏 Gisellma Firmansyah 《屍禁》迪麗雅侯賽因 Delia Husein', N'印尼語', N'100', N'車庫娛樂股份有限公司', N'ea4908bf-cd2a-44c1-8d7e-f5e4d83ed7b6.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (7, 7, N'地獄怪客：歪曲人的詛咒', N'HELLBOY: The Crooked Man', N'輔導級', N'★ 《全面攻佔》《殺手保鑣》團隊恐怖動作鉅獻
★ 美國暢銷漫畫《地獄怪客》再度登上大銀幕
★ 改編自系列經典篇章《地獄怪客：歪曲人》
★ 繼吉勒摩戴托羅《地獄怪客》後漫畫原作者再度親自編劇
★ 準備目睹所有邪惡的起源…

　　1950年代，地獄怪客（傑克凱西 飾）與一名「超自然調查防禦署」（BPRD）的新進探員意外流落於一座阿帕拉契地區的村莊，這裡的居民飽受女巫肆虐所苦，女巫們的領導者是一個名為「歪曲人」的惡魔，而他似乎跟地獄怪客的過往有某些神秘的關聯……。', N'https://www.youtube.com/embed/4cFMJ6fX9hY?si=-SvOrCjt_Ip_hVP3', CAST(N'2024-10-03' AS Date), 1, N'布萊恩泰勒', N'傑克凱西、傑佛遜懷特、莉亞麥克納馬拉', N'英語', N'99', N'番茄醬娛樂', N'5774dbd6-b436-4155-a210-c5c75bf5aa94.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (8, 3, N'角頭－大橋頭', N'GATAO LIKE FATHER LIKE SON', N'限制級', N'Michael哥（王陽明 飾）回來了，他「跟天借膽」 ，帶著瘋蠍子（張懷秋 飾）想拿下頂莊、北城、北館，在貴董（高捷 飾）、哈達（太保 飾）、勇桑（蔡振南 飾）的眼皮子底下賣藥，甚至想仗著自己幾分交情，拉攏勇桑的二把手清楓（孫鵬 飾），沒想到被打得灰頭土臉， 卻在這時，他看不上眼的土狗們阿猛（施名帥 飾）、阿慶（鄭人碩 飾）、宗保（張再興 飾），竟然能闖入仁哥（王識賢 飾）、憨春（陳萬號 飾）的賭場，搶下巨款，還活著回來，讓他又驚又喜。', N'https://www.youtube.com/embed/0-WfRiSENzc?si=TIfTlkFCELgYYO_W', CAST(N'2024-08-15' AS Date), 1, N'姜瑞智', N'蔡振南、龍天翔、喜翔、高捷、太保、夏靖庭、孫鵬、王識賢、王陽明、張懷秋、施名帥、鄭人碩、張再興、黃尚禾、吳震亞、唐振剛、李銘忠、陳萬號', N'國語', N'133', N'威視電影', N'9d555be4-7cc5-470e-a083-e5a033183bae.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (9, 9, N'與夢前行 宮崎駿', N'HAYAO MIYAZAKI AND THE HERON', N'普遍級', N'宮?駿身穿那件標誌性的白色工作圍裙，站在吉卜力工作室天台，在廣闊的藍天下凝視遠方，口中輕輕道出這句話，似乎將他退休後重拾創作的決心全然道破。想必在每個人心中都有一部吉卜力動畫，它像是一個時代的縮影，一段人生的記錄，透過細膩的筆觸與夢幻的畫面，悄然滲入我們日常的平淡與哲思。

如今，由日本 NHK 團隊歷經七年獨家跟拍，濃縮成兩小時的紀錄片《與夢前行 宮崎駿：蒼鷺與少年創作全紀錄》，將帶領觀者走進吉卜力工作室的世界，窺見每一個創作背後的細微瞬間，也揭露了宮?駿不曾展露的另一面。', N'https://www.youtube.com/embed/nXVVKY7e1a0?si=Y5eQrKZx6nfOeAjv', CAST(N'2024-09-29' AS Date), 1, N'荒川格', N'宮崎駿、鈴木敏夫', N'日語', N'121', N'香港商甲上娛樂有限公司台灣分公司', N'58de7758-c0c2-48a4-8989-282a919aac61.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (10, 1, N'危機航線', N'High Forces', N'輔導級', N'《見鬼》系列彭順執導，《拆彈專家》劉德華、《瑯琊榜》劉濤、《唐人街探案》張子楓、《流浪地球》屈楚蕭主演，砸重金打造 1:1 空中三層豪華飛機A380實景。

「有人嗎?有...」一條來自高皓軍(劉德華 飾)的神祕訊息從萬呎高空傳來國際安保專家高皓軍和失明的女兒小軍(張子楓 飾)搭乘有「空中巨無霸」之稱的五星級超豪華客機 A380 的國際首航，途中遭遇暴徒劫機。無差別射殺的恐怖手段，讓豪華機艙瞬間變成密閉煉獄，800 多名乘客危在旦夕，高皓軍挺身而出，在數千米的高空上與一眾暴徒周旋，女兒卻受困於機艙中，劫匪頭目 Mike(屈楚蕭 飾)以全機 800 餘人的生命作為籌碼威脅，小軍的媽媽傅源(劉濤飾)也身陷危險之中，飛機能否平安降落，這場失控的危機該如何化解?', N'https://www.youtube.com/embed/Q1Nuicl0dLk?si=fxznFzNL4FmhaN7F', CAST(N'2024-10-28' AS Date), 1, N'彭順', N'劉德華、張子楓、屈楚蕭、劉濤、郭曉東', N'粵語', N'120', N'華映國際文創股份有限公司', N'f89b0448-f642-4734-8e1d-b8999d8b5690.jpg', NULL)
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (11, 1, N'猛毒最終章：最後一舞', N'VENOM: THE LAST DANCE', N'輔導級', N'湯姆哈迪回歸飾演猛毒，漫威最凶猛且複雜的英雄。在這次三部曲中的最後一章，艾迪和猛毒走上逃亡之路，被雙方的陣營一同追殺。在最後的關頭，他們必須做出令人心痛的抉擇，為艾迪和猛毒的最後一舞劃上句點。', N'https://www.youtube.com/embed/fGErm6zGbGI?si=G5YqK4EpyNnJijAU', CAST(N'2024-10-24' AS Date), 0, N'凱莉馬修', N'湯姆哈迪、茱諾坦普、奇維托艾吉佛', N'英語', N'120', N'美商台灣索尼影業發行股份有限公司台灣分公司', N'168b4e48-e261-4214-bfa9-b3fddfaa5fe1.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[MovieInfos] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieRatings] ON 
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (1, 1, 1, 1, 4)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (2, 2, 2, 2, 5)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (3, 3, 3, 3, 3)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (4, 4, 4, 4, 5)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (5, 5, 5, 5, 4)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (6, 6, 6, 6, 5)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (7, 7, 7, 7, 4)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (8, 8, 8, 8, 3)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (9, 9, 9, 9, 4)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (10, 10, 10, 10, 5)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (11, 11, 1, 11, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (12, 12, 2, 14, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (13, 13, 2, 15, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (14, 13, 3, 16, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (15, 13, 5, 17, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (16, 14, 2, 18, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (17, 14, 3, 19, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (18, 14, 1, 20, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (19, 15, 2, 21, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (20, 15, 1, 22, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (21, 16, 7, 23, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (22, 16, 2, 24, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (23, 17, 2, 25, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (24, 17, 7, 26, NULL)
GO
INSERT [dbo].[MovieRatings] ([Id], [MemberId], [MovieInfoId], [OrderId], [Rating]) VALUES (25, 11, 7, 13, 1)
GO
SET IDENTITY_INSERT [dbo].[MovieRatings] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieReleaseSchedules] ON 
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (1, 1, 1, 1, 1)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (2, 1, 1, 2, 1)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (3, 1, 1, 3, 1)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (4, 1, 1, 4, 1)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (5, 1, 1, 5, 1)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (6, 1, 1, 6, 2)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (7, 1, 1, 7, 2)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (8, 1, 1, 8, 2)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (9, 1, 1, 9, 2)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (10, 1, 1, 10, 2)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (23, 2, 2, 62, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (24, 2, 2, 63, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (25, 2, 2, 64, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (26, 2, 2, 65, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (27, 7, 2, 66, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (28, 2, 2, 67, 18)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (29, 2, 2, 68, 18)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (30, 2, 2, 69, 18)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (32, 5, 2, 71, 18)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (33, 5, 2, 72, 12)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (34, 2, 2, 73, 12)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (35, 2, 2, 74, 12)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (36, 2, 2, 75, 12)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (37, 1, 2, 76, 12)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (39, 2, 2, 78, 10)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (40, 2, 2, 79, 10)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (41, 2, 2, 80, 10)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (42, 3, 2, 81, 10)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (43, 8, 2, 82, 13)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (44, 8, 2, 83, 13)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (46, 4, 2, 85, 13)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (47, 9, 3, 86, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (48, 3, 3, 87, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (49, 1, 3, 88, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (50, 9, 3, 89, 16)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (51, 6, 3, 90, 7)
GO
INSERT [dbo].[MovieReleaseSchedules] ([Id], [MovieInfoId], [AuditoriumId], [ShowTimeId], [ShowDateId]) VALUES (52, 7, 3, 91, 21)
GO
SET IDENTITY_INSERT [dbo].[MovieReleaseSchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (1, 1, 1, 1, N'A001')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (2, 2, 1, 2, N'B002')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (3, 2, 1, 3, N'C003')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (4, 2, 4, 4, N'D004')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (5, 3, 5, 5, N'E005')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (6, 3, 6, 6, N'F006')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (7, 1, 7, 7, N'G007')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (8, 1, 8, 8, N'H008')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (9, 2, 9, 9, N'I009')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (10, 2, 10, 10, N'J010')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (11, 1, 11, 1, N'TIC-638639443420931325-7890')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (12, 2, 11, 2, N'TIC-638639443421128118-9647')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (13, 3, 11, 3, N'TIC-638639443421128118-9647')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (14, 1, 12, 4, N'TIC-167842943861795246-4681')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (15, 2, 12, 5, N'TIC-976824531987514598-6482')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (16, 1, 13, 18, N'TIC-486255791358439261-4714')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (17, 1, 14, 30, N'TIC-638639485860647845-6672')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (18, 1, 14, 31, N'TIC-638639485860789105-8473')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (19, 1, 14, 32, N'TIC-638639485860829742-1296')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (20, 1, 15, 22, N'TIC-638639486973864014-8019')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (21, 2, 15, 23, N'TIC-638639486973923966-4038')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (22, 1, 16, 17, N'TIC-638639487465992067-1632')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (23, 2, 16, 18, N'TIC-638639487466112022-5874')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (24, 3, 16, 19, N'TIC-638639487466142039-9108')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (25, 1, 17, 42, N'TIC-638639487811049441-4666')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (26, 2, 17, 43, N'TIC-638639487811098381-9120')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (27, 1, 17, 44, N'TIC-638639487811128396-5482')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (28, 1, 18, 31, N'TIC-638639489440800378-7476')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (29, 2, 18, 32, N'TIC-638639489440890430-2476')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (30, 3, 18, 33, N'TIC-638639489440940369-6056')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (31, 1, 19, 32, N'TIC-638639489762019840-1708')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (32, 2, 19, 33, N'TIC-638639489762059894-3720')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (33, 3, 19, 34, N'TIC-638639489762109858-7845')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (34, 1, 20, 18, N'TIC-638639490022181838-8859')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (35, 2, 20, 19, N'TIC-638639490022281840-3673')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (36, 1, 21, 3, N'TIC-638639491184733443-4331')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (37, 3, 21, 4, N'TIC-638639491184794592-6261')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (38, 1, 22, 41, N'TIC-638639491465931427-3066')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (39, 1, 22, 42, N'TIC-638639491466008349-3066')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (40, 1, 22, 43, N'TIC-638639491466048263-2310')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (41, 1, 23, 17, N'TIC-638639493341675421-6639')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (42, 2, 23, 18, N'TIC-638639493341780762-4884')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (43, 3, 23, 19, N'TIC-638639493341820931-7606')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (44, 1, 24, 30, N'TIC-638639493854978838-5744')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (45, 2, 24, 31, N'TIC-638639493855024608-9404')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (46, 3, 24, 32, N'TIC-638639493855066064-6378')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (47, 1, 25, 29, N'TIC-638639495050322855-3922')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (48, 2, 25, 30, N'TIC-638639495050412084-8526')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (49, 1, 25, 31, N'TIC-638639495050452224-7157')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (50, 1, 26, 40, N'TIC-638639495330648107-5261')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (51, 3, 26, 41, N'TIC-638639495330738152-7174')
GO
INSERT [dbo].[OrderDetails] ([Id], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (52, 1, 26, 42, N'TIC-638639495330798126-7751')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (1, 1, 1, CAST(N'2023-05-17T10:00:00.000' AS DateTime), 3, CAST(750 AS Decimal(10, 0)), N'已付款', N'A0001')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (2, 2, 2, CAST(N'2023-06-02T11:00:00.000' AS DateTime), 2, CAST(250 AS Decimal(10, 0)), N'已付款', N'A0002')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (3, 3, 3, CAST(N'2023-04-05T12:00:00.000' AS DateTime), 2, CAST(200 AS Decimal(10, 0)), N'已付款', N'A0003')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (4, 4, 4, CAST(N'2023-07-21T13:00:00.000' AS DateTime), 2, CAST(350 AS Decimal(10, 0)), N'已付款', N'A0004')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (5, 5, 5, CAST(N'2023-07-21T14:00:00.000' AS DateTime), 1, CAST(300 AS Decimal(10, 0)), N'已付款', N'A0005')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (6, 6, 6, CAST(N'2023-03-24T15:00:00.000' AS DateTime), 5, CAST(250 AS Decimal(10, 0)), N'已付款', N'A0006')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (7, 7, 7, CAST(N'2023-05-03T16:00:00.000' AS DateTime), 4, CAST(200 AS Decimal(10, 0)), N'已付款', N'A0007')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (8, 8, 8, CAST(N'2023-06-09T17:00:00.000' AS DateTime), 5, CAST(350 AS Decimal(10, 0)), N'已付款', N'A0008')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (9, 9, 9, CAST(N'2023-02-17T18:00:00.000' AS DateTime), 3, CAST(300 AS Decimal(10, 0)), N'已付款', N'A0009')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (10, 10, 10, CAST(N'2023-03-10T19:00:00.000' AS DateTime), 1, CAST(280 AS Decimal(10, 0)), N'已付款', N'A0010')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (11, 49, 11, CAST(N'2024-10-08T00:32:21.487' AS DateTime), 3, CAST(610 AS Decimal(10, 0)), N'Cancelled', N'MOV-20241008003221-6477')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (12, 51, 11, CAST(N'2024-10-01T00:00:00.000' AS DateTime), 2, CAST(430 AS Decimal(10, 0)), N'已付款', N'MOV-20241001001573-1493')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (13, 52, 11, CAST(N'2024-10-04T00:00:00.000' AS DateTime), 1, CAST(230 AS Decimal(10, 0)), N'已付款', N'MOV-20241004006187-1439')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (14, 23, 12, CAST(N'2024-10-08T01:43:06.017' AS DateTime), 3, CAST(690 AS Decimal(10, 0)), N'已付款', N'MOV-20241008014306-1449')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (15, 23, 13, CAST(N'2024-10-08T01:44:57.377' AS DateTime), 2, CAST(430 AS Decimal(10, 0)), N'已付款', N'MOV-20241008014457-8294')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (16, 42, 13, CAST(N'2024-10-08T01:45:46.583' AS DateTime), 3, CAST(610 AS Decimal(10, 0)), N'已付款', N'MOV-20241008014546-1558')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (17, 33, 13, CAST(N'2024-10-08T01:46:21.097' AS DateTime), 3, CAST(660 AS Decimal(10, 0)), N'已付款', N'MOV-20241008014621-7618')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (18, 24, 14, CAST(N'2024-10-08T01:49:04.067' AS DateTime), 3, CAST(610 AS Decimal(10, 0)), N'已付款', N'MOV-20241008014904-8797')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (19, 42, 14, CAST(N'2024-10-08T01:49:36.190' AS DateTime), 3, CAST(610 AS Decimal(10, 0)), N'已付款', N'MOV-20241008014936-8016')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (20, 37, 14, CAST(N'2024-10-08T01:50:02.203' AS DateTime), 2, CAST(430 AS Decimal(10, 0)), N'已付款', N'MOV-20241008015002-2769')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (21, 23, 15, CAST(N'2024-10-08T01:51:58.463' AS DateTime), 2, CAST(410 AS Decimal(10, 0)), N'已付款', N'MOV-20241008015158-9781')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (22, 37, 15, CAST(N'2024-10-08T01:52:26.570' AS DateTime), 3, CAST(690 AS Decimal(10, 0)), N'已付款', N'MOV-20241008015226-4162')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (23, 27, 16, CAST(N'2024-10-08T01:55:34.153' AS DateTime), 3, CAST(610 AS Decimal(10, 0)), N'已付款', N'MOV-20241008015534-8621')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (24, 40, 16, CAST(N'2024-10-08T01:56:25.487' AS DateTime), 3, CAST(610 AS Decimal(10, 0)), N'已付款', N'MOV-20241008015625-9040')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (25, 28, 17, CAST(N'2024-10-08T01:58:25.023' AS DateTime), 3, CAST(630 AS Decimal(10, 0)), N'已付款', N'MOV-20241008015825-3452')
GO
INSERT [dbo].[Orders] ([Id], [MovieReleaseScheduleId], [MemberId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (26, 27, 17, CAST(N'2024-10-08T01:58:53.050' AS DateTime), 3, CAST(590 AS Decimal(10, 0)), N'已付款', N'MOV-20241008015853-1159')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (1, N'A1', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (2, N'A2', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (3, N'A3', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (4, N'A4', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (5, N'A5', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (6, N'A6', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (7, N'A7', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (8, N'A8', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (9, N'A9', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (10, N'A10', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (11, N'A11', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (12, N'A12', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (13, N'B1', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (14, N'B2', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (15, N'B3', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (16, N'B4', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (17, N'B5', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (18, N'B6', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (19, N'B7', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (20, N'B8', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (22, N'B9', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (23, N'B10', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (24, N'B11', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (25, N'B12', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (26, N'C1', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (27, N'C2', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (28, N'C3', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (29, N'C4', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (30, N'C5', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (31, N'C6', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (32, N'C7', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (33, N'C8', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (34, N'C9', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (35, N'C10', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (36, N'C11', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (37, N'C12', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (38, N'D1', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (39, N'D2', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (40, N'D3', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (41, N'D4', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (42, N'D5', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (43, N'D6', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (44, N'D7', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (45, N'D8', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (46, N'D9', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (47, N'D10', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (48, N'D11', 1)
GO
INSERT [dbo].[Seats] ([Id], [SeatNumber], [SeatStatus]) VALUES (49, N'D12', 1)
GO
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[ShowDates] ON 
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (1, CAST(N'2023-05-16' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (2, CAST(N'2023-05-17' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (3, CAST(N'2023-05-18' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (4, CAST(N'2023-05-19' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (5, CAST(N'2023-05-20' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (6, CAST(N'0001-01-01' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (7, CAST(N'2024-10-06' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (8, CAST(N'2024-10-29' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (9, CAST(N'2024-10-31' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (10, CAST(N'2024-10-12' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (11, CAST(N'2024-10-23' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (12, CAST(N'2024-10-11' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (13, CAST(N'2024-10-07' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (14, CAST(N'2024-10-25' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (15, CAST(N'2024-10-14' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (16, CAST(N'2024-10-09' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (17, CAST(N'2024-10-03' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (18, CAST(N'2024-10-10' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (19, CAST(N'2024-10-30' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (20, CAST(N'2024-11-13' AS Date))
GO
INSERT [dbo].[ShowDates] ([Id], [ShowTimeDate]) VALUES (21, CAST(N'2024-10-05' AS Date))
GO
SET IDENTITY_INSERT [dbo].[ShowDates] OFF
GO
SET IDENTITY_INSERT [dbo].[ShowTimes] ON 
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (1, 1, 1, 1, CAST(N'08:00:00' AS Time), CAST(N'10:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (2, 1, 1, 1, CAST(N'11:00:00' AS Time), CAST(N'13:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (3, 1, 1, 1, CAST(N'14:00:00' AS Time), CAST(N'16:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (4, 1, 1, 1, CAST(N'17:00:00' AS Time), CAST(N'19:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (5, 1, 1, 1, CAST(N'20:00:00' AS Time), CAST(N'22:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (6, 1, 2, 1, CAST(N'09:00:00' AS Time), CAST(N'11:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (7, 1, 2, 1, CAST(N'12:00:00' AS Time), CAST(N'14:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (8, 1, 2, 1, CAST(N'15:00:00' AS Time), CAST(N'17:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (9, 1, 2, 1, CAST(N'18:00:00' AS Time), CAST(N'20:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (10, 1, 2, 1, CAST(N'21:00:00' AS Time), CAST(N'23:21:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (62, 2, 16, 2, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (63, 2, 16, 2, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (64, 2, 16, 2, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (65, 2, 16, 2, CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (66, 7, 16, 2, CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (67, 2, 18, 2, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (68, 2, 18, 2, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (69, 2, 18, 2, CAST(N'16:30:00' AS Time), CAST(N'18:30:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (71, 5, 18, 2, CAST(N'19:30:00' AS Time), CAST(N'21:30:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (72, 5, 12, 2, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (73, 2, 12, 2, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (74, 2, 12, 2, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (75, 2, 12, 2, CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (76, 1, 12, 2, CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (78, 2, 10, 2, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (79, 2, 10, 2, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (80, 2, 10, 2, CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (81, 3, 10, 2, CAST(N'20:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (82, 8, 13, 2, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (83, 8, 13, 2, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (85, 4, 13, 2, CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (86, 9, 16, 3, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (87, 3, 16, 3, CAST(N'13:10:00' AS Time), CAST(N'15:10:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (88, 1, 16, 3, CAST(N'15:10:00' AS Time), CAST(N'17:10:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (89, 9, 16, 3, CAST(N'18:10:00' AS Time), CAST(N'19:10:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (90, 6, 7, 3, CAST(N'20:20:00' AS Time), CAST(N'22:20:00' AS Time))
GO
INSERT [dbo].[ShowTimes] ([Id], [MovieInfoId], [ShowDateId], [AuditoriumId], [StartTime], [EndTime]) VALUES (91, 7, 21, 3, CAST(N'21:30:00' AS Time), CAST(N'23:30:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[ShowTimes] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 
GO
INSERT [dbo].[Tickets] ([Id], [TicketType], [TicketPrice]) VALUES (1, N'全票', CAST(230 AS Decimal(10, 0)))
GO
INSERT [dbo].[Tickets] ([Id], [TicketType], [TicketPrice]) VALUES (2, N'優待票', CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Tickets] ([Id], [TicketType], [TicketPrice]) VALUES (3, N'愛心票', CAST(180 AS Decimal(10, 0)))
GO
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Topups] ON 
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (1, 1, CAST(1000 AS Decimal(10, 0)), CAST(N'2023-05-01T10:00:00.000' AS DateTime), N'B0001')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (2, 2, CAST(500 AS Decimal(10, 0)), CAST(N'2023-05-02T11:00:00.000' AS DateTime), N'B0002')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (3, 3, CAST(1500 AS Decimal(10, 0)), CAST(N'2023-05-03T12:00:00.000' AS DateTime), N'B0003')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (4, 4, CAST(800 AS Decimal(10, 0)), CAST(N'2023-05-04T13:00:00.000' AS DateTime), N'B0004')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (5, 5, CAST(2000 AS Decimal(10, 0)), CAST(N'2023-05-05T14:00:00.000' AS DateTime), N'B0005')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (6, 11, CAST(1000 AS Decimal(10, 0)), CAST(N'2024-10-08T00:18:46.807' AS DateTime), N'ORD-20241008001846-3998')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (7, 12, CAST(2000 AS Decimal(10, 0)), CAST(N'2024-10-08T01:42:47.180' AS DateTime), N'ORD-20241008014247-8434')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (8, 13, CAST(5000 AS Decimal(10, 0)), CAST(N'2024-10-08T01:44:34.543' AS DateTime), N'ORD-20241008014434-8968')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (9, 14, CAST(3000 AS Decimal(10, 0)), CAST(N'2024-10-08T01:48:35.853' AS DateTime), N'ORD-20241008014835-9146')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (10, 15, CAST(2000 AS Decimal(10, 0)), CAST(N'2024-10-08T01:51:44.087' AS DateTime), N'ORD-20241008015144-2006')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (11, 16, CAST(3000 AS Decimal(10, 0)), CAST(N'2024-10-08T01:55:16.243' AS DateTime), N'ORD-20241008015516-7990')
GO
INSERT [dbo].[Topups] ([Id], [MemberId], [TopUpAmount], [OrderTime], [OrderNumber]) VALUES (12, 17, CAST(2000 AS Decimal(10, 0)), CAST(N'2024-10-08T01:58:06.673' AS DateTime), N'ORD-20241008015806-5893')
GO
SET IDENTITY_INSERT [dbo].[Topups] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionHistory] ON 
GO
INSERT [dbo].[TransactionHistory] ([Id], [MemberId], [TransactionDate], [TopUpAmount], [Amount]) VALUES (1, 1, CAST(N'2023-05-01T10:00:00.000' AS DateTime), CAST(1000 AS Decimal(10, 0)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[TransactionHistory] ([Id], [MemberId], [TransactionDate], [TopUpAmount], [Amount]) VALUES (2, 2, CAST(N'2023-05-02T11:00:00.000' AS DateTime), CAST(500 AS Decimal(10, 0)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[TransactionHistory] ([Id], [MemberId], [TransactionDate], [TopUpAmount], [Amount]) VALUES (3, 3, CAST(N'2023-05-03T12:00:00.000' AS DateTime), CAST(1500 AS Decimal(10, 0)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[TransactionHistory] ([Id], [MemberId], [TransactionDate], [TopUpAmount], [Amount]) VALUES (4, 4, CAST(N'2023-05-04T13:00:00.000' AS DateTime), CAST(800 AS Decimal(10, 0)), CAST(800 AS Decimal(10, 0)))
GO
INSERT [dbo].[TransactionHistory] ([Id], [MemberId], [TransactionDate], [TopUpAmount], [Amount]) VALUES (5, 5, CAST(N'2023-05-05T14:00:00.000' AS DateTime), CAST(2000 AS Decimal(10, 0)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[TransactionHistory] ([Id], [MemberId], [TransactionDate], [TopUpAmount], [Amount]) VALUES (6, 1, CAST(N'2023-05-17T10:00:00.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(-300 AS Decimal(10, 0)))
GO
INSERT [dbo].[TransactionHistory] ([Id], [MemberId], [TransactionDate], [TopUpAmount], [Amount]) VALUES (7, 2, CAST(N'2023-06-02T11:00:00.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(-250 AS Decimal(10, 0)))
GO
INSERT [dbo].[TransactionHistory] ([Id], [MemberId], [TransactionDate], [TopUpAmount], [Amount]) VALUES (8, 3, CAST(N'2023-04-05T12:00:00.000' AS DateTime), CAST(0 AS Decimal(10, 0)), CAST(-200 AS Decimal(10, 0)))
GO
SET IDENTITY_INSERT [dbo].[TransactionHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Account], [Password]) VALUES (1, N'admin1', N'88CF5593CCDEAD2E5856FB44A8FA202C0D44A05C256B27CD77C1E40B6F919A69')
GO
INSERT [dbo].[Users] ([Id], [Account], [Password]) VALUES (2, N'manager1', N'manager123')
GO
INSERT [dbo].[Users] ([Id], [Account], [Password]) VALUES (3, N'staff1', N'staff123')
GO
INSERT [dbo].[Users] ([Id], [Account], [Password]) VALUES (4, N'support1', N'support123')
GO
INSERT [dbo].[Users] ([Id], [Account], [Password]) VALUES (5, N'system1', N'system123')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Auditoriums] ADD  CONSTRAINT [DF_Auditoriums_AuditoriumStatus]  DEFAULT ('可使用') FOR [AuditoriumStatus]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CurrentBalance]  DEFAULT ((0)) FOR [CurrentBalance]
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
