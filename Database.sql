USE [master]
GO
/****** Object:  Database [sample 20]    Script Date: 03-12-2021 23:31:16 ******/
CREATE DATABASE [sample 20]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sample 20', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sample 20.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sample 20_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sample 20_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sample 20] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sample 20].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sample 20] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sample 20] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sample 20] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sample 20] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sample 20] SET ARITHABORT OFF 
GO
ALTER DATABASE [sample 20] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sample 20] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sample 20] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sample 20] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sample 20] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sample 20] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sample 20] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sample 20] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sample 20] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sample 20] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sample 20] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sample 20] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sample 20] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sample 20] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sample 20] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sample 20] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sample 20] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sample 20] SET RECOVERY FULL 
GO
ALTER DATABASE [sample 20] SET  MULTI_USER 
GO
ALTER DATABASE [sample 20] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sample 20] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sample 20] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sample 20] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sample 20] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sample 20] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sample 20', N'ON'
GO
ALTER DATABASE [sample 20] SET QUERY_STORE = OFF
GO
USE [sample 20]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 03-12-2021 23:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[id] [int] NOT NULL,
	[university_id] [int] NULL,
	[name] [varchar](255) NULL,
	[teacher_name] [varchar](255) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universities]    Script Date: 03-12-2021 23:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universities](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[description] [varchar](max) NULL,
	[country] [varchar](255) NULL,
	[minimum_gpa] [float] NULL,
	[minimum_gre_score] [float] NULL,
 CONSTRAINT [PK_Universities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([id], [university_id], [name], [teacher_name]) VALUES (1, 1, N'DataScience', N'Ram')
INSERT [dbo].[Courses] ([id], [university_id], [name], [teacher_name]) VALUES (2, 2, N'ComputerScience', N'Sita')
INSERT [dbo].[Courses] ([id], [university_id], [name], [teacher_name]) VALUES (3, 2, N'Social', N'Lakshman')
GO
INSERT [dbo].[Universities] ([id], [name], [description], [country], [minimum_gpa], [minimum_gre_score]) VALUES (1, N'JNTU', N'University', N'IN', 5, 250)
INSERT [dbo].[Universities] ([id], [name], [description], [country], [minimum_gpa], [minimum_gre_score]) VALUES (2, N'JNTUK', N'University', N'IN', 5, 250)
INSERT [dbo].[Universities] ([id], [name], [description], [country], [minimum_gpa], [minimum_gre_score]) VALUES (3, N'JNTUH', N'University', N'IN', 5, 250)
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Universities] FOREIGN KEY([university_id])
REFERENCES [dbo].[Universities] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Universities]
GO
USE [master]
GO
ALTER DATABASE [sample 20] SET  READ_WRITE 
GO
