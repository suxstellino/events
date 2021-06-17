USE Samples;
GO

SET NOCOUNT ON;

-- OPENJSON()
DECLARE @json_text nvarchar(2000) = 
'{"Students":
 [
	{
		"UserId":1,
		"FirstName":"Alessandro",
		"LastName":"Alpi",
		"Age":34
	},
	{
		"UserId":2,
		"FirstName":"Michael",
		"LastName":"Denny",
		"Age":30
	},
	{
		"UserId":3,
		"FirstName":"Andrea",
		"LastName":"Ferrari",
		"Age":49
	},
	{
		"UserId":4,
		"FirstName":"Alex",
		"LastName":"Sartori",
		"Age":28
	}
]
}';

SELECT FirstName, LastName, Age
 FROM OPENJSON (@json_text, '$.Students')
 WITH (
        FirstName varchar(30), 
        LastName varchar(30),
        Age tinyint
 ) 
 AS Students;

 -- ISJSON()
 IF ISJSON(@json_text) > 0
	SELECT 'IS A VALID JSON!';
ELSE
	SELECT 'JSON IS NOT VALID';
GO

-- JSON_VALUE
DECLARE @UsersJSON TABLE
(
	UserId int,
	JsonData nvarchar(2000)
);

INSERT INTO @UsersJSON (UserId, JsonData) VALUES (1, '{"FirstName":"Alessandro","LastName":"Alpi","Age":34}');
INSERT INTO @UsersJSON (UserId, JsonData) VALUES (2, '{"FirstName":"Michael","LastName":"Denny","Age":30}');

SELECT
	JSON_VALUE(JsonData, '$.LastName') as LastName,
	JSON_VALUE(JsonData, '$.Age') as Age
FROM
	@UsersJSON
WHERE
	JSON_VALUE(JsonData, '$.FirstName') = 'Michael';

-- record returned --> 2, '{"FirstName":"Michael","LastName":"Denny","Age":30}'
GO
M 
	OPENJSON (@json_text, '$.Students')
	 WITH (
        FirstName varchar(30), 
        LastName varchar(30),
        Age tinyint,
		Courses varchar(1000)
	) 
	AS Students
WHERE
	FirstName = 'Michael';



