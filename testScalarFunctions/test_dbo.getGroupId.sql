ALTER PROCEDURE testScalarFunctions.[test_dbo.getGroupId]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(GroupId VARCHAR(2));
	CREATE TABLE expected(GroupId VARCHAR(2));

	DECLARE @userdevice VARCHAR(4);	SET @userdevice = '0202';
	DECLARE @calId TINYINT;	SET @calId = 1;
	DECLARE @syringegroup TINYINT;	SET @syringegroup = 3;

	EXEC tSQLt.FakeTable 'dbo', 'GroupDetails';
	INSERT INTO [dbo].[GroupDetails] ([Id]
      ,[DeviceId]
      ,[CalId]
      ,[GroupId]
      ,[ValvePosition]) VALUES (1
	  ,'02'
	  ,1
	  ,1
	  ,3);

	INSERT INTO actual VALUES([dbo].[getGroupId](@userdevice, @calId, @syringegroup));
	
	SET @calId = 2;
	SET @syringegroup = 1;

	INSERT INTO actual VALUES([dbo].[getGroupId](@userdevice, @calId, @syringegroup));

	INSERT INTO expected VALUES('1');
	INSERT INTO expected VALUES('0');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';