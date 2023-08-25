CREATE PROCEDURE testScalarFunctions.[test_dbo.getUser]
AS
BEGIN
	DECLARE @actual VARCHAR(30);	
	DECLARE @expected VARCHAR(30);	SET @expected = 'ESI\Testing';
	DECLARE @userdevice VARCHAR(4);	SET @userdevice = '0303';

	EXEC tSQLt.FakeTable 'dbo', 'User';
	INSERT INTO [dbo].[User] ([Id]
      ,[LoginName]
      ,[DisplayName]
      ,[HostName]
      ,[SampleTRAX]
      ,[DataManager]
      ,[LoginTime]) VALUES (3
	  ,'ESI\Testing'
	  ,'Testing'
	  ,'W-W10-Testing'
	  ,21
	  ,25
	  ,'08/25/2023 10:54:56');

	SET @actual = [dbo].[getUser](@userdevice);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';