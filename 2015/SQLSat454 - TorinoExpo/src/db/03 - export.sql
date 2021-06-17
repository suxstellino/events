USE Samples;
GO

-- OPENJSON()
DECLARE @json_text nvarchar(2000) = 
'{
  "Students": [
    {
      "FirstName": "Alessandro",
      "LastName": "Alpi",
      "Age": 34
    },
    {
      "FirstName": "Michael",
      "LastName": "Denny",
      "Age": 30
    },
    {
      "FirstName": "Andrea",
      "LastName": "Ferrari",
      "Age": 49
    },
    {
      "FirstName": "Alex",
      "LastName": "Sartori",
      "Age": 28
    }
  ]
}'

SELECT FirstName, LastName, Age
 FROM OPENJSON (@json_text)
 WITH (
        FirstName varchar(30), 
        LastName varchar(30),
        Age tinyint
 ) AS Students;

 -- ISJSON()
 IF ISJSON(@json_text) > 0
	PRINT 'OK!';
ELSE
	PRINT 'KO';

-- JSON_VALUE
DECLARE @UsersJSON TABLE
(
	UserId int,
	JsonData nvarchar(2000)
);

INSERT INTO @UsersJSON (UserId, JsonData) VALUES (1, '{"FirstName":"Alessandro","LastName":"Alpi","Age":34}');
INSERT INTO @UsersJSON (UserId, JsonData) VALUES (2, '{"FirstName":"Michael","LastName":"Denny","Age":30}');

SELECT
	*
FROM
	@UsersJSON
WHERE
	JSON_VALUE(JsonData, '$.FirstName') = 'Michael';

-- record returned --> 2, '{"FirstName":"Michael","LastName":"Denny","Age":30}'