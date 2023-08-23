CREATE PROCEDURE testScalarFunctions.[test_dbo.getCalTypeById]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(caltype VARCHAR(12));

	EXEC tSQLt.FakeTable 'dbo', 'CalType';
	INSERT INTO [dbo].[CalType] ([Id]
      ,[Name]) VALUES (1
	  ,'EXTERNAL');
	INSERT INTO [dbo].[CalType] ([Id]
	  ,[Name]) VALUES (2
	  ,'ADDITION');
	INSERT INTO [dbo].[CalType] ([Id]
	  ,[Name]) VALUES (3
	  ,'MSA');

	INSERT INTO actual VALUES([dbo].[getCalTypeById](3));
	INSERT INTO actual VALUES([dbo].[getCalTypeById](2));
	INSERT INTO actual VALUES([dbo].[getCalTypeById](1));

	CREATE TABLE expected(caltype VARCHAR(12));
	INSERT INTO expected VALUES ('MSA');
	INSERT INTO expected VALUES ('ADDITION');
	INSERT INTO expected VALUES ('EXTERNAL');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';