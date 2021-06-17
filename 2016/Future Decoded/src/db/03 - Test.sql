USE DemoFutureDecoded2016;
GO

EXEC tSQLt.NewTestClass @ClassName = N'UserTests';
GO

CREATE PROCEDURE UserTests.[test Order list total amount should be the same of the sum of the amounts in the details]
AS
BEGIN
	
	-- Assemble (create test data)
	EXEC tSQLt.FakeTable 
		@TableName = N'Orders'
	  , @SchemaName = N'dbo';
	EXEC tSQLt.FakeTable 
		@TableName = N'OrderDetails'
	  , @SchemaName = N'dbo';
	EXEC tSQLt.FakeTable 
		@TableName = N'Inventory'
	  , @SchemaName = N'dbo';
	EXEC tSQLt.FakeTable 
		@TableName = N'Customers'
	  , @SchemaName = N'dbo';

	-- 2 - insert "stub" records
	INSERT INTO dbo.Customers (CustomerId, FirstName, LastName, BirthDate)
	VALUES
			(1, 'John', 'Fittizio', '19700505');

	INSERT INTO dbo.Inventory (ItemId, ItemDescription, StockQuantity)
	VALUES
			(10, 'Articolo inesistente', 5),
			(20, 'Non esiste', 1000),
			(30, 'Non arriverà mai', 5000);

	DECLARE @TotalAmount decimal(18, 3) = 8100;
	INSERT INTO dbo.Orders (OrderId, OrderDate, TotalAmount, CustomerId, OrderNumber)
	VALUES
			(1000, '20161007', @TotalAmount, 1, 'OR0001')

	INSERT INTO dbo.OrderDetails (OrderDetailId, OrderId, ItemId, ItemQuantity, ItemPrice)
	VALUES
			(10000, 1000, 10, 1, 100.00),
			(10001, 1000, 20, 10, 50.00),
			(10002, 1000, 30, 100, 75.00);
  
	-- Act
	DECLARE @Results table
    (
		  OrderDate datetime
		, OrderNumber varchar(10)
		, TotalAmount decimal(18, 4)
		, ItemDescription varchar(50)
		, ItemQuantity decimal(18, 3)
		, ItemPrice decimal(18, 3)
		, FirstName varchar(30)
		, LastName varchar(30)
	);

	-- execute the customer procedure and store the result into the @Results table
	INSERT INTO @Results (OrderDate, OrderNumber, TotalAmount, ItemDescription, ItemQuantity, ItemPrice, FirstName, LastName)
		EXEC dbo.proc_Orders_ListWithTotals
		    @CustomerId = 1;
	
	-- store the number of record into a temp variable
	DECLARE @TotalSumAmount decimal(18, 3);
	SELECT @TotalSumAmount = SUM(ItemPrice * ItemQuantity) FROM @Results;
	
	-- Assert
	EXEC tSQLt.AssertEquals
	    @Expected = @TotalAmount
	  , @Actual = @TotalSumAmount
	  , @Message = N'The order total amount is different than the sum of amounts in the details!';
	

END;
GO
