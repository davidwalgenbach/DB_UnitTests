USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getStdDF]    Script Date: 8/29/2023 10:26:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getStdDF]
AS
BEGIN
	DECLARE @actual			VARCHAR(10);
	DECLARE @expected		VARCHAR(10);	SET @expected = '20';
	DECLARE @sampletypeId	INT;			SET @sampletypeId = 1;
	DECLARE @std			TINYINT;		SET @std = 3;
	DECLARE @stdStock		VARCHAR(10);	SET @stdStock = '500';
	DECLARE @stdval			VARCHAR(4);		SET @stdval = '25';

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
	  ,'VL'
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

	SET @actual = [dbo].[getStdDF](@sampletypeId, @std, @stdStock, @stdval);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
