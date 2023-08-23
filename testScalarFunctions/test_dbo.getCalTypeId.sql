ALTER PROCEDURE testScalarFunctions.[test_dbo.getCalTypeId]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(Ids TINYINT);
	CREATE TABLE expected(Ids TINYINT);

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

	INSERT INTO actual VALUES([dbo].[getCalTypeId]('0302', 'EXTERNAL'));
	INSERT INTO actual VALUES([dbo].[getCalTypeId]('0302', 'ADDITION'));
	INSERT INTO actual VALUES([dbo].[getCalTypeId]('0302', 'MSA'));

	INSERT INTO expected VALUES(1);
	INSERT INTO expected VALUES(2);
	INSERT INTO expected VALUES(3);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';