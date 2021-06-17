USE DemoDatabase;
GO

-- some changes to undo
ALTER TABLE dbo.SqlSatSessions DROP CONSTRAINT FK_SqlSatSessions_LevelId;
GO
ALTER TABLE dbo.SqlSatSessions DROP COLUMN LevelId;
GO
ALTER TABLE dbo.Levels ALTER COLUMN LevelDescription nvarchar(20) NOT NULL
GO

