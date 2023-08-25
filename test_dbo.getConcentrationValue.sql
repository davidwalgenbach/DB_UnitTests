CREATE PROCEDURE testScalarFunctions.[test_dbo.getConcentrationValue]
AS
BEGIN
	DECLARE @actual VARCHAR(24);
	DECLARE @meanvalue VARCHAR(24); SET @meanvalue = '325.34';
	DECLARE @intercept VARCHAR(24); SET @intercept = '123.2';
	DECLARE @slope VARCHAR(24); SET @slope = '53.23';
	DECLARE @expected VARCHAR(24); SET @expected = 3.797483;

	SET @actual = dbo.getConcentrationValue(@meanvalue, @intercept, @slope);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions'