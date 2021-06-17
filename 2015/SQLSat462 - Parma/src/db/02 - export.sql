USE Samples;
GO

SET NOCOUNT ON;

-- PATH
-- Senza FROM

SELECT
	'Alessandro' as FirstName,
	'Romanini' as LastName,
	34 as Age,
	(SELECT 'aaa@aaa.it' as email, '5463456' as phone, 'ssss' as skypeIM FOR JSON PATH) as Contacts
FOR JSON PATH, ROOT('Friends');

-- Con FROM
SELECT
	US.FirstName,
	US.LastName,
	US.Age,
	UC.CourseName,
	UC.TestDate
FROM
	dbo.Users US
	JOIN dbo.UserCourses UC ON UC.UserId = US.UserId
FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT('Students');

-- AUTO
SELECT
	US.FirstName,
	US.LastName,
	US.Age,
	UC.CourseName,
	UC.TestDate
FROM
	dbo.Users US
	JOIN dbo.UserCourses UC ON UC.UserId = US.UserId
FOR JSON AUTO, INCLUDE_NULL_VALUES, ROOT('Students');