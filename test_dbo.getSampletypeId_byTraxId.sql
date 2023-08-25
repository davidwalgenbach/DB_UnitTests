ALTER PROCEDURE testScalarFunctions.[test_dbo.getSampletypeId_byTraxId]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(results TINYINT);
	CREATE TABLE expected(results TINYINT);
	DECLARE @traxId		VARCHAR(30);	SET @traxId = 'ESIQA01234';

	INSERT INTO expected VALUES(35);
	INSERT INTO expected VALUES(0);

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
      ,[Comments]) VALUES(1
	  ,35
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

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_LIST_2';
	INSERT INTO [dbo].[SEQUENCE_LIST_2] ([Id]
      ,[UserDevice]
      ,[CalType]
      ,[RowType]
      ,[SeqNum]
      ,[Index]
      ,[RepNum]
      ,[Status]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[Description]
      ,[BarCode]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[Calibration]
      ,[CalId]
      ,[SyringeGroup]
      ,[Unit]
      ,[FastMethod]
      ,[FastDF]
      ,[Analysis]
      ,[AnalysisStd]
      ,[SequenceId]
      ,[DateTime]
      ,[ProtocolId]
      ,[ReqType]
      ,[Line]
      ,[Material]
      ,[SamplingPoint]
      ,[Note1]
      ,[Note2]) VALUES(1
	  ,'0303'
	  ,'EXTERNAL'
	  ,'Sample'
	  ,1
	  ,6
	  ,0
	  ,0
	  ,'ESIQA01234'
	  ,'1'
	  ,'4'
	  ,'ESIQA01234'
	  ,''
	  ,'Testing'
	  ,35
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,1
	  ,'ppq'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'082123160918'
	  ,''
	  ,'75569F05-EB82-4334-97FC-C334147E46D5'
	  ,'08/24/2023 13:33:05'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	EXEC tSQLt.FakeTable 'dbo', 'BottleDetails';
	INSERT INTO [dbo].[BottleDetails] ([Id]
      ,[UserId]
      ,[User]
      ,[TraxId]
      ,[Status]
      ,[SampleTypeId]
      ,[SampleType]
      ,[ProtocolId]
      ,[SequenceId]
      ,[Analysis]
      ,[DateTime]) VALUES(1
	  ,'03'
	  ,'ESI\Testing'
	  ,'ESIQA01234'
	  ,1
	  ,35
	  ,'Testing'
	  ,1
	  ,'75569F05-EB82-4334-97FC-C334147E46D5'
	  ,'082123160918'
	  ,'08/24/2023 13:33:05');

	INSERT INTO actual VALUES([dbo].[getSampletypeId_byTraxId](@traxId));

	UPDATE [dbo].[SampleTypeDATA] SET SampleTypeId = 0 WHERE Id = 1;
	UPDATE [dbo].[SEQUENCE_LIST_2] SET SampleTypeId = 0 WHERE Id = 1;

	INSERT INTO actual VALUES([dbo].[getSampleTypeId_byTraxId](@traxId));

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';