USE Samples;
GO

-- indicizzazione

/*
JsonData:
	{
      "FirstName": "Alessandro",
      "LastName": "Alpi",
      "Age": 34
    }
*/

CREATE TABLE dbo.UsersJSON
(
	UserId int identity(1, 1) NOT NULL PRIMARY KEY CLUSTERED,
	JsonData nvarchar(2000) NOT NULL,
	Age AS CAST(JSON_VALUE(JsonData, '$.Age') AS tinyint),
);
GO

CREATE INDEX IX_dboUsersJSON_Age ON dbo.UsersJSON(Age) INCLUDE (UserId);
GO
