SET NOCOUNT ON;
GO
USE EserciziGit;
GO
IF EXISTS(SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('dbo.UserContacts'))
	DROP TABLE dbo.UserContacts;
GO
IF EXISTS(SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('dbo.Users'))
	DROP TABLE dbo.Users;
GO

-- dbo.Users table
CREATE TABLE dbo.Users
(
	  UserId int IDENTITY(1, 1) NOT NULL PRIMARY KEY CLUSTERED
	, Username varchar(30) NOT NULL
	, FirstName varchar(30) NOT NULL
	, LastName varchar(30) NOT NULL
	, BirthDate date NOT NULL
);
GO

-- dbo.UserContacts table
CREATE TABLE dbo.UserContacts
(
	  UserId int NOT NULL PRIMARY KEY CLUSTERED
	, Street varchar(50) NOT NULL
	, Town varchar(30) NOT NULL
	, ZipCode char(5) NOT NULL
	, StateOrProvince varchar(30) NOT NULL
);
GO

-- FKs
ALTER TABLE dbo.UserContacts 
ADD CONSTRAINT FK_Users_UserContacts FOREIGN KEY (UserId) 
REFERENCES dbo.Users (UserId);
GO

INSERT INTO dbo.Users (Username, FirstName, LastName, BirthDate)
VALUES
        ('EttaGab', 'Gabriele', 'Etta', '19940725'),
		('SuxStellino', 'Alessandro', 'Alpi', '19810422'),
		('MicDenny', 'Michael', 'Denny', '19850714');
GO

INSERT INTO dbo.UserContacts (UserId, Street, Town, ZipCode, StateOrProvince)
VALUES
        (1, 'Via Roma, 10', 'Parma', '43100', 'Parma'),
		(2, 'Via Verdi, 20', 'Parma', '43100', 'Parma'),
		(3, 'Via Dante, 30', 'Parma', '43100', 'Parma');
GO

IF OBJECT_ID('dbo.SearchUsers') IS NULL 
	EXEC ('CREATE PROCEDURE dbo.SearchUsers AS RETURN 0;')
GO

-- customer procedure
ALTER PROCEDURE dbo.SearchUsers
	  @UserId int = NULL
	, @LastName varchar(30) = NULL
AS
BEGIN

	SET NOCOUNT ON;
	
	IF	@UserId IS NOT NULL 
		OR @LastName IS NOT NULL
	BEGIN

		SELECT
		    U.UserId
		  , U.Username
		  , U.FirstName
		  , U.LastName
		  , U.BirthDate
		  , UC.Street
		  , UC.Town
		  , UC.ZipCode
		  , UC.StateOrProvince
		FROM
			dbo.Users				U	
			JOIN dbo.UserContacts	UC ON UC.UserId = U.UserId
		WHERE
			@UserId IS NULL OR U.UserId = @UserId
			AND (@LastName IS NULL OR U.LastName LIKE @LastName + '%');
	END;

END;
GO
