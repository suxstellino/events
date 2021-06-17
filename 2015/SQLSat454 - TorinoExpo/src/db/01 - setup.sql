USE Samples;
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE name = 'Users')
	DROP TABLE dbo.Users;
GO

IF EXISTS(SELECT 1 FROM sys.tables WHERE name = 'UserCourses')
	DROP TABLE dbo.UserCourses;
GO

CREATE TABLE dbo.Users
(
	UserId int identity(1, 1) NOT NULL PRIMARY KEY CLUSTERED,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Age tinyint NOT NULL	
);
GO

CREATE TABLE dbo.UserCourses
(
	UserId int,
	CourseId int NOT NULL,
	CourseName varchar(50) NOT NULL, 
	TestDate date NULL
	PRIMARY KEY (UserId, CourseId)
);
GO

INSERT INTO dbo.Users (FirstName, LastName, Age)
VALUES 
	('Alessandro', 'Alpi', 34),
	('Michael', 'Denny', 30),
	('Andrea', 'Ferrari', 49),
	('Alex', 'Sartori', 28);
GO

INSERT INTO dbo.UserCourses (UserId, CourseId, CourseName, TestDate)
VALUES 
	(1, 10, 'SQL Server Querying', '20150505'),
	(1, 20, 'SQL Server Troubleshooting', '20150605'),
	(1, 30, 'ALM with Visual Studio', null),
	(2, 100, 'Advanced Rabbit MQ', '20150505'),
	(2, 200, 'Enterprise design patterns', '20150605'),
	(3, 1000, 'ASP.Net MVC in action', null),
	(4, 5000, 'Owin in depth', '20150505');
GO	
