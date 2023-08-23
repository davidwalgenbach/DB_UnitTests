ALTER PROCEDURE testScalarFunctions.[test_dbo.getNumeric]
AS
BEGIN
	DECLARE @actual VARCHAR(256);
	DECLARE @expected VARCHAR(256);	SET @expected = '123214321';
	DECLARE @strAlphaNumeric VARCHAR(256);	SET @strAlphaNumeric = '123214TESTING_?><-+.AVD321';

	SET @actual = [dbo].[getNumeric](@strAlphaNumeric);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';