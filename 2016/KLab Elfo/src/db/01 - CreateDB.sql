:setvar DatabaseName1 "ElfoKLabJune2016_Dev1"
:setvar DatabaseName2 "ElfoKLabJune2016_Dev2"

SET NOCOUNT ON;
GO

CREATE DATABASE $(DatabaseName1)
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'$(DatabaseName1)', FILENAME = N'C:\__Databases\$(DatabaseName1).mdf' , SIZE = 4096KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'$(DatabaseName1)_log', FILENAME = N'C:\__Databases\$(DatabaseName1)_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE $(DatabaseName1) SET COMPATIBILITY_LEVEL = 110
GO
ALTER DATABASE $(DatabaseName1) SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE $(DatabaseName1) SET ANSI_NULLS OFF 
GO
ALTER DATABASE $(DatabaseName1) SET ANSI_PADDING OFF 
GO
ALTER DATABASE $(DatabaseName1) SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE $(DatabaseName1) SET ARITHABORT OFF 
GO
ALTER DATABASE $(DatabaseName1) SET AUTO_CLOSE OFF 
GO
ALTER DATABASE $(DatabaseName1) SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE $(DatabaseName1) SET AUTO_SHRINK OFF 
GO
ALTER DATABASE $(DatabaseName1) SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE $(DatabaseName1) SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE $(DatabaseName1) SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE $(DatabaseName1) SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE $(DatabaseName1) SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE $(DatabaseName1) SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE $(DatabaseName1) SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE $(DatabaseName1) SET  DISABLE_BROKER 
GO
ALTER DATABASE $(DatabaseName1) SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE $(DatabaseName1) SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE $(DatabaseName1) SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE $(DatabaseName1) SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE $(DatabaseName1) SET  READ_WRITE 
GO
ALTER DATABASE $(DatabaseName1) SET RECOVERY FULL 
GO
ALTER DATABASE $(DatabaseName1) SET  MULTI_USER 
GO
ALTER DATABASE $(DatabaseName1) SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE $(DatabaseName1) SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE $(DatabaseName1)
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE $(DatabaseName1) MODIFY FILEGROUP [PRIMARY] DEFAULT
GO

CREATE DATABASE $(DatabaseName2)
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'$(DatabaseName2)', FILENAME = N'C:\__Databases\$(DatabaseName2).mdf' , SIZE = 4096KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'$(DatabaseName2)_log', FILENAME = N'C:\__Databases\$(DatabaseName2)_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE $(DatabaseName2) SET COMPATIBILITY_LEVEL = 110
GO
ALTER DATABASE $(DatabaseName2) SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE $(DatabaseName2) SET ANSI_NULLS OFF 
GO
ALTER DATABASE $(DatabaseName2) SET ANSI_PADDING OFF 
GO
ALTER DATABASE $(DatabaseName2) SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE $(DatabaseName2) SET ARITHABORT OFF 
GO
ALTER DATABASE $(DatabaseName2) SET AUTO_CLOSE OFF 
GO
ALTER DATABASE $(DatabaseName2) SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE $(DatabaseName2) SET AUTO_SHRINK OFF 
GO
ALTER DATABASE $(DatabaseName2) SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE $(DatabaseName2) SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE $(DatabaseName2) SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE $(DatabaseName2) SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE $(DatabaseName2) SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE $(DatabaseName2) SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE $(DatabaseName2) SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE $(DatabaseName2) SET  DISABLE_BROKER 
GO
ALTER DATABASE $(DatabaseName2) SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE $(DatabaseName2) SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE $(DatabaseName2) SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE $(DatabaseName2) SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE $(DatabaseName2) SET  READ_WRITE 
GO
ALTER DATABASE $(DatabaseName2) SET RECOVERY FULL 
GO
ALTER DATABASE $(DatabaseName2) SET  MULTI_USER 
GO
ALTER DATABASE $(DatabaseName2) SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE $(DatabaseName2) SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE $(DatabaseName2)
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE $(DatabaseName2) MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
