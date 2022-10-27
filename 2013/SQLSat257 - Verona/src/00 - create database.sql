USE [master]
GO

-- Change the files path if your database must be in another place
CREATE DATABASE [DemoDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoDatabase', FILENAME = N'C:\__Databases\DemoDatabase\DemoDatabase.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DemoDatabase_log', FILENAME = N'C:\__Databases\DemoDatabase\DemoDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [DemoDatabase] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DemoDatabase] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DemoDatabase] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DemoDatabase] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DemoDatabase] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DemoDatabase] SET ARITHABORT OFF 
GO

ALTER DATABASE [DemoDatabase] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DemoDatabase] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [DemoDatabase] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DemoDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DemoDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DemoDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DemoDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DemoDatabase] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DemoDatabase] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DemoDatabase] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DemoDatabase] SET  DISABLE_BROKER 
GO

ALTER DATABASE [DemoDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DemoDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DemoDatabase] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DemoDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DemoDatabase] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DemoDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DemoDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DemoDatabase] SET RECOVERY FULL 
GO

ALTER DATABASE [DemoDatabase] SET  MULTI_USER 
GO

ALTER DATABASE [DemoDatabase] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DemoDatabase] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DemoDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DemoDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [DemoDatabase] SET  READ_WRITE 
GO
