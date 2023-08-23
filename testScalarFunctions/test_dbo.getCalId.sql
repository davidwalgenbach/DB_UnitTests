CREATE PROCEDURE testScalarFunctions.[test_dbo.getCalId]
AS
BEGIN
	DECLARE @expected TINYINT;	SET @expected = 4;
	DECLARE @actual TINYINT;
	DECLARE @sampletype VARCHAR(30);	SET @sampletype = 'Testing';

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
	  ,4
	  ,1
	  ,'1'
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
	  ,''
	  ,0
	  ,''
	  ,0
	  ,'15'
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
	  ,'')

	EXEC tSQLt.FakeTable 'dbo', 'SampleType';
	INSERT INTO [dbo].[SampleType] ([Id]
      ,[Name]
      ,[TypeId]
      ,[EnableNano]
      ,[EnablePrepMass]) VALUES (1
	  ,'Testing'
	  ,'1'
	  ,0
	  ,0)

	  SET @actual = [dbo].[getCalId](@sampletype)

	  EXEC tSQLt.AssertEquals @expected, @actual;

END;
GO

EXEC tSQLt.Run 'testScalarFunctions';
