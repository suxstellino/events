-- FIRST!! change the result to text options in SSMS query editor (Tools -> Options -> Query result -> Result to text --> 5000)
-- PATH
-- without FROM

USE Samples;
GO
SELECT
	'Alessandro' as FirstName,
	'Romanini' as LastName,
	34 as Age
FOR JSON PATH;

USE Samples;
GO
SELECT
	'Alessandro' as FirstName,
	'Romanini' as LastName,
	34 as Age
FOR JSON PATH, ROOT('Friends');

USE Samples;
GO
SELECT
	'Alessandro' as FirstName,
	'Romanini' as LastName,
	34 as Age,
	(SELECT 'aaa@aaa.it' as email, '5463456' as phone, 'ssss' as skypeIM FOR JSON PATH) as Contacts
FOR JSON PATH, ROOT('Friends');

-- with FROM

USE Samples;
GO
SELECT
	US.FirstName,
	US.LastName,
	US.Age,
	UC.CourseName,
	UC.TestDate
FROM
	dbo.Users US
	JOIN dbo.UserCourses UC ON UC.UserId = US.UserId
FOR JSON PATH, ROOT('Students');

USE Samples;
GO
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
USE Samples;
GO
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