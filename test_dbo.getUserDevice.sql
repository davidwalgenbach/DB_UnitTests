CREATE PROCEDURE testScalarFunctions.[test_dbo.getUserDevice]
AS
BEGIN
	DECLARE @actual		VARCHAR(4);
	DECLARE @expected	VARCHAR(4);	SET @expected = '0303';
	DECLARE @userId		TINYINT;	SET @userId = 3;
	DECLARE @deviceId	TINYINT;	SET @deviceId = 3;

	SET @actual = [dbo].[getUserDevice](@userId, @deviceId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';