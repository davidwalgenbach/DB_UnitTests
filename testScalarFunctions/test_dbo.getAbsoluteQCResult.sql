ALTER PROCEDURE testScalarFunctions.[test_dbo.getAbsoluteQCResult]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(results VARCHAR(5));
	DECLARE @avalue VARCHAR(24);	SET @avalue = '0.0321';
	DECLARE @minlimit VARCHAR(24);	SET @minlimit = '0.025';
	DECLARE @maxlimit VARCHAR(24);	SET @maxlimit = '0.041';

	--Pass
	INSERT INTO actual VALUES([dbo].[getAbsoluteQCResult](@avalue, @minlimit, @maxlimit));

	SET @avalue = 'NaN';
	SET @minlimit = '1';
	SET @maxlimit = '5';

	--Over
	INSERT INTO actual VALUES([dbo].[getAbsoluteQCResult](@avalue, @minlimit, @maxlimit));

	SET @avalue = '0.00214';
	SET @minlimit = '0.001';
	SET @maxlimit = '0.002';

	--Under
	INSERT INTO actual VALUES([dbo].[getAbsoluteQCResult](@avalue, @minlimit, @maxlimit));

	CREATE TABLE expected(results VARCHAR(5));

	INSERT INTO expected VALUES('Pass')
	INSERT INTO expected VALUES('Over')
	INSERT INTO expected VALUES('Under')

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;
GO

EXEC tSQLt.Run 'testScalarFunctions'