USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.select_QCRule]    Script Date: 8/29/2023 10:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.select_QCRule]
AS
BEGIN
	DECLARE @actual			VARCHAR(30);
	DECLARE @expected		VARCHAR(30);	SET @expected = 'Intensity';
	DECLARE @sampletypeId	TINYINT;		SET @sampletypeId = 1;

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
	  ,1
	  ,''
	  ,1
	  ,''
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
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

	EXEC tSQLt.FakeTable 'dbo', 'QCRule';
	INSERT INTO [dbo].[QCRule] ([Id]
      ,[QCName]
      ,[QCTypeId]
      ,[QCType]
      ,[CalId]
      ,[ICVEnabled]
      ,[CCVEnabled]
      ,[ICVWashEnabled]
      ,[ICVWash]
      ,[ICVStockId]
      ,[ICVBarcode]
      ,[CCVStd]
      ,[CCVFreq]) VALUES (1
	  ,'Intensity'
	  ,1
	  ,'Blank'
	  ,1
	  ,0
	  ,0
	  ,0
	  ,''
	  ,0
	  ,''
	  ,0
	  ,0);

	SET @actual = [dbo].[select_QCRule](@sampletypeId)

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
