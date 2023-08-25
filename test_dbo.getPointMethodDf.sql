CREATE PROCEDURE testScalarFunctions.[test_dbo.getPointMethodDF]
AS
BEGIN
	DECLARE @actual VARCHAR(10);
	DECLARE @expected VARCHAR(10);	SET @expected = '0.8100';
	DECLARE @acidval INT			SET @acidval = 1;
	DECLARE @stdval	VARCHAR(4)		SET @stdval = '50';
	DECLARE @ppt	INT				SET @ppt = 500;
	DECLARE @scdf	VARCHAR(10)		SET @scdf = '1';

	SET @actual = [dbo].[getPointMethodDf](@acidval, @stdval, @ppt, @scdf);
	
	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';