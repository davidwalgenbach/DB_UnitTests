CREATE PROCEDURE testScalarFunctions.[test_dbo.getOutOfRangeValue]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(result VARCHAR(10));
	CREATE TABLE expected(result VARCHAR(10));

	DECLARE @dvalue VARCHAR(24);	SET @dvalue = '2';
	DECLARE @evalue VARCHAR(24);	SET @evalue = '17';
	DECLARE @rmin VARCHAR(24);		SET @rmin = '80';
	DECLARE @rmax VARCHAR(24);		SET @rmax = '120';

	INSERT INTO actual VALUES ([dbo].[getOutOfRangeValue](@dvalue, @evalue, @rmin, @rmax));

	INSERT INTO expected VALUES ('11.7647058');

	SET @dvalue = '15';
	SET @evalue = '3.23';
	SET @rmin = '65';
	SET @rmax = '110';

	INSERT INTO actual VALUES ([dbo].[getOutOfRangeValue](@dvalue, @evalue, @rmin, @rmax));

	INSERT INTO expected VALUES ('464.396284');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';