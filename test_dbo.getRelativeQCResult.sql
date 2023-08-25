CREATE PROCEDURE testScalarFunctions.[test_dbo.getRelativeQCResult]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(results VARCHAR(5));
	CREATE TABLE expected(results VARCHAR(5));
	DECLARE @dvalue VARCHAR(24);	SET @dvalue = '1';
	DECLARE @evalue VARCHAR(24);	SET @evalue = '5';
	DECLARE @rmin	VARCHAR(24);	SET @rmin = '15';
	DECLARE @rmax	VARCHAR(24);	SET @rmax = '80';

	--Has min/max limit. Pass.
	INSERT INTO actual VALUES([dbo].[getRelativeQCResult](@dvalue, @evalue, @rmin, @rmax));
	--Has min/max limit. Over.
	SET @rmin = '0';
	SET @rmax = '15';
	INSERT INTO actual VALUES([dbo].[getRelativeQCResult](@dvalue, @evalue, @rmin, @rmax));
	--Has min/max limit. Under.
	SET @rmin = '35';
	SET @rmax = '110';
	INSERT INTO actual VALUES([dbo].[getRelativeQCResult](@dvalue, @evalue, @rmin, @rmax));
	--Has min limit. Pass.
	SET @rmin = '15';
	SET @rmax = '';
	INSERT INTO actual VALUES([dbo].[getRelativeQCResult](@dvalue, @evalue, @rmin, @rmax));
	--Has min limit. Under.
	SET @rmin = '50';
	SET @rmax = '';
	INSERT INTO actual VALUES([dbo].[getRelativeQCResult](@dvalue, @evalue, @rmin, @rmax));
	--Has max limit. Pass.
	SET @rmin = '';
	SET @rmax = '80';
	INSERT INTO actual VALUES([dbo].[getRelativeQCResult](@dvalue, @evalue, @rmin, @rmax));
	--Has max limit. Over.
	SET @rmin = '';
	SET @rmax = '15';
	INSERT INTO actual VALUES([dbo].[getRelativeQCResult](@dvalue, @evalue, @rmin, @rmax));

	--Has min/max limit. Pass.
	INSERT INTO expected VALUES('Pass');
	--Has min/max limit. Over.
	INSERT INTO expected VALUES('Over');
	--Has min/max limit. Under.
	INSERT INTO expected VALUES('Under');
	--Has min limit. Pass.
	INSERT INTO expected VALUES('Pass');
	--Has min limit. Under.
	INSERT INTO expected VALUES('Under');
	--Has max limit. Pass.
	INSERT INTO expected VALUES('Pass');
	--Has max limit. Over.
	INSERT INTO expected VALUES('Over');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';