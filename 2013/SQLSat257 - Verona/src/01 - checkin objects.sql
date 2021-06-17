USE DemoDatabase;
GO

-- creates the speakers demo table
IF OBJECT_ID('dbo.Speakers') IS NULL
CREATE TABLE dbo.Speakers
(
	  SpeakerId int IDENTITY(1, 1) NOT NULL PRIMARY KEY CLUSTERED
	, SpeakerFullName nvarchar(50) NOT NULL
);
GO

-- creates the level demo table
IF OBJECT_ID('dbo.Levels') IS NULL
CREATE TABLE dbo.Levels
(
	  LevelId tinyint NOT NULL PRIMARY KEY CLUSTERED
	, LevelDescription nvarchar(50) NOT NULL
);
GO

-- creates the sessions demo table
IF OBJECT_ID('dbo.SqlSatSessions') IS NULL
BEGIN
	CREATE TABLE dbo.SqlSatSessions
	(
		  SessionId tinyint NOT NULL PRIMARY KEY CLUSTERED
		, SessionTitle nvarchar(100) NOT NULL
		, SessionAbstract nvarchar(256) NOT NULL
		, SpeakerId int NOT NULL
		, LevelId tinyint NOT NULL
	);
	
	ALTER TABLE dbo.SqlSatSessions ADD CONSTRAINT FK_SqlSatSessions_LevelId FOREIGN KEY (LevelId) REFERENCES dbo.Levels (LevelId);
	ALTER TABLE dbo.SqlSatSessions ADD CONSTRAINT FK_SqlSatSessions_SpeakerId FOREIGN KEY (SpeakerId) REFERENCES dbo.Speakers (SpeakerId);
END
GO