USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.select_StdSId]    Script Date: 8/29/2023 10:32:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.select_StdSId]
AS
BEGIN
	DECLARE @actual	VARCHAR(50);	
	DECLARE @expected VARCHAR(50);	SET @expected = '3';
	DECLARE @calId	TINYINT;	SET @calId = 1;
	DECLARE @groupId	TINYINT;	SET @groupId = 1;

	EXEC tSQLt.FakeTable 'dbo', 'CalDATA';
	INSERT INTO [dbo].[CalDATA] ([Id]
      ,[CalId]
      ,[ProtocolId]
      ,[GroupId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[StdId]
      ,[Unit]
      ,[Stock]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (1
	  ,1
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,'3'
	  ,'ppq'
	  ,'150'
	  ,''
	  ,'5'
	  ,'15'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	SET @actual = [dbo].[select_StdSId](@calId, @groupId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
