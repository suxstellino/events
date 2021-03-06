USE [Esercizi]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [UserTests].[test SearchUsers dovrebbe tornare un record vuoto se non indico parametri]
AS
BEGIN
	
	-- Assemble (create test data)
	EXEC tSQLt.FakeTable 
		@TableName = N'Users'
	  , @SchemaName = N'dbo'
	  , @Identity = 0; -- does not retain identities on the fake table (test purpose)
	EXEC tSQLt.FakeTable 
		@TableName = N'UserContacts'
	  , @SchemaName = N'dbo';
  
	-- Act
	
	-- Assert
	EXEC tSQLt.AssertResultSetsHaveSameMetaData
	    @expectedCommand = N'EXEC dbo.SearchUsers;'
	  , @actualCommand = N'SET FMTONLY ON; 
				SELECT 
				    U.UserId
				  , U.Username
				  , U.FirstName
				  , U.LastName
				  , U.BirthDate
				  , C.Street
				  , C.Town
				  , C.ZipCode
				  , C.StateOrProvince 
				FROM 
				  dbo.Users U 
				  JOIN dbo.UserContacts C ON U.UserId = C.UserId;';
END;

