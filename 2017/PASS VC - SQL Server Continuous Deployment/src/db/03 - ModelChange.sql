SET NOCOUNT ON;
GO
USE DemoPassVC2016CD;
GO

-- dbo.Inventory table
CREATE TABLE dbo.ItemCategories
(
	  ItemCategoryId int NOT NULL PRIMARY KEY CLUSTERED
	, ItemCategoryDescription varchar(50) NOT NULL
);
GO

INSERT INTO dbo.ItemCategories (ItemCategoryId, ItemCategoryDescription)
VALUES
        (1, 'Cancelleria'),
		(2, 'Sport e tempo libero'),
		(3, 'Licenze'),
		(4, 'Elettrodomestici');
GO

ALTER TABLE dbo.Inventory ADD ItemCategoryId int NULL;
GO

UPDATE dbo.Inventory 
SET ItemCategoryId = 1
WHERE ItemId in (20, 30);
GO

UPDATE dbo.Inventory 
SET ItemCategoryId = 2
WHERE ItemId = 10;
GO

UPDATE dbo.Inventory 
SET ItemCategoryId = 3
WHERE ItemId = 50;
GO

UPDATE dbo.Inventory 
SET ItemCategoryId = 4
WHERE ItemId = 40;
GO

ALTER TABLE dbo.Inventory ALTER COLUMN ItemCategoryId int NOT NULL;
GO