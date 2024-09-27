USE [master]
GO
/****** Object:  Database [BookMovie]    Script Date: 2024/9/27 下午 05:01:06 ******/
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
/****** Object:  User [sa5]    Script Date: 2024/9/27 下午 05:01:07 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[Auditoriums]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[Cinemas]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[CustomerService]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[Members]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[MovieImages]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[MovieInfos]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[MovieRatings]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[MovieReleaseSchedules]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2024/9/27 下午 05:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuditoriumId] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[TicketNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/9/27 下午 05:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieInfoId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[ShowTimeId] [int] NOT NULL,
	[ShowDateId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Seats]    Script Date: 2024/9/27 下午 05:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuditoriumId] [int] NOT NULL,
	[SeatNumber] [varchar](10) NOT NULL,
	[SeatStatus] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShowDates]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[ShowTimes]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[Topups]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2024/9/27 下午 05:01:07 ******/
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
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (1, 1, N'1廳', 80, N'可使用')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (2, 1, N'2廳', 80, N'可使用')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (3, 1, N'3廳', 80, N'可使用')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (4, 1, N'4廳', 80, N'可使用')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (6, 1, N'5廳', 80, N'可使用')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (7, 1, N'6廳', 80, N'可使用')
GO
INSERT [dbo].[Auditoriums] ([Id], [CinemaId], [AuditoriumName], [SeatCapacity], [AuditoriumStatus]) VALUES (8, 1, N'7廳', 80, N'可使用')
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
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (1, 1, N'/images/movie1_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (2, 1, N'/images/movie2_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (3, 1, N'/images/movie3_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (4, 2, N'/images/movie4_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (5, 2, N'/images/movie5_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (6, 2, N'/images/movie6_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (7, 3, N'/images/movie7_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (8, 3, N'/images/movie8_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (9, 3, N'/images/movie9_still.jpg')
GO
INSERT [dbo].[MovieImages] ([Id], [MovieInfoId], [stills]) VALUES (10, 3, N'/images/movie10_still.jpg')
GO
SET IDENTITY_INSERT [dbo].[MovieImages] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieInfos] ON 
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (1, 1, N'玩命關頭10', N'Fast X', N'輔導級', N'唐老大一家人將面臨最致命的對手', N'https://youtu.be/32RAq6JzY-w', CAST(N'2023-05-17' AS Date), 1, N'路易斯·萊特里爾', N'馮·迪索, 傑森·史塔森, 米雪兒·羅德里奎茲', N'英語', N'141分鐘', N'環球影業', N'FastX.jpg', CAST(5.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (2, 2, N'蜘蛛人：穿越新宇宙', N'Spider-Man: Across the Spider-Verse', N'保護級', N'邁爾斯·莫拉雷斯展開多重宇宙冒險', N'https://youtu.be/shW9i6k8cB0', CAST(N'2023-06-02' AS Date), 1, N'瓦昆·杜斯·山托斯, 凱普·鮑爾斯, 賈斯汀·K·湯普森', N'沙梅克·摩爾, 海莉·斯坦菲爾德, 奧斯卡·伊薩克', N'英語', N'140分鐘', N'索尼影業', N'SpiderMan.jpg', CAST(4.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (3, 3, N'超級瑪利歐兄弟電影版', N'The Super Mario Bros. Movie', N'普遍級', N'瑪利歐兄弟的冒險旅程', N'https://youtu.be/TnGl01FkMMo', CAST(N'2023-04-05' AS Date), 1, N'亞倫·霍瓦斯, 麥可·傑勒尼克', N'克里斯·帕拉特, 安雅·泰勒喬伊, 傑克·布萊克', N'英語', N'92分鐘', N'環球影業', N'Mario.jpg', CAST(5.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (4, 4, N'奧本海默', N'Oppenheimer', N'輔導級', N'原子彈之父的傳記電影', N'https://youtu.be/uYPbbksJxIg', CAST(N'2023-07-21' AS Date), 1, N'克里斯多福·諾蘭', N'基里安·墨菲, 艾蜜莉·布朗特, 麥特·戴蒙', N'英語', N'180分鐘', N'環球影業', N'Oppenheimer.jpg', CAST(4.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (5, 5, N'芭比', N'Barbie', N'保護級', N'芭比娃娃的真人電影', N'https://youtu.be/pBk4NYhWNMM', CAST(N'2023-07-21' AS Date), 1, N'葛莉塔·潔薇', N'瑪格·羅比, 萊恩·葛斯林, 威爾·法洛', N'英語', N'114分鐘', N'華納兄弟', N'Barbie.jpg', CAST(5.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (6, 1, N'捍衛任務4', N'John Wick: Chapter 4', N'輔導級', N'約翰·威克的最後一戰', N'https://youtu.be/qEVUtrk8_B4', CAST(N'2023-03-24' AS Date), 1, N'查德·史塔赫斯基', N'基努·李維, 甄子丹, 比爾·斯卡斯加德', N'英語', N'169分鐘', N'獅門影業', N'JohnWick.jpg', CAST(4.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (7, 2, N'星際異攻隊3', N'Guardians of the Galaxy Vol. 3', N'保護級', N'星際異攻隊的最後冒險', N'https://youtu.be/u3V5KDHRQvk', CAST(N'2023-05-03' AS Date), 1, N'詹姆斯·岡恩', N'克里斯·帕拉特, 柔伊·莎達娜, 戴夫·巴蒂斯塔', N'英語', N'150分鐘', N'迪士尼', N'Galaxy.jpg', CAST(5.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (8, 3, N'變形金剛：萬獸崛起', N'Transformers: Rise of the Beasts', N'保護級', N'全新的變形金剛冒險', N'https://youtu.be/itnqEauWQZM', CAST(N'2023-06-09' AS Date), 1, N'史蒂芬·卡普爾', N'安東尼·拉莫斯, 多明尼克·菲什巴克, 蘿倫·維萊茲', N'英語', N'127分鐘', N'派拉蒙', N'Transformers.jpg', CAST(4.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (9, 4, N'蟻人與黃蜂女：量子狂熱', N'Ant-Man and the Wasp: Quantumania', N'保護級', N'蟻人家族的量子冒險', N'https://youtu.be/5WfTEZJnv_8', CAST(N'2023-02-17' AS Date), 1, N'佩頓·里德', N'保羅·路德, 伊凡潔琳·莉莉, 強納森·梅傑斯', N'英語', N'124分鐘', N'迪士尼', N'AntMan.jpg', CAST(5.0 AS Decimal(2, 1)))
GO
INSERT [dbo].[MovieInfos] ([Id], [GenreId], [MovieName], [EnglishName], [Grading], [Synopsis], [TrailerURL], [PremiereDate], [OnAir], [Director], [MovieCast], [MovieLanguage], [Duration], [Distributor], [MainPicture], [TotalRating]) VALUES (10, 5, N'驚聲尖叫6', N'Scream VI', N'輔導級', N'在紐約市展開的新一輪殺戮', N'https://youtu.be/h74AXqw4Opc', CAST(N'2023-03-10' AS Date), 1, N'麥特·貝提內里-奧爾平, 泰勒·吉列特', N'梅莉莎·巴雷拉, 賈斯敏·薩沃伊·布朗, 梅森·古丁', N'英語', N'123分鐘', N'派拉蒙', N'ScreamVI.jpg', CAST(4.0 AS Decimal(2, 1)))
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
SET IDENTITY_INSERT [dbo].[MovieReleaseSchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (1, 1, 1, 1, 1, N'A001')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (2, 1, 2, 1, 2, N'B002')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (3, 1, 2, 1, 3, N'C003')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (4, 1, 2, 4, 4, N'D004')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (5, 2, 3, 5, 5, N'E005')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (6, 2, 3, 6, 6, N'F006')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (7, 2, 1, 7, 7, N'G007')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (8, 3, 1, 8, 8, N'H008')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (9, 3, 2, 9, 9, N'I009')
GO
INSERT [dbo].[OrderDetails] ([Id], [AuditoriumId], [TicketId], [OrderId], [SeatId], [TicketNumber]) VALUES (10, 3, 2, 10, 10, N'J010')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (1, 1, 1, 1, 1, CAST(N'2023-05-17T10:00:00.000' AS DateTime), 3, CAST(750 AS Decimal(10, 0)), N'已付款', N'A0001')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (2, 8, 2, 2, 1, CAST(N'2023-06-02T11:00:00.000' AS DateTime), 2, CAST(250 AS Decimal(10, 0)), N'已付款', N'A0002')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (3, 1, 3, 3, 2, CAST(N'2023-04-05T12:00:00.000' AS DateTime), 2, CAST(200 AS Decimal(10, 0)), N'已付款', N'A0003')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (4, 2, 4, 4, 2, CAST(N'2023-07-21T13:00:00.000' AS DateTime), 2, CAST(350 AS Decimal(10, 0)), N'已付款', N'A0004')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (5, 2, 5, 5, 3, CAST(N'2023-07-21T14:00:00.000' AS DateTime), 1, CAST(300 AS Decimal(10, 0)), N'已付款', N'A0005')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (6, 3, 6, 6, 3, CAST(N'2023-03-24T15:00:00.000' AS DateTime), 5, CAST(250 AS Decimal(10, 0)), N'已付款', N'A0006')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (7, 4, 7, 7, 4, CAST(N'2023-05-03T16:00:00.000' AS DateTime), 4, CAST(200 AS Decimal(10, 0)), N'已付款', N'A0007')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (8, 5, 8, 8, 4, CAST(N'2023-06-09T17:00:00.000' AS DateTime), 5, CAST(350 AS Decimal(10, 0)), N'已付款', N'A0008')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (9, 6, 9, 9, 5, CAST(N'2023-02-17T18:00:00.000' AS DateTime), 3, CAST(300 AS Decimal(10, 0)), N'已付款', N'A0009')
GO
INSERT [dbo].[Orders] ([Id], [MovieInfoId], [MemberId], [ShowTimeId], [ShowDateId], [OrderDate], [TotalTicketCount], [TotalAmount], [PaymentStatus], [OrderNumber]) VALUES (10, 7, 10, 10, 5, CAST(N'2023-03-10T19:00:00.000' AS DateTime), 1, CAST(280 AS Decimal(10, 0)), N'已付款', N'A0010')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (1, 1, N'A1', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (2, 1, N'A2', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (3, 1, N'A3', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (4, 1, N'A4', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (5, 1, N'B1', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (6, 1, N'B2', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (7, 1, N'B3', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (8, 1, N'B4', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (9, 2, N'A1', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (10, 2, N'A2', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (11, 2, N'A3', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (12, 2, N'A4', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (13, 2, N'B1', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (14, 2, N'B2', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (15, 2, N'B3', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (16, 2, N'B4', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (17, 3, N'A1', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (18, 3, N'A2', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (19, 3, N'A3', N'可使用')
GO
INSERT [dbo].[Seats] ([Id], [AuditoriumId], [SeatNumber], [SeatStatus]) VALUES (20, 3, N'A4', N'可使用')
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
INSERT [dbo].[Users] ([Id], [Account], [Password]) VALUES (1, N'admin1', N'admin123')
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
ALTER TABLE [dbo].[Seats] ADD  CONSTRAINT [DF_Seats_SeatStatus]  DEFAULT ('可使用') FOR [SeatStatus]
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
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Auditoriums] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditoriums] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Auditoriums]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_MovieInfos] FOREIGN KEY([MovieInfoId])
REFERENCES [dbo].[MovieInfos] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_MovieInfos]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ShowDates] FOREIGN KEY([ShowDateId])
REFERENCES [dbo].[ShowDates] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_ShowDates]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ShowTimes] FOREIGN KEY([ShowTimeId])
REFERENCES [dbo].[ShowTimes] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_ShowTimes]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Auditoriums] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditoriums] ([Id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Auditoriums]
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
