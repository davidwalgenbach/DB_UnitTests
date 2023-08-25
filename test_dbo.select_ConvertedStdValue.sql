ALTER PROCEDURE testScalarFunctions.[test_dbo.select_ConvertedStdValue]
AS
BEGIN
	DECLARE @actual NVARCHAR(20);
	DECLARE @expected NVARCHAR(20);	SET @expected = '100000';
	DECLARE @calId TINYINT;	SET @calId = 1;
	DECLARE @unit	VARCHAR(10);	SET @unit = 'ppb';
	DECLARE @default_unit VARCHAR(10);	SET @default_unit = 'ppt';
	DECLARE @value	NVARCHAR(10);	SET @value = '100';

	SET @actual = [dbo].[select_ConvertedStdValue](@calId, @unit, @default_unit, @value);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';