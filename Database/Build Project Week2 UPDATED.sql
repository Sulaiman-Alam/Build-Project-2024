USE [master]
GO
/****** Object:  Database [BUILD_PROJECT_2024]    Script Date: 8/7/2024 6:44:36 PM ******/
CREATE DATABASE [BUILD_PROJECT_2024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BUILD_PROJECT_2024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BUILD_PROJECT_2024.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BUILD_PROJECT_2024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BUILD_PROJECT_2024_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BUILD_PROJECT_2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET RECOVERY FULL 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET  MULTI_USER 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BUILD_PROJECT_2024', N'ON'
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET QUERY_STORE = ON
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BUILD_PROJECT_2024]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 8/7/2024 6:44:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Gender] [varchar](10) NULL,
	[DOB] [date] NULL,
	[Country] [varchar](255) NULL,
	[TeamId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerRole]    Script Date: 8/7/2024 6:44:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NULL,
 CONSTRAINT [PK_PlayerRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stadium]    Script Date: 8/7/2024 6:44:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadium](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StadiumName] [varchar](255) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Stadium] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 8/7/2024 6:44:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [varchar](255) NOT NULL,
	[City] [varchar](255) NULL,
	[StadiumId] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[PlayerRole] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Role]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Team]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Stadium] FOREIGN KEY([StadiumId])
REFERENCES [dbo].[Stadium] ([Id])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Stadium]
GO
USE [master]
GO
ALTER DATABASE [BUILD_PROJECT_2024] SET  READ_WRITE 
GO
