USE Samples;
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE name = 'CLRTypes')
	DROP TABLE dbo.CLRTypes;
GO

CREATE TABLE dbo.CLRTypes (
	Id hierarchyid PRIMARY KEY,
	value xml,
	geo geography
);
GO

DECLARE @root hierarchyid = hierarchyid::GetRoot();
DECLARE @id hierarchyid;
DECLARE @xml xml =  (SELECT
						FirstName,
						LastName
					FROM
						dbo.Users
					FOR XML AUTO);
DECLARE @g geography;

INSERT INTO CLRTypes (id, value, geo) VALUES (@root, @xml, @g);

SET @id = @root.GetDescendant(null, null);

INSERT INTO CLRTypes (id, value, geo) VALUES (@id, @xml, @g);

-- CLR - supported
USE Samples;
GO
SELECT
	id, value
FROM
	CLRTypes
FOR JSON AUTO;
GO

-- CLR - unsupported
USE Samples;
GO
SELECT
	geo
FROM
	CLRTypes
FOR JSON AUTO;
GO

-- SELECT INTO - unsupported
USE Samples;
GO
SELECT
	FirstName, 
	LastName
	INTO temp
FROM
	dbo.Users
FOR JSON AUTO;
GO

SELECT * FROM temp;
GO

-- ALIASES
USE Samples;
GO
SELECT 1, 'ciao' FOR JSON PATH;
GO
USE Samples;
GO
SELECT 1, 'ciao' FOR JSON AUTO;
GO