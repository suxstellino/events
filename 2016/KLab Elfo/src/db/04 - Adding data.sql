:setvar DatabaseName ""
USE $(DatabaseName);
GO
SET NOCOUNT ON;
GO
IF EXISTS(SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('dbo.Towns'))
	DROP TABLE dbo.Towns;
GO
CREATE TABLE dbo.Towns
(
	  TownId smallint NOT NULL PRIMARY KEY CLUSTERED
	, Town varchar(50) NOT NULL
);
GO

INSERT INTO dbo.Towns (TownId, Town)
VALUES 
	(1, 'Piacenza'),
	(2, 'Parma'),
	(3, 'Milano'),
	(4, 'Roma'),
	(5, 'Napoli');
GO