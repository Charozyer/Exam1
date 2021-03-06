USE [master]
GO
/****** Object:  Database [GosAutoInspection]    Script Date: 06.12.2021 14:14:17 ******/
CREATE DATABASE [GosAutoInspection]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GosAutoInspection', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GosAutoInspection.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GosAutoInspection_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GosAutoInspection_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GosAutoInspection] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GosAutoInspection].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GosAutoInspection] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GosAutoInspection] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GosAutoInspection] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GosAutoInspection] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GosAutoInspection] SET ARITHABORT OFF 
GO
ALTER DATABASE [GosAutoInspection] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GosAutoInspection] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GosAutoInspection] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GosAutoInspection] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GosAutoInspection] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GosAutoInspection] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GosAutoInspection] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GosAutoInspection] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GosAutoInspection] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GosAutoInspection] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GosAutoInspection] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GosAutoInspection] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GosAutoInspection] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GosAutoInspection] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GosAutoInspection] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GosAutoInspection] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GosAutoInspection] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GosAutoInspection] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GosAutoInspection] SET  MULTI_USER 
GO
ALTER DATABASE [GosAutoInspection] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GosAutoInspection] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GosAutoInspection] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GosAutoInspection] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GosAutoInspection] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GosAutoInspection] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GosAutoInspection] SET QUERY_STORE = OFF
GO
USE [GosAutoInspection]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 06.12.2021 14:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverId] [int] NOT NULL,
	[DriverName] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Middlename] [nvarchar](50) NOT NULL,
	[PassportNumber] [nvarchar](max) NOT NULL,
	[Postcode] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[AddressLife] [nvarchar](max) NOT NULL,
	[Company] [nvarchar](max) NULL,
	[JobName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Licence]    Script Date: 06.12.2021 14:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licence](
	[LicenceNumber] [bigint] NOT NULL,
	[DriverId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[LicenceDate] [date] NOT NULL,
	[ExpireDate] [date] NOT NULL,
	[Categories] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Licence] PRIMARY KEY CLUSTERED 
(
	[LicenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 06.12.2021 14:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[ManName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 06.12.2021 14:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 06.12.2021 14:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] NOT NULL,
	[StatName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfDrive]    Script Date: 06.12.2021 14:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfDrive](
	[TypeofDriveId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfDrive] PRIMARY KEY CLUSTERED 
(
	[TypeofDriveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06.12.2021 14:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Login] [nvarchar](50) NOT NULL,
	[Pass] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 06.12.2021 14:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VIN] [nvarchar](100) NOT NULL,
	[DriverId] [int] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[Color] [int] NOT NULL,
	[EngineType] [int] NOT NULL,
	[TypeofDriveId] [int] NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (1, N'Alonso', N'Hopkins', N'Caleb', N'2303160716', 760832, N'452 Cobblestone St.', N'452 Cobblestone St.', N'Global Gillette', N'Reporter', N'+7 (970) 383-8933', N'skippy@icloud.com', N'001-happy-18.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (2, N'Kaydence', N'Sellers', N'Susannah', N'5563160745', 807042, N'Hyattsville, MD 20782', N'Hyattsville, MD 20782', N'Coca-Cola', N'Elementary School Teacher', N'+7 (867 708-4447', N'isotopian@sbcglobal.net', N'002-cool-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (3, N'Finnegan', N'Bray', N'Brighton', N'3719717453', 83282, N'9648 Philmont Lane', N'9648 Philmont Lane', N'Harley-Davidson Motor Company', N'Childcare worker', N'+7 (221) 428-7850', N'isaacson@att.net', N'003-happy-17.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (4, N'Gideon', N'Arias', N'Varian', N'5810721066', 768289, N'Hanover Park, IL 60133', N'Hanover Park, IL 60133', N'Corona', N'Loan Officer', N'+7 (786) 274-7872', N'mugwump@mac.com', N'004-surprised-9.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (5, N'Case', N'Schultz', N'Aiden', N'2208937197', 780691, N'8438 North Fairground Court', N'8438 North Fairground Court', N'Johnnie Walker', N'Drafter', N'+7 (365) 752-6445', N'mcmillan@optonline.net', N'005-shocked-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (6, N'Pierre', N'Alvarado', N'Harriet', N'7184275223', 845839, N'Woodstock, GA 30188', N'Woodstock, GA 30188', N'SAP', N'Cost Estimator', N'+7 (446) 639-6043', N'dinther@hotmail.com', N'006-shocked-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (7, N'Esteban', N'Bell', N'Cameron', N'9563574791', 94009, N'148 Catherine Dr.', N'148 Catherine Dr.', N'Smirnoff', N'Clinical Laboratory Technician', N'+7 (555) 444-8316', N'pizza@yahoo.com', N'007-nervous-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (8, N'Spencer', N'Anderson', N'Meaghan', N'9008379623', 674783, N'Lithonia, GA 30038', N'Lithonia, GA 30038', N'Toyota Motor Corporation', N'Electrician', N'+7 (392) 682-4442', N'murty@outlook.com', N'008-nervous-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (9, N'Seth', N'Sweeney', N'Jax', N'3810530169', 845247, N'708 6th Drive', N'708 6th Drive', N'Caterpillar Inc.', N'Referee', N'+7 (836) 429-0386', N'aegreene@me.com', N'009-angry-6.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (10, N'Lincoln', N'Mason', N'Emeline', N'5387689700', 252988, N'Egg Harbor Township, NJ 08234', N'Egg Harbor Township, NJ 08234', N'Avon', N'Judge', N'+7 (283) 945-3092', N'jnolan@aol.com', N'010-drool.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (11, N'Lindsay', N'Curtis', N'Syllable', N'1152481271', 777867, N'8992 Union Rd.', N'8992 Union Rd.', N'Budweiser Stag Brewing Company', N'Security Guard', N'+7 (621) 359-3669', N'msherr@optonline.net', N'011-tired-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (12, N'Noah', N'Daugherty', N'Thomas', N'2924764363', 504859, N'Villa Park, IL 60181', N'Villa Park, IL 60181', N'IBM', N'Budget analyst', N'+7 (440) 561-0314', N'ranasta@icloud.com', N'012-tongue-7.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (13, N'Darien', N'Sellers', N'Nadeen', N'5110869140', 779085, N'12 Windsor St.', N'12 Windsor St.', N'Chase', N'Painter', N'+7 (331) 918-2434', N'punkis@hotmail.com', N'013-tongue-6.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (14, N'Jaylene', N'Schneider', N'Xavier', N'694884332', 144573, N'Waynesboro, PA 17268', N'Waynesboro, PA 17268', N'NTT Data', N'Occupational Therapist', N'+7 (944) 627-0176', N'pereinar@yahoo.com', N'014-tongue-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (15, N'Leonard', N'Schmitt', N'Vincent', N'7045366325', 864380, N'549 Lake View Dr.', N'549 Lake View Dr.', N'Intel Corporation', N'Physical Therapist', N'+7 (621) 405-7195', N'tskirvin@mac.com', N'015-smile-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (16, N'Maya', N'Richardson', N'Heath', N'7100947091', 265294, N'Garland, TX 75043', N'Garland, TX 75043', N'Sony', N'Photographer', N'+7 (837 639-1067', N'kewley@sbcglobal.net', N'016-sleeping-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (17, N'Thalia', N'Delacruz', N'Caprice', N'9169340517', 137788, N'314 N. Gulf Lane', N'314 N. Gulf Lane', N'Tesco Corporation', N'Cashier', N'+7 (769) 610-7084', N'ehood@icloud.com', N'017-nervous.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (18, N'Maci', N'Baird', N'Dustin', N'3097188032', 340075, N'Hollywood, FL 33020', N'Hollywood, FL 33020', N'Microsoft', N'Educator', N'+7 (308) 686-7622', N'ilial@aol.com', N'018-surprised-8.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (19, N'Ace', N'Stephenson', N'Amity', N'7796170860', 531408, N'3 Cooper Street', N'3 Cooper Street', N'McDonald''s', N'Professional athlete', N'+7 (319) 872-3287', N'elmer@comcast.net', N'019-tongue-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (20, N'Robert', N'Castro', N'Isaiah', N'5001550223', 912556, N'Coventry, RI 02816', N'Coventry, RI 02816', N'VISA', N'Janitor', N'+7 (341) 620-5356', N'scarolan@live.com', N'020-happy-16.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (21, N'Efrain', N'Stark', N'Jared', N'4204741281', 838795, N'53 E. Marvon St.', N'53 E. Marvon St.', N'Zara', N'Massage Therapist', N'+7 (266) 561-7456', N'bwcarty@yahoo.com', N'021-wink-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (22, N'Katelynn', N'Montgomery', N'Drake', N'1209731500', 520544, N'Jamaica Plain, MA 02130', N'Jamaica Plain, MA 02130', N'Morgan Stanley', N'Psychologist', N'+7 (408) 673-0059', N'facet@outlook.com', N'022-laughing-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (23, N'Sammy', N'Freeman', N'Lane', N'1085749551', 902946, N'15 Indian Summer St.', N'15 Indian Summer St.', N'Mitsubishi', N'IT Manager', N'+7 (906) 825-5704', N'metzzo@att.net', N'023-laughing-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (24, N'Jamal', N'Stokes', N'Rayleen', N'7125277444', 684826, N'Canton, GA 30114', N'Canton, GA 30114', N'Audi', N'Anthropologist', N'+7 (866) 732-4338', N'slaff@aol.com', N'024-sweat-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (25, N'Lilliana', N'Bell', N'Quintin', N'4858465200', 299125, N'1 Rockville Ave.', N'1 Rockville Ave.', N'eBay', N'Executive Assistant', N'+7 (744) 876-9856', N'caidaperl@mac.com', N'025-happy-15.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (26, N'Jaidyn', N'Ali', N'Kaitlin', N'9255131955', 623940, N'Piedmont, SC 29673', N'Piedmont, SC 29673', N'Ralph Lauren Corporation', N'Artist', N'+7 (872) 230-3310', N'jigsaw@verizon.net', N'026-happy-14.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (27, N'Solomon', N'Nixon', N'Jolee', N'3965425455', 243802, N'154 Galvin Ave.', N'154 Galvin Ave.', N'Wal-Mart', N'Mechanical Engineer', N'+7 (572) 467-2895', N'hoyer@optonline.net', N'027-laughing.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (28, N'Isaias', N'Mcdowell', N'Kalan', N'4368409875', 697427, N'Savannah, GA 31404', N'Savannah, GA 31404', N'Panasonic Corporation', N'Firefighter', N'+7 (451) 768-6075', N'danneng@msn.com', N'028-happy-13.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (29, N'Neveah', N'Dean', N'Evony', N'9283299023', 503601, N'56 Annadale Dr.', N'56 Annadale Dr.', N'Nike, Inc.', N'Carpenter', N'+7 (555) 802-6671', N'burniske@outlook.com', N'029-happy-12.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (30, N'Koen', N'Waters', N'Abraham', N'4065664366', 732787, N'Lititz, PA 17543', N'Lititz, PA 17543', N'Nissan Motor Co., Ltd.', N'Actuary', N'+7 (833) 460-5788', N'jipsen@sbcglobal.net', N'030-crying-8.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (31, N'Cale', N'Odom', N'Ann', N'4877252066', 650754, N'7285 Locust Drive', N'7285 Locust Drive', N'MTV', N'Compliance Officer', N'+7 (234) 895-8976', N'agapow@hotmail.com', N'031-crying-7.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (32, N'Layton', N'Ruiz', N'Aryn', N'8656317830', 924502, N'Jackson Heights, NY 11372', N'Jackson Heights, NY 11372', N'Cartier SA', N'Computer Systems Administrator', N'+7 (682) 469-8567', N'mobileip@icloud.com', N'032-bored.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (33, N'Monserrat', N'Patrick', N'Coralie', N'1583513755', 670778, N'935 West Ave.', N'935 West Ave.', N'Nescafé', N'HR Specialist', N'+7 (682) 555-7940', N'mglee@yahoo.com', N'033-cool-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (34, N'Kamden', N'Hardin', N'Ray', N'2179517256', 939472, N'Columbus, GA 31904', N'Columbus, GA 31904', N'Allianz', N'Recreation & Fitness Worker', N'+7 (575) 985-7625', N'animats@yahoo.ca', N'034-angry-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (35, N'Janiya', N'Neal', N'Irene', N'5244495362', 172365, N'720 Summerhouse Street', N'720 Summerhouse Street', N'Ferrari S.p.A.', N'Financial Advisor', N'+7 (313) 507-8540', N'drewf@me.com', N'035-sad-14.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (36, N'Cornelius', N'Winters', N'James', N'9584586486', 424571, N'Maryville, TN 37803', N'Maryville, TN 37803', N'Kleenex', N'Auto Mechanic', N'+7 (608) 783-0267', N'slanglois@msn.com', N'036-angry-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (37, N'Kaden', N'Love', N'Neil', N'1850453434', 478037, N'139 N. Grand St.', N'139 N. Grand St.', N'Tiffany & Co.', N'Web Developer', N'+7 (688) 656-7203', N'notaprguy@verizon.net', N'037-happy-11.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (38, N'Finley', N'Mills', N'Ace', N'4286976952', 843098, N'Irwin, PA 15642', N'Irwin, PA 15642', N'3M', N'Civil Engineer', N'+7 (530) 402-7915', N'yruan@sbcglobal.net', N'038-angry-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (39, N'Markus', N'Henry', N'Edward', N'2767784535', 900432, N'400 Amerige St.', N'400 Amerige St.', N'Shell Oil Company', N'Chemist', N'+7 (262) 635-2834', N'bmorrow@me.com', N'039-cyclops-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (40, N'Romeo', N'Singleton', N'Preston', N'7677990002', 425361, N'Evans, GA 30809', N'Evans, GA 30809', N'Adobe Systems', N'Recreational Therapist', N'+7 (487 957-3536', N'adillon@verizon.net', N'040-surprised-7.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (41, N'Ethen', N'Glenn', N'Kate', N'634237367', 815003, N'225 Iroquois St.', N'225 Iroquois St.', N'IKEA', N'Microbiologist', N'+7 (918) 285-4740', N'kimvette@me.com', N'041-thinking-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (42, N'Abbey', N'Gordon', N'Berlynn', N'8909475995', 60302, N'Vienna, VA 22180', N'Vienna, VA 22180', N'Nokia', N'Event Planner', N'+7 (412) 706-8937', N'emcleod@outlook.com', N'042-book.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (43, N'Presley', N'Vasquez', N'Sheridan', N'9144720543', 529399, N'44 Ocean Ave.', N'44 Ocean Ave.', N'Sprite', N'Coach', N'+7 (454) 353-8089', N'stomv@aol.com', N'043-baby-boy.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (44, N'Alexis', N'Levine', N'Juan', N'6021143882', 191499, N'Long Beach, NY 11561', N'Long Beach, NY 11561', N'Xerox', N'Radiologic Technologist', N'+7 (623) 716-7237', N'msusa@comcast.net', N'044-dead-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (45, N'Steve', N'Miles', N'Lydon', N'4607499410', 292234, N'192 West Foster St.', N'192 West Foster St.', N'Samsung Group', N'Market Research Analyst', N'+7 (594) 615-8545', N'dougj@yahoo.com', N'045-star.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (46, N'Kayley', N'Cuevas', N'Tyson', N'4676263545', 194258, N'Long Branch, NJ 07740', N'Long Branch, NJ 07740', N'Google', N'Housekeeper', N'+7 (647 885-2301', N'jlbaumga@gmail.com', N'046-dubious.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (47, N'Annabelle', N'Hebert', N'Annora', N'657127113', 415905, N'43 SE. Cross Court', N'43 SE. Cross Court', N'Louis Vuitton', N'Computer Programmer', N'+7 (822) 693-3953', N'temmink@mac.com', N'047-phone-call.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (48, N'Carolina', N'Casey', N'Timothy', N'2307511412', 598986, N'Centereach, NY 11720', N'Centereach, NY 11720', N'Apple Inc.', N'Secretary', N'+7 (887 236-8493', N'nighthawk@msn.com', N'048-moon.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (49, N'Beckham', N'Roach', N'Elias', N'4756956293', 906312, N'946 Yukon Lane', N'946 Yukon Lane', N'Verizon Communications', N'Bus Driver', N'+7 (531) 597-0196', N'qmacro@outlook.com', N'049-robot.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (50, N'Seamus', N'Pugh', N'Jackson', N'4693133588', 989757, N'Winter Springs, FL 32708', N'Winter Springs, FL 32708', N'Credit Suisse', N'Systems Analyst', N'+7 (506) 774-1574', N'stewwy@att.net', N'050-flower.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (51, N'Imani', N'Calderon', N'Sullivan', N'759890859', 46335, N'330 Poplar Lane', N'330 Poplar Lane', N'Wells Fargo', N'Chef', N'+7 (639) 813-8035', N'blixem@msn.com', N'051-happy-10.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (52, N'Marisol', N'Roach', N'Dezi', N'2416240325', 245515, N'Titusville, FL 32780', N'Titusville, FL 32780', N'Yahoo!', N'Registered Nurse', N'+7 (883) 455-5204', N'mccurley@optonline.net', N'052-happy-9.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (53, N'Kane', N'Jacobson', N'Emerson', N'3896957754', 368276, N'626 Leatherwood St.', N'626 Leatherwood St.', N'Porsche', N'Surveyor', N'+7 (833) 914-4764', N'jacks@mac.com', N'053-tired-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (54, N'Anya', N'Higgins', N'Erin', N'6573581276', 372963, N'Lynn, MA 01902', N'Lynn, MA 01902', N'Moët et Chandon', N'Urban Planner', N'+7 (810) 945-3933', N'nwiger@att.net', N'054-ugly-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (55, N'Branson', N'Richard', N'Linnea', N'2225886655', 446339, N'9971 N. Rockville Avenue', N'9971 N. Rockville Avenue', N'Hyundai', N'Middle School Teacher', N'+7 (995) 610-9002', N'muadip@me.com', N'055-tongue-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (56, N'Kyle', N'Mathis', N'Raine', N'8966340666', 490162, N'Duluth, GA 30096', N'Duluth, GA 30096', N'Honda Motor Company, Ltd', N'Speech-Language Pathologist', N'+7 (394) 581-3937', N'gavinls@yahoo.com', N'056-vampire.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (57, N'Jamiya', N'Cross', N'Trevor', N'1754958143', 246531, N'9542 Sutor Drive', N'9542 Sutor Drive', N'Beko', N'Personal Care Aide', N'+7 (732) 375-2363', N'nicktrig@me.com', N'057-music-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (58, N'Selah', N'Keller', N'Merle', N'4434406702', 268770, N'Phoenixville, PA 19460', N'Phoenixville, PA 19460', N'Deere & Company', N'Database administrator', N'+7 (587 444-2070', N'lbecchi@me.com', N'058-popcorn.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (59, N'Larry', N'Watson', N'Blayne', N'4859211563', 898596, N'299 E. George St.', N'299 E. George St.', N'Volkswagen Group', N'Art Director', N'+7 (845) 438-1802', N'willg@att.net', N'059-nurse.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (60, N'Braeden', N'Shea', N'Abe', N'5348104186', 316595, N'Westport, CT 06880', N'Westport, CT 06880', N'Pampers', N'Landscaper & Groundskeeper', N'+7 (320) 478-3865', N'rnelson@yahoo.com', N'060-sad-13.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (61, N'Allisson', N'Woodard', N'Joan', N'9216132859', 635754, N'7671 Tunnel Street', N'7671 Tunnel Street', N'BlackBerry', N'Court Reporter', N'+7 (486) 828-8733', N'roesch@aol.com', N'061-graduated-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (62, N'Amy', N'Garner', N'Tanner', N'6127199319', 509105, N'Fair Lawn, NJ 07410', N'Fair Lawn, NJ 07410', N'Jack Daniel''s', N'Bookkeeping clerk', N'+7 (497 215-8724', N'pthomsen@verizon.net', N'062-happy-8.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (63, N'Saniyah', N'Choi', N'Debree', N'1102719495', 815229, N'41 Harvard Drive', N'41 Harvard Drive', N'Facebook, Inc.', N'Landscape Architect', N'+7 (399) 887-3591', N'itstatus@yahoo.ca', N'063-hungry.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (64, N'Reagan', N'Simmons', N'Sharon', N'2020814747', 470174, N'Windsor, CT 06095', N'Windsor, CT 06095', N'United Parcel Service', N'College Professor', N'+7 (205) 278-4756', N'marcs@verizon.net', N'064-police.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (65, N'Coby', N'Robertson', N'Juliet', N'4083683928', 133197, N'7219 Prospect Drive', N'7219 Prospect Drive', N'Adidas', N'Respiratory Therapist', N'+7 (260) 814-7458', N'tellis@yahoo.ca', N'065-crying-6.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (66, N'Dakota', N'Haney', N'Marguerite', N'1270718764', 946776, N'Rolla, MO 65401', N'Rolla, MO 65401', N'Siemens AG', N'Mason', N'+7 (302) 844-3480', N'scotfl@att.net', N'066-happy-7.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (67, N'Malia', N'Rivas', N'Louis', N'3871532007', 875661, N'697 Cypress Lane', N'697 Cypress Lane', N'Citigroup', N'Veterinarian', N'+7 (449) 380-7477', N'jramio@optonline.net', N'067-sun.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (68, N'Lily', N'Green', N'Lynn', N'9827633690', 976908, N'Arlington Heights, IL 60004', N'Arlington Heights, IL 60004', N'Amazon.com', N'Architect', N'+7 (280) 214-8022', N'mastinfo@gmail.com', N'068-father-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (69, N'Reilly', N'Nielsen', N'Marcella', N'9350821275', 836368, N'7762 North County St.', N'7762 North County St.', N'AT&T', N'Accountant', N'+7 (967 763-6475', N'ateniese@outlook.com', N'069-happy-6.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (70, N'Ryleigh', N'Brooks', N'Leonie', N'2681769203', 532086, N'Holly Springs, NC 27540', N'Holly Springs, NC 27540', N'Starbucks', N'School Counselor', N'+7 (625) 810-5235', N'ismail@hotmail.com', N'070-late.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (71, N'Brendan', N'Ewing', N'Adele', N'4152160995', 626951, N'7773 Ridge Dr.', N'7773 Ridge Dr.', N'Prada', N'Computer Support Specialist', N'+7 (975) 483-5566', N'oechslin@optonline.net', N'071-heart.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (72, N'Cheyenne', N'Kirk', N'Julian', N'4306595389', 40675, N'New Haven, CT 06511', N'New Haven, CT 06511', N'Gap Inc.', N'Historian', N'+7 (718) 850-2518', N'jugalator@att.net', N'072-sick-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (73, N'Jacoby', N'Rojas', N'Rose', N'9367402446', 7428, N'551 Spruce St.', N'551 Spruce St.', N'Kia Motors', N'Computer Hardware Engineer', N'+7 (550) 645-2520', N'subir@verizon.net', N'073-sad-12.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (74, N'Keshawn', N'Cummings', N'Paul', N'4536115339', 249425, N'Mount Holly, NJ 08060', N'Mount Holly, NJ 08060', N'Cisco Systems, Inc.', N'Designer', N'+7 (551) 270-4620', N'bryam@verizon.net', N'074-in-love-10.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (75, N'Mohammed', N'Crawford', N'Amelia', N'8478213639', 327248, N'116 Woodside St.', N'116 Woodside St.', N'Home Depot', N'Hairdresser', N'+7 (489) 444-3438', N'jpflip@optonline.net', N'075-shocked-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (76, N'Nancy', N'Bryan', N'Devon', N'1871347268', 990658, N'Bridgewater, NJ 08807', N'Bridgewater, NJ 08807', N'Vodafone', N'Lawyer', N'+7 (401) 862-1637', N'mgemmons@comcast.net', N'076-happy-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (77, N'Maxwell', N'Lynn', N'Ellory', N'1567431190', 707963, N'9817 Manor St.', N'9817 Manor St.', N'Hewlett-Packard', N'Real Estate Agent', N'+7 (507 625-4900', N'csilvers@icloud.com', N'077-shocked-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (78, N'Zack', N'Khan', N'Gabriel', N'9952372202', 670847, N'West Des Moines, IA 50265', N'West Des Moines, IA 50265', N'Hermès', N'Customer Service Representative', N'+7 (458) 566-0054', N'karasik@msn.com', N'078-cool-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (79, N'Selina', N'Walls', N'Ashten', N'8168514525', 434380, N'9 Prince Street', N'9 Prince Street', N'Oracle Corporation', N'Fitness Trainer', N'+7 (979) 346-6593', N'wetter@yahoo.ca', N'079-crying-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (80, N'Jerry', N'Garner', N'Everett', N'8239393741', 255295, N'Brookline, MA 02446', N'Brookline, MA 02446', N'Canon', N'Social Worker', N'+7 (320) 547-9952', N'thassine@me.com', N'080-zombie.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (81, N'Kaila', N'Carroll', N'Grey', N'2909822374', 535063, N'549 Marvon St.', N'549 Marvon St.', N'KFC', N'Economist', N'+7 (429) 809-1931', N'sassen@msn.com', N'081-pain.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (82, N'Sean', N'Conway', N'Garrison', N'5367598823', 325417, N'Dundalk, MD 21222', N'Dundalk, MD 21222', N'General Electric', N'Writer', N'+7 (464) 285-9954', N'jandrese@yahoo.ca', N'082-cyclops.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (83, N'Makaila', N'Cantu', N'Fernando', N'5298472573', 825989, N'1 Theatre Drive', N'1 Theatre Drive', N'BMW', N'Logistician', N'+7 (748) 461-4491', N'tmccarth@live.com', N'083-sweat.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (84, N'Jacquelyn', N'Mccall', N'Sherleen', N'3605373737', 964951, N'Lumberton, NC 28358', N'Lumberton, NC 28358', N'The Walt Disney Company', N'Environmental scientist', N'+7 (578) 935-1637', N'gtewari@icloud.com', N'084-thief.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (85, N'Milton', N'Swanson', N'Chase', N'8146691253', 765391, N'673 Hamilton Road', N'673 Hamilton Road', N'American Express', N'Patrol Officer', N'+7 (927 652-4631', N'hampton@yahoo.com', N'085-sad-11.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (86, N'Rodolfo', N'Lynn', N'Zion', N'7932623470', 852333, N'Farmingdale, NY 11735', N'Farmingdale, NY 11735', N'Burberry', N'Plumber', N'+7 (595) 615-6057', N'jesse@me.com', N'086-kiss-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (87, N'Paula', N'Walls', N'Breean', N'7817774559', 929343, N'9662 Bay Ave.', N'9662 Bay Ave.', N'Pizza Hut', N'Dancer', N'+7 (751) 240-3137', N'jugalator@me.com', N'087-father-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (88, N'Adison', N'Olson', N'Henry', N'4402114286', 550100, N'Hamburg, NY 14075', N'Hamburg, NY 14075', N'H&M', N'Pharmacist', N'+7 (626) 974-2035', N'bhima@sbcglobal.net', N'088-father.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (89, N'Jacob', N'Haynes', N'Marcellus', N'2794857949', 735633, N'8604 Fairfield Ave.', N'8604 Fairfield Ave.', N'Heineken Brewery', N'Truck Driver', N'+7 (201) 979-1451', N'gommix@comcast.net', N'089-angel-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (90, N'Corinne', N'Roberts', N'Suzan', N'7429823005', 329850, N'Wisconsin Rapids, WI 54494', N'Wisconsin Rapids, WI 54494', N'PepsiCo', N'Medical Secretary', N'+7 (493) 219-3942', N'symbolic@verizon.net', N'090-happy-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (91, N'Aimee', N'Ewing', N'Lane', N'6306285690', 230064, N'56 Vale St.', N'56 Vale St.', N'Bank of America', N'Diagnostic Medical Sonographer', N'+7 (407 485-5030', N'bruck@outlook.com', N'091-sad-10.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (92, N'Alejandro', N'Cordova', N'Hollyn', N'9370315564', 249749, N'Mount Juliet, TN 37122', N'Mount Juliet, TN 37122', N'Nintendo', N'High School Teacher', N'+7 (919) 478-2497', N'jeteve@optonline.net', N'092-outrage-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (93, N'Byron', N'Haynes', N'Bram', N'168542988', 97229, N'9523 Linda Lane', N'9523 Linda Lane', N'Johnson & Johnson', N'Marriage & Family Therapist', N'+7 (482) 802-9580', N'jsnover@comcast.net', N'093-ugly-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (94, N'Genevieve', N'Keith', N'David', N'5467865823', 316039, N'Tullahoma, TN 37388', N'Tullahoma, TN 37388', N'HSBC', N'Editor', N'+7 (455) 944-6449', N'hakim@comcast.net', N'094-ugly-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (95, N'Dane', N'Obrien', N'Shane', N'9596712362', 813449, N'3 Ashley Ave.', N'3 Ashley Ave.', N'Kellogg Company', N'Substance Abuse Counselor', N'+7 (710) 388-2563', N'dexter@sbcglobal.net', N'095-scared.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (96, N'Nayeli', N'Church', N'Kent', N'9527410913', 790714, N'Ann Arbor, MI 48103', N'Ann Arbor, MI 48103', N'MasterCard', N'Public Relations Specialist', N'+7 (759) 452-3846', N'jlbaumga@hotmail.com', N'096-tongue-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (97, N'Ashtyn', N'Jimenez', N'Rhett', N'6760404116', 515537, N'9851 East Prince Street', N'9851 East Prince Street', N'Gucci', N'Computer Systems Analyst', N'+7 (687 801-1332', N'djupedal@hotmail.com', N'097-sad-9.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (98, N'Kimberly', N'Wilkerson', N'Carelyn', N'9484965470', 262017, N'Dothan, AL 36301', N'Dothan, AL 36301', N'Mercedes-Benz', N'Preschool Teacher', N'+7 (691) 336-3494', N'daveewart@verizon.net', N'098-nerd-9.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (99, N'Tripp', N'Curtis', N'Apollo', N'6426682782', 201742, N'8329 North Greenview St.', N'8329 North Greenview St.', N'L''Oréal', N'Dentist', N'+7 (493) 274-3888', N'msherr@sbcglobal.net', N'099-greed-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (100, N'Eleanor', N'Zavala', N'George', N'3709656706', 905558, N'Hartford, CT 06106', N'Hartford, CT 06106', N'Global Gillette', N'Teacher Assistant', N'+7 (983) 470-4528', N'crusader@sbcglobal.net', N'100-whistle.png', N'')
GO
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (101, N'Harper', N'Thomas', N'Jae', N'4948205524', 243277, N'215 Purple Finch Lane', N'215 Purple Finch Lane', N'Coca-Cola', N'Musician', N'+7 (436) 951-8996', N'mdielmann@sbcglobal.net', N'101-nerd-8.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (102, N'Maximo', N'Stephenson', N'Dex', N'8134605243', 119462, N'Annapolis, MD 21401', N'Annapolis, MD 21401', N'Harley-Davidson Motor Company', N'Paralegal', N'+7 (210) 889-7840', N'ovprit@me.com', N'102-muted-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (103, N'Kiara', N'James', N'Jeremy', N'7133997003', 791278, N'63 53rd Ave.', N'63 53rd Ave.', N'Corona', N'Software Developer', N'+7 (390) 499-7403', N'calin@att.net', N'103-in-love-9.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (104, N'Isabella', N'Fuller', N'Naomi', N'4021304017', 306011, N'Hagerstown, MD 21740', N'Hagerstown, MD 21740', N'Johnnie Walker', N'Zoologist', N'+7 (805) 721-8540', N'thowell@yahoo.ca', N'104-in-love-8.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (105, N'Cynthia', N'Garrison', N'Matilda', N'3516398883', 21763, N'2 Greenrose Rd.', N'2 Greenrose Rd.', N'SAP', N'Medical Assistant', N'+7 (578) 220-5882', N'mpiotr@yahoo.com', N'105-kiss-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (106, N'Donte', N'Flowers', N'Brock', N'8533684076', 494549, N'Maspeth, NY 11378', N'Maspeth, NY 11378', N'Smirnoff', N'Desktop publisher', N'+7 (415) 631-8358', N'bester@gmail.com', N'106-in-love-7.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (107, N'Asia', N'Rivera', N'Carmden', N'1618439727', 262275, N'298 N. Hudson Court', N'298 N. Hudson Court', N'Toyota Motor Corporation', N'Actor', N'+7 (900) 903-0657', N'imightb@gmail.com', N'107-ugly.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (108, N'Trace', N'Hahn', N'Clelia', N'2835991998', 464652, N'Howell, NJ 07731', N'Howell, NJ 07731', N'Caterpillar Inc.', N'Sports Coach', N'+7 (879) 442-6528', N'jschauma@icloud.com', N'108-nerd-7.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (109, N'Mohammed', N'Farley', N'Levi', N'7748504230', 200443, N'3 Peg Shop St.', N'3 Peg Shop St.', N'Avon', N'Dental Hygienist', N'+7 (649) 374-4690', N'syrinx@gmail.com', N'109-nerd-6.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (110, N'Nicholas', N'Velez', N'Dawn', N'4853175687', 971839, N'Bayonne, NJ 07002', N'Bayonne, NJ 07002', N'Budweiser Stag Brewing Company', N'School Psychologist', N'+7 (487 871-5975', N'konit@aol.com', N'110-crying-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (111, N'Jamir', N'Curtis', N'Tavian', N'3983947212', 30097, N'648 Hill Field St.', N'648 Hill Field St.', N'IBM', N'Librarian', N'+7 (503) 572-6773', N'wonderkid@hotmail.com', N'111-muted-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (112, N'Cyrus', N'Rose', N'Jacklyn', N'7435360206', 655574, N'South Richmond Hill, NY 11419', N'South Richmond Hill, NY 11419', N'Chase', N'Telemarketer', N'+7 (709) 756-6389', N'pjacklam@verizon.net', N'112-nerd-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (113, N'Dakota', N'Torres', N'Cash', N'4559179023', 592365, N'477 Oakland Street', N'477 Oakland Street', N'NTT Data', N'Interpreter & Translator', N'+7 (931) 652-7478', N'tokuhirom@live.com', N'113-kiss-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (114, N'Matias', N'Valencia', N'Reagan', N'2102137023', 279901, N'Lynnwood, WA 98037', N'Lynnwood, WA 98037', N'Intel Corporation', N'Food Scientist', N'+7 (524) 449-7554', N'adillon@comcast.net', N'114-greed-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (115, N'Rocco', N'Harding', N'Gwendolen', N'2018304278', 690136, N'4 Division Lane', N'4 Division Lane', N'Sony', N'Marketing Manager', N'+7 (347 807-8932', N'bcevc@yahoo.ca', N'115-pirate-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (116, N'Maya', N'Clark', N'Evelyn', N'4625441301', 224776, N'Champlin, MN 55316', N'Champlin, MN 55316', N'Tesco Corporation', N'Insurance Agent', N'+7 (675) 694-8839', N'crobles@me.com', N'116-music.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (117, N'Bryan', N'Hays', N'Wade', N'8451370682', 475381, N'8021 Shadow Brook Dr.', N'8021 Shadow Brook Dr.', N'Microsoft', N'Farmer', N'+7 (779) 966-8126', N'tjensen@verizon.net', N'117-confused-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (118, N'Jessie', N'Nelson', N'Jack', N'7035527026', 89070, N'Lancaster, NY 14086', N'Lancaster, NY 14086', N'McDonald''s', N'Human Resources Assistant', N'+7 (791) 357-4942', N'gozer@icloud.com', N'118-nerd-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (119, N'Joy', N'Franklin', N'Warren', N'2846798890', 15158, N'7073 Hall Avenue', N'7073 Hall Avenue', N'VISA', N'Paramedic', N'+7 (292) 662-7836', N'brbarret@yahoo.ca', N'119-greed.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (120, N'Carlie', N'Lang', N'Rebecca', N'936890494', 983441, N'West Babylon, NY 11704', N'West Babylon, NY 11704', N'Zara', N'Automotive mechanic', N'+7 (952) 374-4396', N'mcnihil@me.com', N'120-nerd-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (121, N'Issac', N'Hurley', N'Blanche', N'7906721186', 930722, N'985B Winding Way Dr.', N'985B Winding Way Dr.', N'Morgan Stanley', N'Receptionist', N'+7 (758) 849-9991', N'damian@yahoo.com', N'121-crying-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (122, N'Ariel', N'Sims', N'Bailey', N'9254479522', 866890, N'South Windsor, CT 06074', N'South Windsor, CT 06074', N'Mitsubishi', N'Construction Manager', N'+7 (534) 687-2128', N'neonatus@aol.com', N'122-cheering.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (123, N'Braedon', N'Delgado', N'Oliver', N'3627384983', 821333, N'570 Old Bayberry Street', N'570 Old Bayberry Street', N'Audi', N'Physician', N'+7 (642) 548-4829', N'tellis@icloud.com', N'123-surprised-6.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (124, N'Christian', N'Suarez', N'Lee', N'5989222522', 74910, N'Billerica, MA 01821', N'Billerica, MA 01821', N'eBay', N'Mathematician', N'+7 (980) 531-5346', N'frode@live.com', N'124-muted-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (125, N'Lilah', N'Marks', N'Anthony', N'3584358162', 882011, N'9122 South Addison St.', N'9122 South Addison St.', N'Ralph Lauren Corporation', N'Electrical Engineer', N'+7 (628) 326-1104', N'sjava@aol.com', N'125-sick-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (126, N'Jeffrey', N'Rowland', N'Gillian', N'440646042', 450845, N'East Lansing, MI 48823', N'East Lansing, MI 48823', N'Wal-Mart', N'Physicist', N'+7 (669) 335-7511', N'harryh@live.com', N'126-graduated.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (127, N'Hannah', N'Jordan', N'Verena', N'5511931653', 233625, N'14 West Fifth St.', N'14 West Fifth St.', N'Panasonic Corporation', N'Police Officer', N'+7 (399) 344-8840', N'elflord@me.com', N'127-angry-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (128, N'Peyton', N'Hinton', N'Benjamin', N'8020284910', 672826, N'Skokie, IL 60076', N'Skokie, IL 60076', N'Nike, Inc.', N'Maintenance & Repair Worker', N'+7 (643) 676-5328', N'ramollin@mac.com', N'128-in-love-6.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (129, N'Clayton', N'Forbes', N'Zachary', N'8660236405', 422773, N'7267 W. Roehampton St.', N'7267 W. Roehampton St.', N'Nissan Motor Co., Ltd.', N'Statistician', N'+7 (535) 983-7587', N'kronvold@mac.com', N'129-cool-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (130, N'Salvatore', N'Cabrera', N'Krystan', N'7218277801', 348484, N'Harrisonburg, VA 22801', N'Harrisonburg, VA 22801', N'MTV', N'Epidemiologist', N'+7 (310) 925-8844', N'louise@aol.com', N'130-confused-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (131, N'Andre', N'Taylor', N'Felix', N'4813710684', 233687, N'82 Oak Meadow Dr.', N'82 Oak Meadow Dr.', N'Cartier SA', N'Reporter', N'+7 (457 847-6033', N'nanop@verizon.net', N'131-sad-8.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (132, N'Kadin', N'Mcclain', N'Riley', N'8704683064', 28020, N'Cambridge, MA 02138', N'Cambridge, MA 02138', N'Nescafé', N'Elementary School Teacher', N'+7 (330) 730-7648', N'gtewari@sbcglobal.net', N'132-nerd-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (133, N'Jaida', N'Nichols', N'Lucinda', N'9908341967', 683123, N'864 Highland Drive', N'864 Highland Drive', N'Allianz', N'Childcare worker', N'+7 (619) 883-4911', N'ylchang@mac.com', N'133-birthday-boy.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (134, N'Reid', N'Church', N'Candice', N'6752159699', 228468, N'Alliance, OH 44601', N'Alliance, OH 44601', N'Ferrari S.p.A.', N'Loan Officer', N'+7 (482) 744-7133', N'gommix@yahoo.com', N'134-surprised-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (135, N'Karley', N'Harrington', N'Kathryn', N'8059911426', 882058, N'9465 St Paul Avenue', N'9465 St Paul Avenue', N'Kleenex', N'Drafter', N'+7 (369) 537-4704', N'uncle@sbcglobal.net', N'135-selfie.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (136, N'Beau', N'Rivers', N'Lillian', N'845255461', 577380, N'Massillon, OH 44646', N'Massillon, OH 44646', N'Tiffany & Co.', N'Cost Estimator', N'+7 (540) 239-8104', N'smcnabb@live.com', N'136-tongue-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (137, N'Riley', N'Bentley', N'Hugh', N'4452331700', 279775, N'7651 South La Sierra Dr.', N'7651 South La Sierra Dr.', N'3M', N'Clinical Laboratory Technician', N'+7 (863) 714-2111', N'shrapnull@aol.com', N'137-smart-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (138, N'Ellis', N'Choi', N'Julina', N'3520765331', 185983, N'Centreville, VA 20120', N'Centreville, VA 20120', N'Shell Oil Company', N'Electrician', N'+7 (839) 694-4168', N'djpig@sbcglobal.net', N'138-smart.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (139, N'Jaylyn', N'Leon', N'Ellison', N'8629761047', 629180, N'3 Alton Lane', N'3 Alton Lane', N'Adobe Systems', N'Referee', N'+7 (983) 868-6473', N'oechslin@hotmail.com', N'139-surprised-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (140, N'Drew', N'Mayer', N'Carlen', N'2381911641', 336638, N'Glen Allen, VA 23059', N'Glen Allen, VA 23059', N'IKEA', N'Judge', N'+7 (325) 574-7514', N'xnormal@verizon.net', N'140-3d-glasses.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (141, N'Ashleigh', N'Walters', N'Claude', N'3634590673', 418814, N'9441 W. Pineknoll Drive', N'9441 W. Pineknoll Drive', N'Nokia', N'Security Guard', N'+7 (921) 683-0258', N'atmarks@icloud.com', N'141-in-love-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (142, N'Scott', N'Dickerson', N'Arden', N'5913725569', 579121, N'Florence, SC 29501', N'Florence, SC 29501', N'Sprite', N'Budget analyst', N'+7 (503) 446-7180', N'makarow@comcast.net', N'142-sleeping.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (143, N'Kolton', N'Knight', N'Miriam', N'7702344201', 254837, N'7070 Shady Street', N'7070 Shady Street', N'Xerox', N'Painter', N'+7 (467 243-5219', N'raides@yahoo.com', N'143-pirate.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (144, N'Izabelle', N'Boyle', N'Naveen', N'2262625946', 196936, N'Lewiston, ME 04240', N'Lewiston, ME 04240', N'Samsung Group', N'Occupational Therapist', N'+7 (633) 700-7724', N'hwestiii@mac.com', N'144-santa-claus.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (145, N'Haylie', N'Singleton', N'Sue', N'1646243340', 134470, N'146 East Bank Street', N'146 East Bank Street', N'Google', N'Physical Therapist', N'+7 (632) 874-7209', N'scitext@gmail.com', N'145-wink.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (146, N'Sariah', N'Lin', N'Olive', N'2153460491', 905724, N'Billings, MT 59101', N'Billings, MT 59101', N'Louis Vuitton', N'Photographer', N'+7 (368) 599-1877', N'gward@yahoo.ca', N'146-in-love-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (147, N'Chace', N'Spears', N'Elodie', N'3126716773', 124048, N'8723 Cedar Swamp Drive', N'8723 Cedar Swamp Drive', N'Apple Inc.', N'Cashier', N'+7 (324) 886-1499', N'bockelboy@outlook.com', N'147-tired.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (148, N'Liam', N'Frazier', N'Korin', N'8828972758', 885712, N'Norman, OK 73072', N'Norman, OK 73072', N'Verizon Communications', N'Educator', N'+7 (374) 356-4166', N'tubesteak@comcast.net', N'148-bang.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (149, N'Joseph', N'Stokes', N'William', N'8114880420', 561214, N'8419 E. Harvey Drive', N'8419 E. Harvey Drive', N'Credit Suisse', N'Professional athlete', N'+7 (868) 982-2419', N'krueger@mac.com', N'149-baby.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (150, N'Lorelei', N'Hurley', N'Coralie', N'8085811955', 969805, N'Groton, CT 06340', N'Groton, CT 06340', N'Wells Fargo', N'Janitor', N'+7 (781) 785-5837', N'skaufman@optonline.net', N'150-tongue.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (151, N'Miguel', N'Leon', N'Haiden', N'1318208906', 140377, N'179 Manchester St.', N'179 Manchester St.', N'Yahoo!', N'Massage Therapist', N'+7 (489) 361-6374', N'tezbo@live.com', N'151-sick-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (152, N'Melina', N'Hamilton', N'Isaac', N'3115642377', 74940, N'Chelmsford, MA 01824', N'Chelmsford, MA 01824', N'Porsche', N'Psychologist', N'+7 (872) 856-7001', N'crowl@icloud.com', N'152-outrage.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (153, N'Serena', N'Duke', N'Arthur', N'5150553212', 190255, N'70 Cambridge Ave.', N'70 Cambridge Ave.', N'Moët et Chandon', N'IT Manager', N'+7 (812) 814-4854', N'plover@hotmail.com', N'153-injury.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (154, N'Kristen', N'Dillon', N'Kylie', N'4169626192', 521443, N'Durham, NC 27703', N'Durham, NC 27703', N'Hyundai', N'Anthropologist', N'+7 (803) 510-4214', N'calin@aol.com', N'154-dead.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (155, N'Saniyah', N'Hawkins', N'Josiah', N'746633192', 845900, N'566 S. Cherry Street', N'566 S. Cherry Street', N'Honda Motor Company, Ltd', N'Executive Assistant', N'+7 (869) 369-9524', N'timtroyr@live.com', N'155-rich-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (156, N'Thalia', N'Leach', N'Nicolas', N'2646768816', 584534, N'Forney, TX 75126', N'Forney, TX 75126', N'Beko', N'Artist', N'+7 (464) 585-3155', N'keutzer@yahoo.com', N'156-sick.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (157, N'Irene', N'Caldwell', N'Noah', N'5732336554', 660042, N'83 NE. Hill Dr.', N'83 NE. Hill Dr.', N'Deere & Company', N'Mechanical Engineer', N'+7 (703) 958-7186', N'thurston@outlook.com', N'157-angel.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (158, N'Nikhil', N'Bowen', N'Glenn', N'5254555116', 207488, N'Norwood, MA 02062', N'Norwood, MA 02062', N'Volkswagen Group', N'Firefighter', N'+7 (515) 615-0912', N'mbalazin@att.net', N'158-nerd-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (159, N'Jolie', N'Charles', N'Matteo', N'3285403999', 586366, N'556 Summerhouse Street', N'556 Summerhouse Street', N'Pampers', N'Carpenter', N'+7 (854) 941-5210', N'dkasak@gmail.com', N'159-crying-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (160, N'Xavier', N'Baxter', N'Joseph', N'1373588622', 962553, N'Nottingham, MD 21236', N'Nottingham, MD 21236', N'BlackBerry', N'Actuary', N'+7 (380) 573-4186', N'esbeck@comcast.net', N'160-crying-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (161, N'Lukas', N'Dean', N'Ellice', N'1890691040', 594473, N'9750 Hawthorne Ave.', N'9750 Hawthorne Ave.', N'Jack Daniel''s', N'Compliance Officer', N'+7 (297 369-0265', N'novanet@aol.com', N'161-muted-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (162, N'Athena', N'King', N'Lilibeth', N'3307217825', 236159, N'Muskogee, OK 74403', N'Muskogee, OK 74403', N'Facebook, Inc.', N'Computer Systems Administrator', N'+7 (671) 293-5634', N'mhouston@me.com', N'162-surprised-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (163, N'Adan', N'Noble', N'Bree', N'3286297169', 238674, N'97 Elmwood Street', N'97 Elmwood Street', N'United Parcel Service', N'HR Specialist', N'+7 (305) 214-6934', N'bahwi@yahoo.com', N'163-crying.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (164, N'Kiley', N'Pham', N'Madeleine', N'2401289619', 924581, N'Seymour, IN 47274', N'Seymour, IN 47274', N'Adidas', N'Recreation & Fitness Worker', N'+7 (812) 919-9643', N'chrisj@outlook.com', N'164-sad-7.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (165, N'Steven', N'Johnston', N'Kai', N'8507252786', 812525, N'308 Studebaker Drive', N'308 Studebaker Drive', N'Siemens AG', N'Financial Advisor', N'+7 (754) 769-3349', N'louise@gmail.com', N'165-cool-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (166, N'Ayana', N'Hart', N'Dash', N'9342187671', 123262, N'Algonquin, IL 60102', N'Algonquin, IL 60102', N'Citigroup', N'Auto Mechanic', N'+7 (206) 323-2722', N'qrczak@me.com', N'166-happy-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (167, N'Aileen', N'Copeland', N'Seth', N'1067401389', 840534, N'15 Marsh St.', N'15 Marsh St.', N'Amazon.com', N'Web Developer', N'+7 (273) 495-7160', N'arachne@hotmail.com', N'167-thinking-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (168, N'Emery', N'Pitts', N'Eli', N'2273445653', 327317, N'Garden City, NY 11530', N'Garden City, NY 11530', N'AT&T', N'Civil Engineer', N'+7 (463) 932-3808', N'mfburgo@icloud.com', N'168-muted.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (169, N'Vicente', N'Chavez', N'Bernice', N'6403754163', 917835, N'8614 Charles Street', N'8614 Charles Street', N'Starbucks', N'Chemist', N'+7 (551) 789-0645', N'karasik@att.net', N'169-confused.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (170, N'Cherish', N'Monroe', N'Vanessa', N'3912930948', 254859, N'Wake Forest, NC 27587', N'Wake Forest, NC 27587', N'Prada', N'Recreational Therapist', N'+7 (574) 759-7866', N'hauma@icloud.com', N'170-happy-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (171, N'Karley', N'Petersen', N'Rory', N'4008604291', 450994, N'57 Gulf Avenue', N'57 Gulf Avenue', N'Gap Inc.', N'Microbiologist', N'+7 (852) 802-5653', N'scitext@me.com', N'171-thinking.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (172, N'Alondra', N'Le', N'Clark', N'3059930219', 301844, N'South Lyon, MI 48178', N'South Lyon, MI 48178', N'Kia Motors', N'Event Planner', N'+7 (342) 453-0606', N'matthijs@live.com', N'172-nerd.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (173, N'Dorian', N'Bird', N'Judd', N'5208664172', 833457, N'694 Linden St.', N'694 Linden St.', N'Cisco Systems, Inc.', N'Coach', N'+7 (434) 574-4540', N'bryam@icloud.com', N'173-in-love-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (174, N'Karley', N'Goodwin', N'Noel', N'6338777372', 522008, N'Missoula, MT 59801', N'Missoula, MT 59801', N'Home Depot', N'Radiologic Technologist', N'+7 (425) 783-2253', N'tellis@att.net', N'174-hypnotized.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (175, N'Killian', N'Davidson', N'Janetta', N'802973589', 357874, N'8440 Lyme St.', N'8440 Lyme St.', N'Vodafone', N'Market Research Analyst', N'+7 (889) 449-4391', N'makarow@verizon.net', N'175-cool.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (176, N'Ava', N'Melton', N'Annabel', N'1788509266', 809566, N'Zeeland, MI 49464', N'Zeeland, MI 49464', N'Hewlett-Packard', N'Housekeeper', N'+7 (825) 301-8250', N'citadel@msn.com', N'176-shocked.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (177, N'Adam', N'Horton', N'Blake', N'2735502335', 933854, N'7632 Oakwood Rd.', N'7632 Oakwood Rd.', N'Hermès', N'Computer Programmer', N'+7 (397 334-2086', N'jaxweb@me.com', N'177-easter.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (178, N'Jaydin', N'Singh', N'Jordon', N'7540934686', 651032, N'Pembroke Pines, FL 33028', N'Pembroke Pines, FL 33028', N'Oracle Corporation', N'Secretary', N'+7 (241) 570-3040', N'mcsporran@aol.com', N'178-surprised-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (179, N'Lexie', N'Mckinney', N'Charles', N'9803515191', 938289, N'881 Temple St.', N'881 Temple St.', N'Canon', N'Bus Driver', N'+7 (713) 462-8265', N'tubesteak@mac.com', N'179-surprised-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (180, N'Niko', N'Calderon', N'Troy', N'7220353462', 163048, N'South El Monte, CA 91733', N'South El Monte, CA 91733', N'KFC', N'Systems Analyst', N'+7 (854) 822-2331', N'kludge@verizon.net', N'180-surprised.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (181, N'Terrence', N'Acevedo', N'Viola', N'9575262338', 906781, N'9591 Honey Creek St.', N'9591 Honey Creek St.', N'General Electric', N'Chef', N'+7 (439) 713-6117', N'lahvak@hotmail.com', N'181-furious.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (182, N'Madisyn', N'May', N'Byron', N'7751986773', 13897, N'Webster, NY 14580', N'Webster, NY 14580', N'BMW', N'Registered Nurse', N'+7 (230) 906-8815', N'raides@sbcglobal.net', N'182-sad-6.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (183, N'Jadon', N'Ponce', N'Doran', N'9853763831', 457951, N'7018 Pilgrim Street', N'7018 Pilgrim Street', N'The Walt Disney Company', N'Surveyor', N'+7 (598) 895-2899', N'gfxguy@aol.com', N'183-sad-5.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (184, N'Jaylen', N'Thornton', N'Tobias', N'2868392150', 998746, N'Bismarck, ND 58501', N'Bismarck, ND 58501', N'American Express', N'Urban Planner', N'+7 (429) 678-1872', N'krueger@msn.com', N'184-sad-4.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (185, N'Brendan', N'Kelly', N'Damien', N'7019883500', 537973, N'697 Westminster St.', N'697 Westminster St.', N'Burberry', N'Middle School Teacher', N'+7 (276) 750-1655', N'shang@yahoo.ca', N'185-sad-3.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (186, N'Helena', N'Houston', N'Murphy', N'1529516117', 374799, N'Harleysville, PA 19438', N'Harleysville, PA 19438', N'Pizza Hut', N'Speech-Language Pathologist', N'+7 (805) 953-2020', N'kalpol@comcast.net', N'186-angry-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (187, N'Madalyn', N'Moon', N'Carleen', N'751342100', 519988, N'959 Birchpond St.', N'959 Birchpond St.', N'H&M', N'Personal Care Aide', N'+7 (611) 670-2147', N'kildjean@msn.com', N'187-rich.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (188, N'Marcelo', N'Johns', N'Louisa', N'5292664723', 936784, N'Euless, TX 76039', N'Euless, TX 76039', N'Heineken Brewery', N'Database administrator', N'+7 (242) 487-7082', N'treeves@comcast.net', N'188-sad-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (189, N'Jay', N'Campos', N'Georgina', N'1446216584', 901170, N'67 Pumpkin Hill Lane', N'67 Pumpkin Hill Lane', N'PepsiCo', N'Database administrator', N'+7 (939) 641-7992', N'timtroyr@icloud.com', N'189-happy-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (190, N'Khalil', N'Sullivan', N'Rylie', N'6353693874', 525378, N'Yorktown Heights, NY 10598', N'Yorktown Heights, NY 10598', N'Bank of America', N'Landscaper & Groundskeeper', N'+7 (669) 482-2353', N'world@att.net', N'190-sad-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (191, N'Nikhil', N'Merritt', N'Claudia', N'8638615943', 809450, N'5 NE. Newcastle Drive', N'5 NE. Newcastle Drive', N'Nintendo', N'Court Reporter', N'+7 (801) 814-0510', N'kspiteri@icloud.com', N'191-sad.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (192, N'Blaine', N'Melendez', N'Vivian', N'5428298274', 921280, N'Ithaca, NY 14850', N'Ithaca, NY 14850', N'Johnson & Johnson', N'Bookkeeping clerk', N'+7 (362) 338-4199', N'rtanter@att.net', N'192-smile.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (193, N'Clayton', N'Munoz', N'Caylen', N'8862885055', 225076, N'94 Longbranch St.', N'94 Longbranch St.', N'HSBC', N'Landscape Architect', N'+7 (897 655-0021', N'twoflower@mac.com', N'193-in-love-2.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (194, N'Khalil', N'Montgomery', N'Eloise', N'2574326715', 276634, N'Mount Prospect, IL 60056', N'Mount Prospect, IL 60056', N'Kellogg Company', N'College Professor', N'+7 (710) 859-3522', N'howler@msn.com', N'194-happy.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (195, N'Bruce', N'Medina', N'Elein', N'7843990305', 242952, N'566 Gulf St.', N'566 Gulf St.', N'MasterCard', N'Respiratory Therapist', N'+7 (612) 934-2623', N'yfreund@sbcglobal.net', N'195-kiss-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (196, N'Lesly', N'Landry', N'Gregory', N'5688765287', 140550, N'Wantagh, NY 11793', N'Wantagh, NY 11793', N'Gucci', N'Mason', N'+7 (896) 396-9500', N'nogin@msn.com', N'196-in-love-1.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (197, N'Alyson', N'Hartman', N'Lee', N'7217461000', 925983, N'518 Clinton Ave.', N'518 Clinton Ave.', N'Mercedes-Benz', N'Veterinarian', N'+7 (533) 891-1018', N'onestab@live.com', N'197-in-love.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (198, N'Ellen', N'Contreras', N'Fawn', N'155996165', 783035, N'Encino, CA 91316', N'Encino, CA 91316', N'L''Oréal', N'Architect', N'+7 (309) 279-3798', N'lcheng@mac.com', N'198-kiss.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (199, N'Sofia', N'Barr', N'Kingston', N'3480736537', 897782, N'370 Ashley Lane', N'370 Ashley Lane', N'KFC', N'Accountant', N'+7 (483) 664-9876', N'bdthomas@yahoo.com', N'199-angry.png', N'')
INSERT [dbo].[Driver] ([DriverId], [DriverName], [Surname], [Middlename], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [JobName], [Phone], [Email], [Photo], [Description]) VALUES (200, N'Joyce', N'Wilkerson', N'Payten', N'6440241468', 838036, N'Wausau, WI 54401', N'Wausau, WI 54401', N'General Electric', N'School Counselor', N'+7 (765) 461-9730', N'hoangle@optonline.net', N'200-sleepy.png', N'')
GO
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1056710506, 166, 1, CAST(N'2018-10-29' AS Date), CAST(N'2026-04-18' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1148615982, 7, 2, CAST(N'2018-09-20' AS Date), CAST(N'2019-07-10' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1156742127, 187, 2, CAST(N'2018-09-18' AS Date), CAST(N'2020-08-26' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1179215392, 50, 1, CAST(N'2019-03-21' AS Date), CAST(N'2028-03-11' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1345505754, 12, 3, CAST(N'2019-02-01' AS Date), CAST(N'2027-05-06' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1352375141, 141, 2, CAST(N'2018-09-01' AS Date), CAST(N'2019-06-02' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1446984592, 113, 3, CAST(N'2019-04-11' AS Date), CAST(N'2021-08-06' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1448206175, 106, 2, CAST(N'2018-05-29' AS Date), CAST(N'2019-06-20' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1542848910, 152, 1, CAST(N'2019-03-14' AS Date), CAST(N'2024-06-13' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1544216181, 168, 1, CAST(N'2018-06-02' AS Date), CAST(N'2022-01-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1645771049, 88, 2, CAST(N'2018-10-31' AS Date), CAST(N'2020-01-21' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1754167771, 10, 2, CAST(N'2019-02-28' AS Date), CAST(N'2019-10-15' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1761996073, 79, 1, CAST(N'2018-07-10' AS Date), CAST(N'2021-02-22' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1841954617, 178, 2, CAST(N'2018-08-14' AS Date), CAST(N'2020-12-15' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1844286148, 151, 1, CAST(N'2018-11-29' AS Date), CAST(N'2022-01-20' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1849397861, 77, 1, CAST(N'2019-02-11' AS Date), CAST(N'2022-11-06' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (1974705660, 196, 1, CAST(N'2018-11-06' AS Date), CAST(N'2021-12-10' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2159855910, 16, 1, CAST(N'2018-08-23' AS Date), CAST(N'2024-01-30' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2164281543, 154, 1, CAST(N'2019-02-25' AS Date), CAST(N'2027-12-23' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2252107095, 22, 1, CAST(N'2018-12-11' AS Date), CAST(N'2027-08-22' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2259191387, 23, 1, CAST(N'2019-02-11' AS Date), CAST(N'2028-05-02' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2269366545, 19, 1, CAST(N'2018-08-05' AS Date), CAST(N'2028-01-24' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2278602987, 184, 1, CAST(N'2019-01-16' AS Date), CAST(N'2024-02-23' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2365140143, 26, 1, CAST(N'2018-05-23' AS Date), CAST(N'2027-02-17' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2457286769, 31, 1, CAST(N'2019-02-15' AS Date), CAST(N'2025-06-24' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2462735138, 120, 1, CAST(N'2018-12-09' AS Date), CAST(N'2023-05-20' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2557211673, 170, 1, CAST(N'2019-03-26' AS Date), CAST(N'2026-03-24' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2561922773, 65, 2, CAST(N'2019-03-01' AS Date), CAST(N'2020-04-19' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2754500373, 86, 1, CAST(N'2018-05-31' AS Date), CAST(N'2024-07-30' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2858111698, 35, 4, CAST(N'2018-09-19' AS Date), CAST(N'2028-04-08' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2960390525, 185, 2, CAST(N'2019-04-05' AS Date), CAST(N'2019-06-14' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2963456353, 97, 2, CAST(N'2019-02-06' AS Date), CAST(N'2019-06-19' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (2965213322, 91, 1, CAST(N'2019-04-14' AS Date), CAST(N'2022-07-18' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3076820189, 84, 2, CAST(N'2019-01-16' AS Date), CAST(N'2021-01-23' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3141340685, 92, 2, CAST(N'2019-02-23' AS Date), CAST(N'2020-01-27' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3153732792, 85, 2, CAST(N'2019-04-05' AS Date), CAST(N'2020-09-10' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3169987280, 37, 1, CAST(N'2018-12-16' AS Date), CAST(N'2022-07-25' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3276726052, 165, 2, CAST(N'2019-03-01' AS Date), CAST(N'2019-08-09' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3365198629, 199, 1, CAST(N'2018-08-17' AS Date), CAST(N'2028-01-28' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3368892304, 81, 3, CAST(N'2018-10-31' AS Date), CAST(N'2028-01-19' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3449882286, 20, 2, CAST(N'2018-12-09' AS Date), CAST(N'2020-04-19' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3453766347, 21, 2, CAST(N'2018-11-22' AS Date), CAST(N'2020-06-14' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3550716066, 56, 4, CAST(N'2018-10-13' AS Date), CAST(N'2025-11-13' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3651955678, 125, 1, CAST(N'2018-06-28' AS Date), CAST(N'2026-11-07' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3748951841, 41, 1, CAST(N'2018-09-01' AS Date), CAST(N'2023-01-25' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3755538095, 25, 1, CAST(N'2018-06-28' AS Date), CAST(N'2025-06-14' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3763724944, 14, 4, CAST(N'2018-10-20' AS Date), CAST(N'2021-08-28' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3855988267, 174, 1, CAST(N'2018-08-20' AS Date), CAST(N'2023-04-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3875480183, 114, 1, CAST(N'2018-10-20' AS Date), CAST(N'2023-04-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3945599900, 161, 1, CAST(N'2018-08-12' AS Date), CAST(N'2022-02-10' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (3946518387, 197, 3, CAST(N'2019-02-06' AS Date), CAST(N'2026-12-26' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4046106016, 190, 1, CAST(N'2018-11-07' AS Date), CAST(N'2022-09-23' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4160943122, 145, 1, CAST(N'2018-10-07' AS Date), CAST(N'2023-03-25' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4174833772, 158, 1, CAST(N'2018-12-31' AS Date), CAST(N'2026-08-09' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4177152038, 137, 4, CAST(N'2018-12-16' AS Date), CAST(N'2026-12-19' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4265754604, 75, 1, CAST(N'2019-01-30' AS Date), CAST(N'2024-01-19' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4343983635, 64, 1, CAST(N'2019-05-18' AS Date), CAST(N'2026-10-19' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4443378433, 57, 1, CAST(N'2019-01-04' AS Date), CAST(N'2025-08-18' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4447857224, 167, 4, CAST(N'2019-04-22' AS Date), CAST(N'2027-05-07' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4455179449, 112, 1, CAST(N'2019-02-01' AS Date), CAST(N'2024-02-11' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4456698959, 117, 1, CAST(N'2019-02-08' AS Date), CAST(N'2021-07-10' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4465130693, 59, 1, CAST(N'2019-03-16' AS Date), CAST(N'2025-08-16' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4465689019, 155, 2, CAST(N'2018-10-17' AS Date), CAST(N'2019-06-24' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4467967541, 4, 1, CAST(N'2019-02-26' AS Date), CAST(N'2021-10-30' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4548143560, 115, 1, CAST(N'2018-11-04' AS Date), CAST(N'2028-01-13' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4556360521, 55, 1, CAST(N'2018-10-17' AS Date), CAST(N'2022-07-04' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4562434160, 123, 4, CAST(N'2019-02-11' AS Date), CAST(N'2025-09-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4565502480, 70, 1, CAST(N'2019-03-26' AS Date), CAST(N'2027-05-16' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4571347925, 76, 3, CAST(N'2018-10-13' AS Date), CAST(N'2025-09-25' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4576922777, 122, 1, CAST(N'2018-12-11' AS Date), CAST(N'2022-01-13' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4750682392, 51, 1, CAST(N'2018-11-29' AS Date), CAST(N'2024-03-22' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4775631972, 138, 1, CAST(N'2018-08-30' AS Date), CAST(N'2023-12-18' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (4954493125, 34, 1, CAST(N'2018-09-25' AS Date), CAST(N'2027-10-07' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5045725156, 90, 4, CAST(N'2018-11-07' AS Date), CAST(N'2021-04-17' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5142920836, 181, 1, CAST(N'2018-10-31' AS Date), CAST(N'2026-09-02' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5157441335, 100, 1, CAST(N'2019-02-15' AS Date), CAST(N'2022-05-09' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5169640455, 104, 1, CAST(N'2019-02-26' AS Date), CAST(N'2026-12-12' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5242884090, 188, 1, CAST(N'2018-10-31' AS Date), CAST(N'2021-08-29' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5274843119, 182, 1, CAST(N'2019-05-07' AS Date), CAST(N'2025-10-16' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5344602449, 110, 1, CAST(N'2019-02-28' AS Date), CAST(N'2027-04-07' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5347642355, 160, 1, CAST(N'2018-12-24' AS Date), CAST(N'2025-01-15' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5369329732, 74, 1, CAST(N'2018-08-20' AS Date), CAST(N'2021-11-07' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5372121874, 173, 4, CAST(N'2018-11-03' AS Date), CAST(N'2025-01-09' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5372524117, 83, 1, CAST(N'2019-02-28' AS Date), CAST(N'2024-03-02' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5378482016, 163, 1, CAST(N'2019-01-06' AS Date), CAST(N'2026-01-09' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5449298803, 94, 3, CAST(N'2018-05-27' AS Date), CAST(N'2023-09-29' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5458150506, 68, 1, CAST(N'2018-06-02' AS Date), CAST(N'2026-10-26' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5548283081, 177, 2, CAST(N'2019-02-11' AS Date), CAST(N'2020-09-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5565355405, 99, 1, CAST(N'2018-08-17' AS Date), CAST(N'2021-03-17' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5567914299, 24, 1, CAST(N'2019-02-12' AS Date), CAST(N'2028-02-26' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5640613073, 1, 1, CAST(N'2019-01-13' AS Date), CAST(N'2027-07-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5647346550, 71, 4, CAST(N'2018-10-01' AS Date), CAST(N'2025-04-03' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5647618832, 150, 2, CAST(N'2019-03-21' AS Date), CAST(N'2020-10-17' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5662189864, 111, 1, CAST(N'2018-06-23' AS Date), CAST(N'2027-11-16' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5665672465, 140, 1, CAST(N'2019-02-17' AS Date), CAST(N'2023-06-24' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5673570962, 126, 2, CAST(N'2018-05-23' AS Date), CAST(N'2019-01-26' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5753428231, 15, 2, CAST(N'2018-11-04' AS Date), CAST(N'2020-08-18' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5759552536, 98, 1, CAST(N'2019-01-21' AS Date), CAST(N'2025-10-16' AS Date), N'D1, D1E')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5771562291, 17, 1, CAST(N'2019-02-08' AS Date), CAST(N'2024-08-16' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5774218810, 118, 3, CAST(N'2018-12-31' AS Date), CAST(N'2021-06-23' AS Date), N'B')
GO
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5780704668, 52, 3, CAST(N'2019-03-14' AS Date), CAST(N'2024-10-02' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5856389246, 139, 2, CAST(N'2018-06-24' AS Date), CAST(N'2019-03-28' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5878165905, 66, 1, CAST(N'2018-10-29' AS Date), CAST(N'2022-02-26' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5940123897, 72, 1, CAST(N'2018-07-14' AS Date), CAST(N'2027-02-10' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (5949144483, 101, 1, CAST(N'2019-01-13' AS Date), CAST(N'2025-08-29' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6070112930, 121, 4, CAST(N'2018-11-22' AS Date), CAST(N'2022-03-05' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6071733903, 93, 2, CAST(N'2019-02-06' AS Date), CAST(N'2019-10-17' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6143360486, 128, 1, CAST(N'2018-06-06' AS Date), CAST(N'2028-02-08' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6161864298, 8, 1, CAST(N'2018-06-21' AS Date), CAST(N'2022-11-18' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6163107404, 135, 1, CAST(N'2018-09-19' AS Date), CAST(N'2027-05-20' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6257783363, 38, 2, CAST(N'2018-08-30' AS Date), CAST(N'2019-06-04' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6268279896, 36, 1, CAST(N'2018-11-14' AS Date), CAST(N'2026-09-10' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6360909624, 198, 1, CAST(N'2019-01-21' AS Date), CAST(N'2022-12-18' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6373339944, 156, 1, CAST(N'2018-10-13' AS Date), CAST(N'2022-12-01' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6445186021, 89, 1, CAST(N'2018-08-04' AS Date), CAST(N'2027-01-17' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6455604567, 136, 1, CAST(N'2018-11-14' AS Date), CAST(N'2026-02-12' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6558972443, 49, 2, CAST(N'2018-06-17' AS Date), CAST(N'2020-04-19' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6750769897, 3, 1, CAST(N'2018-12-31' AS Date), CAST(N'2025-01-25' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6845157412, 13, 2, CAST(N'2019-04-11' AS Date), CAST(N'2020-01-08' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6853739807, 47, 2, CAST(N'2019-02-11' AS Date), CAST(N'2019-07-20' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6965215700, 109, 3, CAST(N'2019-05-14' AS Date), CAST(N'2022-07-23' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (6976403371, 69, 4, CAST(N'2019-01-31' AS Date), CAST(N'2025-10-22' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7044504351, 58, 1, CAST(N'2018-12-31' AS Date), CAST(N'2025-04-19' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7045177463, 103, 3, CAST(N'2018-12-31' AS Date), CAST(N'2019-05-25' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7053197719, 159, 3, CAST(N'2019-03-16' AS Date), CAST(N'2023-05-07' AS Date), N'Tb')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7072962735, 193, 2, CAST(N'2019-02-06' AS Date), CAST(N'2019-05-26' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7146913695, 39, 1, CAST(N'2018-06-24' AS Date), CAST(N'2028-01-27' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7150321250, 176, 1, CAST(N'2018-10-13' AS Date), CAST(N'2026-07-07' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7153413313, 63, 3, CAST(N'2019-01-06' AS Date), CAST(N'2022-06-15' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7158321618, 95, 1, CAST(N'2018-08-05' AS Date), CAST(N'2022-11-16' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7180465917, 28, 2, CAST(N'2018-06-06' AS Date), CAST(N'2020-06-20' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7242458530, 67, 1, CAST(N'2019-04-22' AS Date), CAST(N'2022-12-14' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7260808111, 179, 3, CAST(N'2018-07-10' AS Date), CAST(N'2021-05-04' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7263140335, 171, 1, CAST(N'2018-10-01' AS Date), CAST(N'2027-06-21' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7372870584, 119, 1, CAST(N'2018-08-05' AS Date), CAST(N'2026-07-05' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7465904246, 2, 1, CAST(N'2018-08-02' AS Date), CAST(N'2023-09-21' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7567880032, 73, 3, CAST(N'2018-11-03' AS Date), CAST(N'2023-09-19' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7568533909, 200, 1, CAST(N'2019-02-15' AS Date), CAST(N'2025-09-02' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7577669648, 147, 1, CAST(N'2019-02-11' AS Date), CAST(N'2028-02-26' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7644231262, 27, 2, CAST(N'2018-10-09' AS Date), CAST(N'2019-11-02' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7663351410, 102, 2, CAST(N'2018-08-02' AS Date), CAST(N'2019-07-06' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7764593417, 129, 1, CAST(N'2019-02-13' AS Date), CAST(N'2028-05-11' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7869300408, 130, 2, CAST(N'2018-06-25' AS Date), CAST(N'2020-11-10' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7946834138, 144, 1, CAST(N'2018-09-24' AS Date), CAST(N'2022-06-26' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (7956112224, 186, 1, CAST(N'2018-05-31' AS Date), CAST(N'2025-07-24' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8043244787, 127, 1, CAST(N'2018-10-09' AS Date), CAST(N'2025-08-08' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8043838745, 157, 2, CAST(N'2019-01-04' AS Date), CAST(N'2020-10-22' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8051417594, 133, 1, CAST(N'2019-01-05' AS Date), CAST(N'2021-10-31' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8067198658, 124, 2, CAST(N'2019-02-12' AS Date), CAST(N'2021-08-12' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8146112671, 172, 1, CAST(N'2018-07-14' AS Date), CAST(N'2025-12-25' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8160668818, 33, 1, CAST(N'2019-01-05' AS Date), CAST(N'2021-06-11' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8165173583, 134, 1, CAST(N'2018-09-25' AS Date), CAST(N'2023-08-09' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8174301902, 43, 3, CAST(N'2018-10-25' AS Date), CAST(N'2023-09-16' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8246115947, 195, 2, CAST(N'2018-08-05' AS Date), CAST(N'2020-04-10' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8247608653, 164, 1, CAST(N'2019-05-18' AS Date), CAST(N'2025-05-30' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8351612336, 53, 1, CAST(N'2018-09-26' AS Date), CAST(N'2021-10-09' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8378995967, 61, 2, CAST(N'2018-08-12' AS Date), CAST(N'2020-07-30' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8459127815, 48, 1, CAST(N'2019-01-26' AS Date), CAST(N'2021-08-13' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8553424706, 96, 1, CAST(N'2018-11-06' AS Date), CAST(N'2024-12-24' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8559935502, 149, 1, CAST(N'2018-06-17' AS Date), CAST(N'2025-12-10' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8567433962, 46, 1, CAST(N'2019-01-30' AS Date), CAST(N'2024-01-08' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8580622744, 194, 4, CAST(N'2018-05-27' AS Date), CAST(N'2025-06-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8648153332, 153, 2, CAST(N'2018-09-26' AS Date), CAST(N'2019-12-14' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8650649001, 132, 2, CAST(N'2018-08-15' AS Date), CAST(N'2019-04-06' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8744923347, 60, 1, CAST(N'2018-12-24' AS Date), CAST(N'2021-07-11' AS Date), N'D, C')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8758537518, 105, 1, CAST(N'2019-03-12' AS Date), CAST(N'2022-01-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8766120201, 191, 1, CAST(N'2019-04-14' AS Date), CAST(N'2024-03-06' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8769608724, 183, 1, CAST(N'2019-02-28' AS Date), CAST(N'2027-10-12' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8775143198, 116, 1, CAST(N'2018-08-23' AS Date), CAST(N'2025-03-08' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8848700693, 54, 2, CAST(N'2019-02-25' AS Date), CAST(N'2020-04-15' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8853584291, 180, 2, CAST(N'2018-10-17' AS Date), CAST(N'2021-01-08' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8854797589, 29, 1, CAST(N'2019-02-13' AS Date), CAST(N'2021-03-19' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8860686627, 80, 1, CAST(N'2018-10-17' AS Date), CAST(N'2023-07-20' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8958989847, 189, 3, CAST(N'2018-08-04' AS Date), CAST(N'2023-08-15' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8963563046, 148, 4, CAST(N'2019-01-26' AS Date), CAST(N'2025-10-29' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (8965820437, 11, 1, CAST(N'2018-06-23' AS Date), CAST(N'2022-06-14' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9060267003, 169, 1, CAST(N'2019-01-31' AS Date), CAST(N'2028-01-25' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9062811272, 32, 3, CAST(N'2018-08-15' AS Date), CAST(N'2024-08-25' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9065677102, 192, 2, CAST(N'2019-02-23' AS Date), CAST(N'2021-01-25' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9066607418, 40, 1, CAST(N'2019-02-17' AS Date), CAST(N'2026-05-15' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9243289084, 30, 1, CAST(N'2018-06-25' AS Date), CAST(N'2022-11-05' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9252511894, 108, 4, CAST(N'2018-06-21' AS Date), CAST(N'2023-08-21' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9261564412, 131, 1, CAST(N'2019-02-15' AS Date), CAST(N'2027-07-14' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9263836793, 45, 2, CAST(N'2018-10-07' AS Date), CAST(N'2021-01-08' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9358978442, 146, 1, CAST(N'2019-01-30' AS Date), CAST(N'2024-12-12' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9360117922, 5, 1, CAST(N'2019-03-12' AS Date), CAST(N'2025-06-03' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9366407687, 175, 1, CAST(N'2019-01-30' AS Date), CAST(N'2027-05-27' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9460114388, 143, 1, CAST(N'2018-10-25' AS Date), CAST(N'2028-04-14' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9550828023, 18, 1, CAST(N'2018-12-31' AS Date), CAST(N'2023-10-03' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9566936083, 9, 2, CAST(N'2019-05-14' AS Date), CAST(N'2020-11-18' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9570754064, 42, 1, CAST(N'2018-10-13' AS Date), CAST(N'2022-09-26' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9580672343, 142, 1, CAST(N'2018-10-13' AS Date), CAST(N'2023-09-02' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9640750187, 6, 1, CAST(N'2018-05-29' AS Date), CAST(N'2021-07-15' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9645996326, 82, 1, CAST(N'2019-05-07' AS Date), CAST(N'2024-11-04' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9752660653, 87, 1, CAST(N'2018-09-18' AS Date), CAST(N'2022-04-24' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9755409226, 78, 2, CAST(N'2018-08-14' AS Date), CAST(N'2021-01-30' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9862646552, 107, 1, CAST(N'2018-09-20' AS Date), CAST(N'2022-12-06' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9873370750, 44, 1, CAST(N'2018-09-24' AS Date), CAST(N'2023-05-23' AS Date), N'B, A')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9970313651, 162, 3, CAST(N'2019-01-07' AS Date), CAST(N'2023-09-12' AS Date), N'B')
INSERT [dbo].[Licence] ([LicenceNumber], [DriverId], [StatusId], [LicenceDate], [ExpireDate], [Categories]) VALUES (9973996427, 62, 1, CAST(N'2019-01-07' AS Date), CAST(N'2026-04-27' AS Date), N'D, C')
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManName]) VALUES (1, N'BMW')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManName]) VALUES (2, N'Cadillac')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManName]) VALUES (3, N'Kia')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManName]) VALUES (4, N'Volkswagen')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Status] ([StatusId], [StatName]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([StatusId], [StatName]) VALUES (2, N'Expire')
INSERT [dbo].[Status] ([StatusId], [StatName]) VALUES (3, N'Paused')
INSERT [dbo].[Status] ([StatusId], [StatName]) VALUES (4, N'Withdrawn')
GO
SET IDENTITY_INSERT [dbo].[TypeOfDrive] ON 

INSERT [dbo].[TypeOfDrive] ([TypeofDriveId], [TypeName]) VALUES (1, N'front-wheel drive')
INSERT [dbo].[TypeOfDrive] ([TypeofDriveId], [TypeName]) VALUES (2, N'full drive')
INSERT [dbo].[TypeOfDrive] ([TypeofDriveId], [TypeName]) VALUES (3, N'rear drive')
SET IDENTITY_INSERT [dbo].[TypeOfDrive] OFF
GO
INSERT [dbo].[Users] ([Login], [Pass], [RoleId]) VALUES (N'inspector', N'inspector', 1)
GO
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'19UUA66218A797800', 84, 3, N'Magentis / Optima', 2003, 1603, 133, 1, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1C4RJEAG6CC011603', 76, 3, N'Cerato / Spectra', 2009, 1692, 107, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1C4RJEAG6FC571030', 35, 2, N'Series 61', 2015, 1677, 377, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1D7RE3BK7AS869215', 46, 2, N'Fleetwood Brougham', 1992, 1434, 425, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FAHP3E28CL132877', 91, 3, N'Opirus / Amanti', 2003, 1651, 204, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FMJK1J51AE558998', 42, 2, N'6200', 2000, 1426, 408, 3, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FMJU1F5XAE067185', 22, 1, N'X7', 2004, 1557, 236, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FMJU1J56AE113733', 30, 2, N'CTS', 1997, 1445, 340, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTEW1CM3DF334371', 74, 3, N'Sephia', 2005, 1540, 963, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTEW1E86AF818093', 179, 2, N'Series 62', 1995, 1437, 301, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTEX1CM1BF296018', 82, 3, N'Clarus', 1992, 1638, 128, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTEX1CM5BK565807', 52, 2, N'Series 75', 2009, 1518, 448, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTMF1E84AK129978', 6, 1, N'3-Series', 2006, 1637, 129, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTSF3A50AE770400', 51, 2, N'Series 75', 2006, 1505, 447, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTSW2A50AE633032', 20, 1, N'5-Series, M5', 1993, 1493, 233, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTSX2A58AE041570', 200, 3, N'Sephia', 1996, 1651, 371, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTWF3D57AE486873', 163, 1, N'X6', 2014, 1656, 415, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTWW3B53AE587413', 161, 1, N'X5', 2007, 1674, 406, 3, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1FTWW3B5XAE601405', 32, 2, N'Series 61', 2000, 1459, 370, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G4HD57238U904159', 37, 2, N'Series 62', 1993, 1583, 385, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6AB5SA9D0113584', 77, 3, N'Forte', 1991, 1665, 110, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6AH5S31F0348385', 53, 2, N'Series 75', 1998, 1781, 449, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6AP5SX1E0768734', 193, 3, N'Rio', 2001, 1713, 302, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DA1E30E0416888', 195, 3, N'Soul', 2010, 1506, 310, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DD8E31E0169171', 136, 1, N'New Class 1602, 1802, 2002', 2016, 1633, 233, 1, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DE5E5XC0016413', 50, 2, N'Series 75', 1997, 1601, 446, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DH5E5XC0462438', 107, 3, N'Sportage', 2017, 1705, 302, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DJ1E37D0628461', 100, 3, N'Joice', 1990, 1768, 245, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DJ5E34C0750992', 28, 2, N'CTS', 2005, 1455, 295, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DK8ED9B0319764', 113, 3, N'Mohave / Borrego', 1995, 1720, 370, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DM577280903075', 12, 1, N'4-Series, M4', 2010, 1711, 202, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DN57U260742856', 88, 3, N'Potentia', 1995, 1608, 201, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6DP567750890960', 73, 3, N'Cee''d', 2009, 1449, 798, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1G6KF57952U735337', 95, 3, N'Quoris / K9 / K900', 1994, 1421, 223, 1, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1GD422CGXEF170253', 186, 3, N'Picanto', 1990, 1579, 370, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1GYFC43539R480716', 13, 1, N'3-Series, M3', 2001, 1748, 203, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1GYS3FEJ8CR664092', 146, 1, N'3-Series GT', 1996, 1701, 302, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1GYS3HKJ9FR278172', 122, 4, N'Voyage', 2011, 1420, 129, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1GYS4FEJ9CR310756', 57, 2, N'Series 75', 2019, 1535, 464, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1HGCP2E46AA778977', 38, 2, N'Series 62', 2019, 1417, 387, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1HGCR2E55EA286661', 176, 2, N'Series 61', 1992, 1523, 280, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1J4RG4GK7AC818854', 67, 2, N'Eldorado', 2000, 1636, 640, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1LNHL9DK8EG585379', 104, 3, N'Retona', 2003, 1757, 286, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1LNHL9EK9FG365197', 153, 1, N'5-Series, M5', 2015, 1456, 371, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1N4AB7APXDN538514', 54, 2, N'Series 75', 1999, 1404, 456, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1N6AA0CJ3FN926889', 14, 1, N'4-Series, M4', 1995, 1761, 204, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1N6BF0KM6FN922689', 78, 3, N'Forte / K3', 1993, 1725, 116, 1, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'1ZVBP8JZ2D5191071', 93, 3, N'Cadenza / K7', 1996, 1459, 215, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2B3CK2CV1AH775495', 175, 2, N'Series 61', 2002, 1526, 277, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2C3CCAKT5CH834724', 21, 1, N'5-Series, M5', 2019, 1633, 235, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2C3CDXL97FH493561', 166, 2, N'BLS', 2000, 1454, 215, 1, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2C4RDGCG2FR292116', 3, 1, N'2-Series', 1994, 1750, 120, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2FMPK3K98FB482688', 172, 2, N'CTS', 2007, 1678, 236, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2G4WD582261511218', 164, 1, N'X7', 1994, 1731, 416, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2G4WE587581834383', 133, 4, N'SP2', 2004, 1577, 217, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2G4WS55J341869989', 87, 3, N'Stinger', 2006, 1546, 180, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2HNYB1H68DH924015', 178, 2, N'Series 65', 1992, 1773, 295, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2HNYD18214H913977', 27, 2, N'Catera', 1992, 1586, 286, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2HNYD2H46CH088623', 4, 1, N'1-Series', 1991, 1799, 127, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2T1BURHE4FC565514', 110, 3, N'Sorento', 2011, 1571, 311, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2T1BURHE5EC940812', 59, 2, N'Series 75', 2018, 1679, 481, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2T1BURHE6EC080516', 15, 1, N'3-Series GT', 2009, 1574, 210, 3, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'2T3BFREV2EW071669', 118, 4, N'Gol', 1992, 1779, 118, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3C63D2GL5CG863137', 94, 3, N'Quoris / K9 / K900', 2011, 1576, 217, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3C6LD4AT3CG450587', 55, 2, N'Series 75', 2012, 1744, 458, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3C6TD4HTXCG839880', 180, 2, N'Series 62', 2017, 1488, 302, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3D73M3CL4BG992821', 26, 2, N'ELR', 1998, 1750, 280, 1, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3D73M4CL0AG485600', 25, 2, N'ATS', 2013, 1500, 277, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3D7TT2CT1BG470774', 48, 2, N'Fleetwood', 2015, 1460, 428, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3GYFNCEY2BS887540', 56, 2, N'Series 75', 1994, 1468, 460, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3GYFNGEY9BS444647', 69, 2, N'Eldorado', 2010, 1419, 671, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3LNDL2L33CR462059', 83, 3, N'Magentis / Optima', 2000, 1609, 129, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3LNHL2GC0AR226381', 157, 1, N'New Six CS', 1992, 1611, 385, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3N1AB6AP7BL573385', 130, 4, N'Santana', 1998, 1515, 204, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3N1CN7AP5FL866147', 138, 1, N'3-Series, M3', 2006, 1706, 236, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3VW217AU7FM147306', 29, 2, N'CTS', 2004, 1795, 311, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3VW4A7AT6DM813925', 114, 3, N'Bongo', 2017, 1744, 371, 1, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3VWF17AT3FM605285', 103, 3, N'Carnival / Sedona', 1991, 1539, 280, 1, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3VWKX7AJ2DM808838', 99, 3, N'Carens / Rondo', 1995, 1475, 236, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'3VWML7AJXEM569531', 71, 3, N'Cee''d', 1993, 1472, 793, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'4A31K2DF7BE138498', 116, 3, N'Bongo', 2016, 1745, 110, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'4T1BD1FK6FU133645', 109, 3, N'Sportage', 2018, 1668, 310, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'4T1BF1FK2EU831999', 86, 3, N'Magentis / Optima / K5', 2015, 1468, 170, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'4USBU53567L936239', 162, 1, N'X6', 1991, 1596, 408, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5FNRL5H2XCB183642', 10, 1, N'3-Series, M3', 2009, 1409, 180, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5FNYF3H48FB049614', 17, 1, N'5-Series', 2004, 1569, 217, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5FRYD4H97GB588815', 101, 3, N'Carnival / Sedona', 1998, 1737, 276, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5N1AA0NC5EN749211', 47, 2, N'Brougham', 1995, 1459, 427, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5NMSG3AB7AH234028', 148, 1, N'5-Series', 2007, 1447, 310, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5TDBK3EH2BS734111', 169, 2, N'Catera', 2019, 1567, 228, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5TDBM5G19BS020076', 129, 4, N'Pointer', 2009, 1594, 203, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5TDBW5G12FS063304', 111, 3, N'Sorento', 2004, 1783, 340, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5TFBY5F18AX095253', 23, 2, N'Cimarron', 1994, 1539, 245, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5UXFG43539L241999', 145, 1, N'4-Series, M4', 2012, 1597, 301, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5UXFG83558L839159', 41, 2, N'Series 62', 2016, 1777, 406, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5XYKT3A62FG416932', 96, 3, N'Elan', 2000, 1518, 228, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'5XYZT3LB7FG893235', 131, 4, N'Quantum', 2013, 1662, 210, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JH4CU2F68BC631071', 177, 2, N'Series 61', 1994, 1770, 286, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JH4KA96631C195497', 120, 4, N'Gol', 1990, 1528, 127, 3, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JH4KC1F78EC530392', 132, 4, N'SpaceFox / Suran / SportVan / Fox Plus', 2004, 1718, 215, 3, 1)
GO
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JHMZF1C46CS958531', 188, 3, N'Pride', 1992, 1572, 373, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JM1NC2LF0E0131767', 19, 1, N'5-Series, M5', 1998, 1585, 228, 3, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JM1NC2LF9D0043475', 185, 3, N'Picanto', 1999, 1483, 345, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JM3TB2MA6A0887683', 168, 2, N'ELR', 2014, 1675, 223, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN1AZ4EH7AM509399', 117, 4, N'Fusca', 2008, 1775, 116, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN1BV7APXFM374795', 141, 1, N'3-Series, M3', 1994, 1756, 277, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN1BV7APXFM590680', 187, 3, N'Picanto', 2003, 1762, 371, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN1CV6AP0CM243398', 31, 2, N'Series 60', 1999, 1433, 345, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN1CV6APXCM884333', 2, 1, N'1-Series', 2018, 1523, 118, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN1CV6FEXCM381103', 106, 3, N'Niro', 2003, 1698, 301, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN1CY0APXAM160384', 150, 1, N'5-Series, M5', 2007, 1722, 340, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN8AF5MR7ET518545', 61, 2, N'Fleetwood 75', 2013, 1614, 498, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN8AZ2KR3DT115699', 105, 3, N'Stonic', 2019, 1725, 295, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JN8CS1MU3EM315101', 45, 2, N'Series 60 (Sixty Special)', 1999, 1724, 417, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JTEBU4BF9DK234908', 11, 1, N'3-Series, M3', 2018, 1729, 201, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JTHFF2C27F2931205', 8, 1, N'3-Series, M3', 2008, 1574, 145, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'JTMHY7AJ9B4091499', 183, 2, N'Allanté', 2012, 1694, 311, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'KL4CJFSB9FB654370', 140, 1, N'3-Series, M3', 1993, 1664, 276, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'KMHTC6AD4EU662541', 144, 1, N'3-Series, M3', 2000, 1610, 295, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'KNADH4A36B6877082', 68, 2, N'Eldorado', 2006, 1753, 670, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'KNAFU5A29D5373281', 5, 1, N'New Class 1602, 1802, 2002', 2016, 1791, 128, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'KNAFU6A20B5806571', 125, 4, N'Fox', 2007, 1526, 170, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'NM0KS9BNXBT830533', 34, 2, N'Series 61', 1991, 1401, 373, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'SAJWA0FS8FP468222', 184, 2, N'XLR', 2007, 1614, 340, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'SAJWA2GTXEM305896', 126, 4, N'Brasilia', 1995, 1771, 180, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'SAJWA4EB7EL432469', 156, 1, N'6-Series GT', 2004, 1438, 383, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'SALAB2V67FA465605', 149, 1, N'5-Series, M5', 2008, 1723, 311, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'SALAG2D47AA801263', 159, 1, N'X5', 1993, 1527, 399, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'SALFR2BG8FH292196', 196, 3, N'Avella', 2017, 1769, 311, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'SCBDU3ZA7CC107541', 102, 3, N'Carnival / Sedona', 2005, 1680, 277, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'SCFBF03B27G582917', 43, 2, N'6200', 2012, 1629, 415, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'TRUDD38J481844056', 197, 3, N'Cee''d', 2015, 1567, 340, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'TRURD38J381614210', 108, 3, N'Sportage', 1993, 1767, 307, 2, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WA1AV94L37D000070', 191, 3, N'Rio', 2016, 1702, 385, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WA1CV74LX9D994734', 199, 3, N'Cee''d', 2019, 1784, 370, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WA1LMAFE9DD722859', 90, 3, N'Enterprise', 2004, 1505, 203, 3, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WA1WMAFE2DD971257', 190, 3, N'Rio', 1999, 1487, 383, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WA1YL64B34N831763', 79, 3, N'Forte / K3', 1995, 1710, 118, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUAC48H96K683520', 62, 2, N'Eldorado', 2011, 1649, 509, 1, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUAFAFH7EN465064', 142, 1, N'3-Series, M3', 2000, 1534, 280, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUAFAFL0FN838290', 152, 1, N'5-Series, M5', 2017, 1725, 370, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUBFCFL8CN296660', 58, 2, N'Series 75', 1996, 1573, 480, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUBGAFB1AN276966', 39, 2, N'Series 62', 1992, 1423, 399, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUCFAFH0AN942677', 44, 2, N'Series 60 (Sixty Special)', 2002, 1438, 416, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUD2AFD1EN207208', 123, 4, N'Parati', 2013, 1763, 133, 2, 3)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUDF48H97A496239', 40, 2, N'Series 62', 2002, 1652, 403, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUDF48H98K345526', 134, 4, N'Saveiro', 2008, 1469, 223, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUDH78E47A363910', 75, 3, N'Sephia', 1999, 1736, 101, 2, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUEH48H68K095273', 65, 2, N'Eldorado', 2004, 1736, 626, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUEH74F76N744161', 66, 2, N'Eldorado', 1995, 1490, 628, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUFGAFC6DN013144', 98, 3, N'Carens', 2006, 1508, 235, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUGFAFC5DN926548', 128, 4, N'Logus', 1992, 1663, 202, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUGGAFR1DA366441', 189, 3, N'Pride', 2005, 1753, 377, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUHF98P96A724812', 81, 3, N'Concord', 1991, 1512, 127, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUHGAFC8FN632100', 63, 2, N'Eldorado', 2017, 1711, 601, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUKD78P89A662503', 167, 2, N'ATS', 1994, 1450, 217, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUKFAFL5EA281418', 173, 2, N'Series 60', 2005, 1442, 245, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUKG98E56A006286', 155, 1, N'5-Series GT', 2009, 1481, 377, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAULFAFR3DA033269', 112, 3, N'Sorento', 2009, 1659, 345, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAULL44E35N431957', 124, 4, N'Parati', 1992, 1460, 145, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAULL44E95N690503', 127, 4, N'Apollo', 2017, 1601, 201, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAULT58EX5A470410', 60, 2, N'Fleetwood Limousine', 2016, 1604, 487, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUUL78E45A200167', 182, 2, N'Escalade', 1998, 1532, 310, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUVC68E33A401568', 143, 1, N'4-Series, M4', 2006, 1716, 286, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUVC68E55A439175', 24, 2, N'BLS', 2005, 1471, 276, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUVFAFH7BN873285', 158, 1, N'X4', 2006, 1581, 387, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUVT68E94A410180', 174, 2, N'Series 61', 2009, 1663, 276, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WAUWFBFL6AA160138', 64, 2, N'Eldorado', 2017, 1406, 602, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBA3G7C54EF309612', 135, 4, N'Saveiro', 2008, 1453, 228, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBA3T7C57FP608583', 16, 1, N'New Class 1500, 1600, 1800, 2000', 2002, 1495, 215, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBA3V5C5XFP343527', 49, 2, N'Fleetwood', 1997, 1583, 445, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBABV13466J082217', 170, 2, N'CTS', 1993, 1499, 233, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBABW33455P972485', 9, 1, N'3-Series, M3', 1996, 1753, 170, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAEK13597C722490', 121, 4, N'Voyage / Fox', 1991, 1496, 128, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAGN83515D855874', 165, 2, N'Cimarron', 2005, 1763, 417, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAKE5C5XCJ498380', 7, 1, N'3-Series, M3', 2016, 1483, 133, 1, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAKG7C54DJ746310', 1, 1, N'1-Series', 2009, 1794, 116, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAKN9C51FD688174', 147, 1, N'New Class 1500, 1600, 1800, 2000', 2008, 1691, 307, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBANV1C59AC580740', 97, 3, N'Venga', 2012, 1682, 233, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAPM7C57AE459062', 171, 2, N'CTS', 2007, 1696, 235, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBASN2C55AC523024', 33, 2, N'Series 61', 2000, 1504, 371, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAUP7C52BV069773', 92, 3, N'Cadenza / K7', 1995, 1675, 210, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAUP7C58DV367411', 151, 1, N'5-Series, M5', 2007, 1622, 345, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAUP9C58AV223509', 80, 3, N'Shuma', 2011, 1562, 120, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBAWV13557P451979', 194, 3, N'Soul', 1993, 1560, 307, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBS3R9C51FF196091', 36, 2, N'Series 65', 2001, 1596, 383, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBSBR93493P275260', 72, 3, N'Cee''d', 2010, 1551, 795, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WBSWD9C57AP228332', 160, 1, N'X5', 2007, 1426, 403, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WDDHH8HB5BA767975', 198, 3, N'Cee''d', 1997, 1788, 345, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WP0AB2A87FK108949', 70, 2, N'Eldorado', 2006, 1791, 690, 1, 2)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WVGAV7AX3BW390470', 181, 2, N'Series 62', 2011, 1493, 307, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WVWAA7AJ5CW398762', 192, 3, N'Rio', 2014, 1587, 301, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WVWAB7AJ0CW557264', 115, 3, N'Bongo Frontier', 2017, 1667, 373, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'WVWGD7AJ7EW053317', 18, 1, N'5-Series, M5', 2008, 1705, 223, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'YV1382MW1A2097161', 89, 3, N'Potentia', 1997, 1757, 202, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'YV1612FH2D1519917', 119, 4, N'Gol', 2008, 1769, 120, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'YV1672MK0D2114467', 154, 1, N'5-Series, M5', 2004, 1480, 373, 2, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'YV1902FH3D1001332', 137, 1, N'3-Series', 2019, 1797, 235, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'YV4902NC8F1531985', 139, 1, N'3-Series, M3', 2014, 1685, 245, 3, 1)
INSERT [dbo].[Vehicle] ([VIN], [DriverId], [ManufacturerId], [Model], [Year], [Weight], [Color], [EngineType], [TypeofDriveId]) VALUES (N'ZFBCFACH5FZ996096', 85, 3, N'Magentis / Optima / K5', 1995, 1669, 145, 2, 2)
GO
ALTER TABLE [dbo].[Licence]  WITH CHECK ADD  CONSTRAINT [FK_Licence_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([DriverId])
GO
ALTER TABLE [dbo].[Licence] CHECK CONSTRAINT [FK_Licence_Driver]
GO
ALTER TABLE [dbo].[Licence]  WITH CHECK ADD  CONSTRAINT [FK_Licence_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Licence] CHECK CONSTRAINT [FK_Licence_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([DriverId])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Driver]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Manufacturer]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_TypeOfDrive] FOREIGN KEY([TypeofDriveId])
REFERENCES [dbo].[TypeOfDrive] ([TypeofDriveId])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_TypeOfDrive]
GO
USE [master]
GO
ALTER DATABASE [GosAutoInspection] SET  READ_WRITE 
GO
