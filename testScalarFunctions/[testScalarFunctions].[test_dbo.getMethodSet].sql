USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getMethodSet]    Script Date: 8/29/2023 10:21:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getMethodSet]
AS
BEGIN
	DECLARE @actual VARCHAR(3);
	DECLARE @expected VARCHAR(3);	SET @expected = 'D1';
	DECLARE @sampletypeId TINYINT;	SET @sampletypeId = 1;

	EXEC tSQLt.FakeTable 'dbo', 'SampleTypeDATA'
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
	  ,1
	  ,0
	  ,''
	  ,1
	  ,''
	  ,0
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

	SET @actual = [dbo].[getMethodSet](@sampletypeId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
