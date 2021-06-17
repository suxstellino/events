SET NOCOUNT ON;
GO
USE SQLSatParmaCD;
GO

EXEC tsqlt.NewClass 'UnitTests';
GO

-- Unit test
CREATE PROCEDURE UnitTests.[test ]
AS
BEGIN

    EXEC tsqlt.Fail 'Fail';

END;