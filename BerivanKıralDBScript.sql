USE [master]
GO
/****** Object:  Database [personel_takip]    Script Date: 18.01.2022 19:32:42 ******/
CREATE DATABASE [personel_takip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'personel_takip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\personel_takip.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'personel_takip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\personel_takip_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [personel_takip] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [personel_takip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [personel_takip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [personel_takip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [personel_takip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [personel_takip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [personel_takip] SET ARITHABORT OFF 
GO
ALTER DATABASE [personel_takip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [personel_takip] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [personel_takip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [personel_takip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [personel_takip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [personel_takip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [personel_takip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [personel_takip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [personel_takip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [personel_takip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [personel_takip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [personel_takip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [personel_takip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [personel_takip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [personel_takip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [personel_takip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [personel_takip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [personel_takip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [personel_takip] SET RECOVERY FULL 
GO
ALTER DATABASE [personel_takip] SET  MULTI_USER 
GO
ALTER DATABASE [personel_takip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [personel_takip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [personel_takip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [personel_takip] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'personel_takip', N'ON'
GO
USE [personel_takip]
GO
/****** Object:  Table [dbo].[TblCinsiyet]    Script Date: 18.01.2022 19:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCinsiyet](
	[id] [int] NOT NULL,
	[Cinsiyet] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblCinsiyet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblDepartman]    Script Date: 18.01.2022 19:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDepartman](
	[id] [int] NOT NULL,
	[departman] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblDepartman] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblPersonel]    Script Date: 18.01.2022 19:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPersonel](
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[SehirID] [int] NULL,
	[Telefon] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Tarih] [date] NULL,
	[id] [int] NOT NULL,
	[DepartmanID] [int] NOT NULL,
	[CinsiyetID] [int] NULL,
 CONSTRAINT [PK_TblPersonel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblSehir]    Script Date: 18.01.2022 19:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSehir](
	[id] [int] NOT NULL,
	[Sehir] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblSehir] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TblPersonel]  WITH CHECK ADD  CONSTRAINT [FK_TblPersonel_TblCinsiyet1] FOREIGN KEY([CinsiyetID])
REFERENCES [dbo].[TblCinsiyet] ([id])
GO
ALTER TABLE [dbo].[TblPersonel] CHECK CONSTRAINT [FK_TblPersonel_TblCinsiyet1]
GO
ALTER TABLE [dbo].[TblPersonel]  WITH CHECK ADD  CONSTRAINT [FK_TblPersonel_TblDepartman1] FOREIGN KEY([DepartmanID])
REFERENCES [dbo].[TblDepartman] ([id])
GO
ALTER TABLE [dbo].[TblPersonel] CHECK CONSTRAINT [FK_TblPersonel_TblDepartman1]
GO
ALTER TABLE [dbo].[TblPersonel]  WITH CHECK ADD  CONSTRAINT [FK_TblPersonel_TblSehir] FOREIGN KEY([SehirID])
REFERENCES [dbo].[TblSehir] ([id])
GO
ALTER TABLE [dbo].[TblPersonel] CHECK CONSTRAINT [FK_TblPersonel_TblSehir]
GO
USE [master]
GO
ALTER DATABASE [personel_takip] SET  READ_WRITE 
GO
