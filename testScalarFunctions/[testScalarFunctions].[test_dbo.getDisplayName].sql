USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getDisplayName]    Script Date: 8/29/2023 10:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getDisplayName]
AS
BEGIN
	DECLARE @actual VARCHAR(50);
	DECLARE @expected VARCHAR(50);	SET @expected = 'Testing';
	DECLARE @hostname VARCHAR(50);	SET @hostname = 'W-W10-Testing';

	EXEC tSQLt.FakeTable 'dbo', 'User';
	INSERT INTO [dbo].[User] ([Id]
      ,[LoginName]
      ,[DisplayName]
      ,[HostName]
      ,[SampleTRAX]
      ,[DataManager]
      ,[LoginTime]) VALUES (1
	  ,'ESI\Testing'
	  ,'Testing'
	  ,'W-W10-Testing'
	  ,24
	  ,24
	  ,'08/20/23 13:14:56');

	SET @actual = dbo.getDisplayName(@hostname);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
