USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getPriority]    Script Date: 8/29/2023 10:22:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getPriority]
AS
BEGIN
	DECLARE @actual	TINYINT;
	DECLARE @expected	TINYINT;	SET @expected = 7;
	DECLARE @sampletypeId	TINYINT;	SET @sampletypeId = 1;

	EXEC tSQLt.FakeTable 'dbo', 'SampleTypeDATA';
	INSERT INTO [dbo].[SampleTypeDATA] ([Id]
      ,[SampleTypeId]
      ,[SampleType]
      ,[CalType]
      ,[CalId]
      ,[StdId]
      ,[AcidSpk]
      ,[AcidSoln]
      ,[ProtocolId]
      ,[QCRuleId]
      ,[SampleMethod]
      ,[SampleDF]
      ,[WashMethod]
      ,[Priority]
      ,[StdBlank]
      ,[SampleBlank]
      ,[StdWash]
      ,[StdWashMethod]
      ,[SampleWash]
      ,[SampleWashMethod]
      ,[Repetition]
      ,[LoopSize]
      ,[LoadingType]
      ,[MethodSet]
      ,[PrepMethod]
      ,[PrepDF]
      ,[RouteId]
      ,[Rack1]
      ,[Rack2]
      ,[Rack3]
      ,[Rack4]
      ,[TargetWeight]
      ,[MinWeight]
      ,[MaxWeight]
      ,[Weight]
      ,[DailyDose]
      ,[Comments]) VALUES (1
	  ,1
	  ,'Testing'
	  ,'EXTERNAL'
	  ,1
	  ,1
	  ,1
	  ,1
	  ,3
	  ,0
	  ,''
	  ,1
	  ,''
	  ,7
	  ,0
	  ,0
	  ,0
	  ,''
	  ,0
	  ,''
	  ,0
	  ,15
	  ,'SA'
	  ,'D1'
	  ,''
	  ,''
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	SET @actual = [dbo].[getPriority](@sampletypeId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
