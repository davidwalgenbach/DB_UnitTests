CREATE PROCEDURE testScalarFunctions.[test_dbo.getRackVial]
AS
BEGIN
	DECLARE @actual VARCHAR(4);
	DECLARE @expected VARCHAR(4);	SET @expected = '0110';
	DECLARE @rack	VARCHAR(2);		SET @rack = '1';
	DECLARE @vial	VARCHAR(2);		SET @vial = '10';

	SET @actual = [dbo].[getRackVial](@rack, @vial);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';