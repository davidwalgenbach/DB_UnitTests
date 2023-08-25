CREATE PROCEDURE testScalarFunctions.[test_dbo.getValvePosition]
AS
BEGIN
	DECLARE @actual		VARCHAR(2);
	DECLARE @expected	VARCHAR(2);	SET @expected = '5';
	DECLARE @userdevice VARCHAR(4);	SET @userdevice = '0303';
	DECLARE @calId		TINYINT;	SET @calID = 1;
	DECLARE @groupId	TINYINT;	SET @groupID = 1;

	EXEC tSQLt.FakeTable 'dbo', 'GroupDetails';
	INSERT INTO [dbo].[GroupDetails] ([Id]
      ,[DeviceId]
      ,[CalId]
      ,[GroupId]
      ,[ValvePosition]) VALUES (1
	  ,'03'
	  ,1
	  ,1
	  ,'5');

	SET @actual = [dbo].[getValvePosition](@userdevice, @calId, @groupId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';