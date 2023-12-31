USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getAcidVal]    Script Date: 8/29/2023 10:15:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getAcidVal]
AS
BEGIN
	DECLARE @expected VARCHAR(3); SET @expected = '120';
	DECLARE @actual VARCHAR(3);
	DECLARE @sampletypeId TINYINT; SET @sampletypeId = 8;

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
	  ,8
	  ,'Testing'
	  ,'EXTERNAL'
	  ,1
	  ,1
	  ,'5'
	  ,'120'
	  ,1
	  ,0
	  ,''
	  ,1
	  ,''
	  ,0
	  ,0
	  ,0
	  ,0
	  ,'S5_Wash_3mL_1x_1min.fast'
	  ,0
	  ,'S5_Wash_3mL_1x_1min.fast'
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

	  SELECT @actual = dbo.getAcidVal(@sampletypeId);

	  EXEC tSQLt.AssertEquals @expected, @actual;
END;
