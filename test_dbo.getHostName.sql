CREATE PROCEDURE testScalarFunctions.[test_dbo.getHostName]
AS
BEGIN
	DECLARE @actual VARCHAR(50);
	DECLARE @expected VARCHAR(50);	SET @expected = 'W-W10-Testing';
	DECLARE @deviceId VARCHAR(50);	SET @deviceId = '3';

	EXEC tSQLt.FakeTable 'dbo', 'UserDeviceSTATUS';
	INSERT INTO [dbo].[UserDeviceSTATUS] ([UserId]
      ,[DeviceId]
      ,[DeviceCode]
      ,[UserDevice]
      ,[LoginName]
      ,[HostName]
      ,[UpdateTime]
      ,[Status]
      ,[Rack]
      ,[Vial]
      ,[Execute]
      ,[RunType]
      ,[CalType]
      ,[Analysis]
      ,[SequenceId]
      ,[Description]
      ,[Params]
      ,[Interrupt]
      ,[LoginTime]) VALUES (3
	  ,3
	  ,''
	  ,'0303'
	  ,'ESI\Testing'
	  ,'W-W10-Testing'
	  ,'08/23/2023 10:55:34'
	  ,0
	  ,''
	  ,''
	  ,0
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'08/15/2023 09:14:23');

	SET @actual = [dbo].[getHostName](@deviceId);
	
	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';