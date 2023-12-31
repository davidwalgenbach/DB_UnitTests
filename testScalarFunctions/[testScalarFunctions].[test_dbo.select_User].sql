USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.select_User]    Script Date: 8/29/2023 10:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.select_User]
AS
BEGIN
	DECLARE @actual	VARCHAR(50);	
	DECLARE @expected	VARCHAR(50);	SET @expected = 'ESI\Testing';
	DECLARE @userdevice		VARCHAR(4);	SET @userdevice = '0303';

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
	  ,3
	  ,3
	  ,'08/29/2023 09:29:56')

	SET @actual = [dbo].[select_User](@userdevice);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
