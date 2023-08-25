ALTER PROCEDURE testScalarFunctions.[test_dbo.select_ConvertedUnit]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(result VARCHAR(10));
	CREATE TABLE expected(result VARCHAR(10));
	DECLARE @unit VARCHAR(10);	SET @unit = 'ppt';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'ug/L';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'ug/mL';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'ppb';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'ng/L';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'ng/mL';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'ng/g';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'ppm';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'pg/L';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));
	SET @unit = 'pg/mL';
	INSERT INTO actual VALUES ([dbo].[select_ConvertedUnit](@unit));

	INSERT INTO expected VALUES('ppt');
	INSERT INTO expected VALUES('ppt');
	INSERT INTO expected VALUES('ppt');
	INSERT INTO expected VALUES('ppb');
	INSERT INTO expected VALUES('ppb');
	INSERT INTO expected VALUES('ppb');
	INSERT INTO expected VALUES('ppb');
	INSERT INTO expected VALUES('ppm');
	INSERT INTO expected VALUES('ppm');
	INSERT INTO expected VALUES('ppm');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';