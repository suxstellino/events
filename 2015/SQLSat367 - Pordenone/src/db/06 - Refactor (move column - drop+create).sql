SET NOCOUNT ON;
GO
USE Esercizi;
GO
CREATE TABLE dbo.UserCredentials 
(
	  UserId int NOT NULL PRIMARY KEY CLUSTERED
	, Username varchar(30) NOT NULL
    , Pwd varchar(30) NOT NULL
    , MustChangePassword bit NOT NULL DEFAULT(0)
);
GO

INSERT INTO dbo.UserCredentials (UserId, Username, Pwd, MustChangePassword)
SELECT
	  UserId
	, Username
	, 'p@ssw0rd'
	, 0
FROM
	dbo.Users

ALTER TABLE dbo.Users DROP COLUMN Username;
GO