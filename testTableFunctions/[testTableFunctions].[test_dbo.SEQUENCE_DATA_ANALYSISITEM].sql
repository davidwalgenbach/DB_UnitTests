ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_ANALYSISITEM]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @userdevice VARCHAR(4);	SET @userdevice = '0303';

	CREATE TABLE expected ([Id] INT
	,[UserDevice] VARCHAR(4)
	,[User] VARCHAR(50)
	,[Instrument] VARCHAR(20)
	,[RunType] VARCHAR(50)
	,[Protocol] VARCHAR(30)
	,[CalType] VARCHAR(50)
	,[Calibration] VARCHAR(100)
	,[AnalysisStd] VARCHAR(12)
	,[Analysis] VARCHAR(12)
	,[Status] VARCHAR(20)
	,[Description] VARCHAR(50)
	,[DateTime] VARCHAR(20)
	,[Alias] VARCHAR(20)
	,[Note] VARCHAR(20)
	,[AnalysisAlias] VARCHAR(20));

	CREATE TABLE actual ([Id] INT
	,[UserDevice] VARCHAR(4)

	,[User] VARCHAR(50)
	,[Instrument] VARCHAR(20)
	,[RunType] VARCHAR(50)
	,[Protocol] VARCHAR(30)
	,[CalType] VARCHAR(50)
	,[Calibration] VARCHAR(100)
	,[AnalysisStd] VARCHAR(12)
	,[Analysis] VARCHAR(12)
	,[Status] VARCHAR(20)
	,[Description] VARCHAR(50)
	,[DateTime] VARCHAR(20)
	,[Alias] VARCHAR(20)
	,[Note] VARCHAR(20)
	,[AnalysisAlias] VARCHAR(20));

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_DATA';
	INSERT INTO [dbo].[SEQUENCE_DATA] ([Id]
      ,[UserDevice]
      ,[User]
      ,[Instrument]
      ,[RunType]
      ,[Status]
      ,[CalType]
      ,[CalId]
      ,[Calibration]
      ,[Analysis]
      ,[AnalysisStd]
      ,[Index]
      ,[SequenceId]
      ,[DateTime]
      ,[Description]
      ,[SolutionType]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[StdId]
      ,[SampleType]
      ,[Priority]
      ,[Blank]
      ,[Wash]
      ,[Repetition]
      ,[RepNum]
      ,[StdBlank]
      ,[StdWash]
      ,[FastMethod]
      ,[SampleMethod]
      ,[DilutionFactor]
      ,[SequenceWash]
      ,[SampleTypeWash]
      ,[BatchFile]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[Replicate1]
      ,[Replicate2]
      ,[Replicate3]
      ,[MeanValue]
      ,[RSD]
      ,[Concentration]
      ,[Slope]
      ,[Intercept]
      ,[RS2]) VALUES (1
	  ,'0303'
	  ,'ESI\Testing'
	  ,1
	  ,'SC'
	  ,3
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,'083023094432'
	  ,''
	  ,1
	  ,'imasequenceID'
	  ,'08/30/2023 09:55:03'
	  ,'Std-0'
	  ,'CalBlank'
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,1
	  ,'Testing'
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,'S5_VL_D1.fast'
	  ,''
	  ,1
	  ,0
	  ,0
	  ,''
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0');
	INSERT INTO [dbo].[SEQUENCE_DATA] ([Id]
      ,[UserDevice]
      ,[User]
      ,[Instrument]
      ,[RunType]
      ,[Status]
      ,[CalType]
      ,[CalId]
      ,[Calibration]
      ,[Analysis]
      ,[AnalysisStd]
      ,[Index]
      ,[SequenceId]
      ,[DateTime]
      ,[Description]
      ,[SolutionType]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[StdId]
      ,[SampleType]
      ,[Priority]
      ,[Blank]
      ,[Wash]
      ,[Repetition]
      ,[RepNum]
      ,[StdBlank]
      ,[StdWash]
      ,[FastMethod]
      ,[SampleMethod]
      ,[DilutionFactor]
      ,[SequenceWash]
      ,[SampleTypeWash]
      ,[BatchFile]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[Replicate1]
      ,[Replicate2]
      ,[Replicate3]
      ,[MeanValue]
      ,[RSD]
      ,[Concentration]
      ,[Slope]
      ,[Intercept]
      ,[RS2]) VALUES (2
	  ,'0303'
	  ,'ESI\Testing'
	  ,1
	  ,'SC'
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,'083023094432'
	  ,''
	  ,2
	  ,'imasequenceID'
	  ,'08/30/2023 10:03:25'
	  ,'Std-1'
	  ,'CalStandard'
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,1
	  ,'Testing'
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,'S5_VL_D1.fast'
	  ,''
	  ,1
	  ,0
	  ,0
	  ,''
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'123'
	  ,'122'
	  ,'113'
	  ,'118'
	  ,'0.9997'
	  ,'2.414'
	  ,'1.847'
	  ,'12.3'
	  ,'0.99847');

	EXEC tSQLt.FakeTable 'dbo', 'Protocol';
	INSERT INTO [dbo].[Protocol] ([Id]
      ,[Name]
      ,[CalId]
      ,[Prefix]
      ,[TypeId]) VALUES (1
	  ,'Testing_Proto'
	  ,1
	  ,''
	  ,0);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_DATA_ANALYSISITEM](@userdevice);

	INSERT INTO expected ([Id]
	,[UserDevice]
	,[User]
	,[Instrument]
	,[RunType]
	,[Protocol]
	,[CalType]
	,[Calibration]
	,[AnalysisStd]
	,[Analysis]
	,[Status]
	,[Description]
	,[DateTime]
	,[Alias]
	,[Note]
	,[AnalysisAlias]) VALUES (1
	,'0303'
	,'ESI\Testing'
	,'Agilent'
	,'SC'
	,'Testing_Proto'
	,'E'
	,'Testing_Cal'
	,''
	,'083023094432'
	,'Complete'
	,''
	,'08/30/2023 09:55:03'
	,''
	,''
	,'');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';