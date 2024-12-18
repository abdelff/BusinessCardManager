USE [master]
GO
/****** Object:  Database [BusinessCardDB]    Script Date: 12/15/2024 5:58:55 PM ******/
CREATE DATABASE [BusinessCardDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BusinessCardDB', FILENAME = N'C:\Users\Abd16\BusinessCardDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BusinessCardDB_log', FILENAME = N'C:\Users\Abd16\BusinessCardDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BusinessCardDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusinessCardDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusinessCardDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusinessCardDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusinessCardDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusinessCardDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusinessCardDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusinessCardDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BusinessCardDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusinessCardDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusinessCardDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusinessCardDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusinessCardDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusinessCardDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusinessCardDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusinessCardDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusinessCardDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BusinessCardDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusinessCardDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusinessCardDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusinessCardDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusinessCardDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusinessCardDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusinessCardDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusinessCardDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BusinessCardDB] SET  MULTI_USER 
GO
ALTER DATABASE [BusinessCardDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusinessCardDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BusinessCardDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusinessCardDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BusinessCardDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BusinessCardDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BusinessCardDB] SET QUERY_STORE = OFF
GO
USE [BusinessCardDB]
GO
/****** Object:  Table [dbo].[BusinessCards]    Script Date: 12/15/2024 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Company] [nvarchar](100) NULL,
	[Title] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BusinessCards] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
USE [master]
GO
ALTER DATABASE [BusinessCardDB] SET  READ_WRITE 
GO
