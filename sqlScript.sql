USE [master]
GO
/****** Object:  Database [CongestionDb]    Script Date: 12/01/23 05:37:55 PM ******/
CREATE DATABASE [CongestionDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CongestionDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\CongestionDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CongestionDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\CongestionDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CongestionDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CongestionDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CongestionDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CongestionDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CongestionDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CongestionDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CongestionDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CongestionDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CongestionDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CongestionDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CongestionDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CongestionDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CongestionDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CongestionDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CongestionDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CongestionDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CongestionDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CongestionDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CongestionDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CongestionDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CongestionDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CongestionDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CongestionDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CongestionDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CongestionDb] SET RECOVERY FULL 
GO
ALTER DATABASE [CongestionDb] SET  MULTI_USER 
GO
ALTER DATABASE [CongestionDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CongestionDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CongestionDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CongestionDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CongestionDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CongestionDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CongestionDb', N'ON'
GO
ALTER DATABASE [CongestionDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [CongestionDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CongestionDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/01/23 05:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 12/01/23 05:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[MaxDailyCharge] [int] NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exemption]    Script Date: 12/01/23 05:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exemption](
	[Id] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[CityId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Exemption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxRates]    Script Date: 12/01/23 05:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxRates](
	[Id] [uniqueidentifier] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Amount] [float] NOT NULL,
	[CityId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_TaxRates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231201092051_InitialCreate', N'8.0.0')
GO
INSERT [dbo].[City] ([Id], [Name], [MaxDailyCharge], [CreatedDate]) VALUES (N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', N'Gutenberg', 60, CAST(N'2023-12-01T00:00:00.0000000+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'cc92acaa-966c-4ca1-9726-1d01b2cc22a4', CAST(N'2013-05-01T00:00:00.0000000' AS DateTime2), CAST(N'2013-05-01T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1543605+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'b87d1c71-31d1-4905-b6f6-1e4d9a9d278e', CAST(N'2013-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2013-04-01T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1533614+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'6166e03f-0c84-482f-8ca4-2d957f268ee9', CAST(N'2013-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2013-06-06T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1553604+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'95c88b97-a3d6-487d-89c2-36d1338dd9da', CAST(N'2013-12-24T00:00:00.0000000' AS DateTime2), CAST(N'2013-12-26T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1563591+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'2b674e57-17ef-4adb-b119-84d1aae4c51c', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1523597+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'd808aefd-85ae-485f-a2fb-981a76871a02', CAST(N'2013-12-31T00:00:00.0000000' AS DateTime2), CAST(N'2013-12-31T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1573585+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'72a7d3de-c96d-4a85-81b4-aab4c3c2792d', CAST(N'2013-04-30T00:00:00.0000000' AS DateTime2), CAST(N'2013-04-30T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1543605+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'6c3ee8ec-eaee-478e-951d-b0bc77ee7c83', CAST(N'2013-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2013-07-30T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1563591+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'17d57e77-c899-4279-985b-b4d3203b0625', CAST(N'2013-03-28T00:00:00.0000000' AS DateTime2), CAST(N'2013-03-29T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1533614+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'dac547fe-77f2-457e-8495-bbb47f62eb41', CAST(N'2013-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2013-11-01T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1563591+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'df066bf8-4285-4f6e-9d76-c723cae59fb5', CAST(N'2013-05-08T00:00:00.0000000' AS DateTime2), CAST(N'2013-05-09T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1553604+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[Exemption] ([Id], [StartDate], [EndDate], [CityId], [CreatedDate]) VALUES (N'c8ec0c10-27d2-4785-967e-ccf77952aba9', CAST(N'2013-06-21T00:00:00.0000000' AS DateTime2), CAST(N'2013-06-21T00:00:00.0000000' AS DateTime2), N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T14:06:05.1563591+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'f7b0a24e-a67f-47e6-a58b-25f603eac4cb', CAST(N'17:00:00' AS Time), CAST(N'17:59:00' AS Time), 13, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T13:58:05.8559328+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'50089872-a22f-445b-a1ad-2e863a9cdb62', CAST(N'06:00:00' AS Time), CAST(N'06:29:00' AS Time), 8, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T00:00:00.0000000+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'e600a1bd-7563-4783-a9ec-3f34693cf126', CAST(N'06:30:00' AS Time), CAST(N'06:59:00' AS Time), 13, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T00:00:00.0000000+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'bf4342e9-dc78-4fa1-9aac-661705c792b1', CAST(N'18:30:00' AS Time), CAST(N'05:59:00' AS Time), 0, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T00:00:00.0000000+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'0f3c7f9b-8131-41ef-ab86-adbdb157fc29', CAST(N'07:00:00' AS Time), CAST(N'07:59:00' AS Time), 18, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T13:58:05.8539358+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'da8db180-362a-4540-afbf-af2802dbb986', CAST(N'15:00:00' AS Time), CAST(N'15:29:00' AS Time), 13, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T13:58:05.8549323+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'f494140a-3420-4054-9d73-b70fd09f482b', CAST(N'18:00:00' AS Time), CAST(N'18:29:00' AS Time), 8, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T13:58:05.8559328+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'cb6f4f64-8e6e-4c2a-883c-bc0399260dd9', CAST(N'15:30:00' AS Time), CAST(N'16:59:00' AS Time), 18, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T13:58:05.8549323+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'c5a63529-e91a-4414-93b9-e9fc54bac9a4', CAST(N'08:00:00' AS Time), CAST(N'08:29:00' AS Time), 13, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T13:58:05.8539358+03:30' AS DateTimeOffset))
GO
INSERT [dbo].[TaxRates] ([Id], [StartTime], [EndTime], [Amount], [CityId], [CreatedDate]) VALUES (N'0ac52700-586d-47b7-bba1-fbf80879c6f0', CAST(N'08:30:00' AS Time), CAST(N'14:59:00' AS Time), 8, N'079b79ac-24e6-4da1-8bac-ddee1e1aebb2', CAST(N'2023-12-01T13:58:05.8549323+03:30' AS DateTimeOffset))
GO
/****** Object:  Index [IX_Exemption_CityId]    Script Date: 12/01/23 05:37:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_Exemption_CityId] ON [dbo].[Exemption]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaxRates_CityId]    Script Date: 12/01/23 05:37:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaxRates_CityId] ON [dbo].[TaxRates]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exemption]  WITH CHECK ADD  CONSTRAINT [FK_Exemption_City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exemption] CHECK CONSTRAINT [FK_Exemption_City_CityId]
GO
ALTER TABLE [dbo].[TaxRates]  WITH CHECK ADD  CONSTRAINT [FK_TaxRates_City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaxRates] CHECK CONSTRAINT [FK_TaxRates_City_CityId]
GO
USE [master]
GO
ALTER DATABASE [CongestionDb] SET  READ_WRITE 
GO
