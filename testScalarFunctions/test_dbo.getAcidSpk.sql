CREATE PROCEDURE testScalarFunctions.[test_dbo.getAcidSpk]
AS
BEGIN
	DECLARE @expected VARCHAR(3); SET @expected = '5';
	DECLARE @actual VARCHAR(3);
	DECLARE @sampletypeId TINYINT; SET @sampletypeId = 1;

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
	  ,'5'
	  ,'1'
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

	  SELECT @actual = dbo.getAcidSpk(@sampletypeId);

	  EXEC tSQLt.AssertEquals @expected, @actual;

END;
GO

EXEC tSQLt.Run 'testScalarFunctions'