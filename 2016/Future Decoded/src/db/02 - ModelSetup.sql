SET NOCOUNT ON;
GO
USE DemoFutureDecoded2016;
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('dbo.OrderDetails'))
	DROP TABLE dbo.OrderDetails;
GO
IF EXISTS(SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('dbo.Orders'))
	DROP TABLE dbo.Orders;
GO
IF EXISTS(SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('dbo.Inventory'))
	DROP TABLE dbo.Inventory;
GO
IF EXISTS(SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('dbo.Customers'))
	DROP TABLE dbo.Customers;
GO

-- dbo.Inventory table
CREATE TABLE dbo.Inventory
(
	  ItemId int NOT NULL PRIMARY KEY CLUSTERED
	, ItemDescription varchar(50) NOT NULL
	, StockQuantity decimal(18, 3) NOT NULL
);
GO

-- dbo.Customers table
CREATE TABLE dbo.Customers
(
	  CustomerId int NOT NULL PRIMARY KEY CLUSTERED
	, FirstName varchar(30) NOT NULL
	, LastName varchar(30) NOT NULL
	, BirthDate datetime NOT NULL
);
GO

-- dbo.OrderDetails table
CREATE TABLE dbo.OrderDetails
(
	  OrderDetailId int NOT NULL PRIMARY KEY CLUSTERED
	, OrderId int NOT NULL
	, ItemId int NOT NULL
	, ItemQuantity decimal(18, 3) NOT NULL
	, ItemPrice decimal(18, 3) NOT NULL
);
GO

-- dbo.Orders table
CREATE TABLE dbo.Orders
(
	  OrderId int NOT NULL PRIMARY KEY CLUSTERED
	, OrderDate datetime NOT NULL
	, OrderNumber varchar(10) NOT NULL
	, TotalAmount decimal(18, 4) NOT NULL
	, CustomerId int NOT NULL
);
GO

-- FKs
ALTER TABLE dbo.Orders 
ADD CONSTRAINT FK_Customers_Orders FOREIGN KEY (CustomerId) 
REFERENCES dbo.Customers (CustomerId);
GO

ALTER TABLE dbo.OrderDetails 
ADD CONSTRAINT FK_Orders_OrderDetails FOREIGN KEY (OrderId) 
REFERENCES dbo.Orders (OrderId);
GO

ALTER TABLE dbo.OrderDetails 
ADD CONSTRAINT FK_Inventory_OrderDetails FOREIGN KEY (ItemId) 
REFERENCES dbo.Inventory (ItemId);
GO

INSERT INTO dbo.Customers (CustomerId, FirstName, LastName, BirthDate)
VALUES
        (1, 'Andrea', 'Ferrari', '19700505'),
		(2, 'Alessandro', 'Alpi', '19810422'),
		(3, 'Fabio', 'Zanella', '19780707');
GO

INSERT INTO dbo.Inventory (ItemId, ItemDescription, StockQuantity)
VALUES
        (10, 'Bicicletta BMX', 5),
		(20, 'Post-it gialli', 1000),
		(30, 'Penne BIC', 5000),
		(40, 'Frigorifero compatto', 100),
		(50, 'Abbonamento streaming', 200);
GO

INSERT INTO dbo.Orders (OrderId, OrderDate, TotalAmount, CustomerId, OrderNumber)
VALUES
        (1000, '20160101', 123.50, 1, 'OR0001'),
		(1001, '20160101', 123.50, 1, 'OR0002'),
		(1002, '20160101', 123.50, 1, 'OR0003'),
		(1003, '20160101', 123.50, 2, 'OR0004');
GO

INSERT INTO dbo.OrderDetails (OrderDetailId, OrderId, ItemId, ItemQuantity, ItemPrice)
VALUES
        (10000, 1000, 10, 1, 1000.00),
		(10001, 1000, 20, 10, 1.00),
		(10002, 1000, 30, 100, 0.30),
		(10003, 1001, 40, 1, 500.00),
		(10004, 1001, 50, 1, 9.99),
		(10005, 1002, 10, 1, 1000.00),
		(10006, 1003, 50, 2, 9.99);
GO

IF OBJECT_ID('dbo.proc_Orders_ListWithTotals') IS NULL 
	EXEC ('CREATE PROCEDURE dbo.proc_Orders_ListWithTotals AS RETURN 0;');
GO

ALTER PROCEDURE dbo.proc_Orders_ListWithTotals
	@CustomerId int
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT
		  O.OrderDate
		, O.OrderNumber
		, O.TotalAmount
		, I.ItemDescription
		, D.ItemQuantity
		, D.ItemPrice
		, C.FirstName
		, C.LastName
	FROM
		dbo.Orders				O
		JOIN dbo.OrderDetails	D	ON O.OrderId = D.OrderId
		JOIN dbo.Inventory		I	ON D.ItemId = I.ItemId
		JOIN dbo.Customers		C	ON O.CustomerId = C.CustomerId
	WHERE
		O.CustomerId = @CustomerId;

END;
GO
