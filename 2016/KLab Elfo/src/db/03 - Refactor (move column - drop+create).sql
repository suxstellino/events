:setvar DatabaseName ""
SET NOCOUNT ON;
GO
USE $(DatabaseName);
GO

ALTER TABLE dbo.Users DROP COLUMN Username;
GO