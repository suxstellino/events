USE GLVOnAir2019_02;
GO

IF OBJECT_ID('dbo.udf_GenerateSessionCode') IS NOT NULL
	DROP FUNCTION dbo.udf_GenerateSessionCode;
GO
CREATE FUNCTION dbo.udf_GenerateSessionCode
(
	  @SpeakerId int
	, @SessionId int
	, @EventCode char(3)
)
RETURNS char(8)
AS
BEGIN
    
	DECLARE @SessionCode char(8) = 
		@EventCode +
		RIGHT('00' + CAST(@SpeakerId AS varchar(2)), 2) + 
		'-'	+ 
		RIGHT('00' + CAST(@SessionId AS varchar(2)), 2);

	RETURN @SessionCode;
END