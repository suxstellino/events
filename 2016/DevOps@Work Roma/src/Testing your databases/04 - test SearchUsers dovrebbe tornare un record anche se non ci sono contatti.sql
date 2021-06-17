USE [Esercizi]
GO
CREATE PROCEDURE UserTests.[test SearchUsers dovrebbe tornare un record anche se non ci sono contatti]
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

	-- 2 - insert "stub" records
	INSERT INTO dbo.Users (UserId, Username, FirstName, LastName, BirthDate)
	VALUES 
		(2, 'ettagab', 'Gabriele', 'Etta', '19940725');
  
	-- Act
	DECLARE @Results table
    (
		  UserId int
		, Username varchar(30)
		, FirstName varchar(30)
		, LastName varchar(30)
		, BirthDate date
		, Street varchar(50)
		, Town varchar(30)
		, ZipCode char(5)
		, StateOrProvince varchar(30)
	)

	-- execute the customer procedure and store the result into the @Results table
	INSERT INTO @Results (UserId, Username, FirstName, LastName, BirthDate, Street, Town, ZipCode, StateOrProvince)
		EXEC dbo.SearchUsers
			@UserId = 2;
	
	-- store the number of record into a temp variable
	DECLARE @NumberOfRows int = -1;
	SELECT @NumberOfRows = COUNT(1) FROM @Results;

	-- Assert
	EXEC tSQLt.AssertEquals
	    @Expected = 1
	  , @Actual = @NumberOfRows
	  , @Message = N'Wrong number of rows!';
	

END;
GO
