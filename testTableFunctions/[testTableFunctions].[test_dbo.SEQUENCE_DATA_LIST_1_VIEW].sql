ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_LIST_1_VIEW]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis VARCHAR(12);	SET @analysis = '083023094432';
	DECLARE @analysisStd	VARCHAR(12);	SET @analysisStd = '';
	DECLARE @sequenceId		VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected ([Id] INT
	,[UserDevice] VARCHAR(4)
	,[CalType] VARCHAR(20)
	,[SeqNum] SMALLINT
	,[Index] INT
	,[Status] SMALLINT
	,[TraxId] VARCHAR(20)
	,[Rack] VARCHAR(2)
	,[Vial] VARCHAR(2)
	,[Description] VARCHAR(50)
	,[SampleType] VARCHAR(50)
	,[SampleTypeId] INT
	,[Priority] TINYINT
	,[Calibration] VARCHAR(50) 
	,[CalId] SMALLINT
	,[Point] TINYINT
	,[Value] VARCHAR(10)
	,[StdId] TINYINT
	,[SyringeGroup] VARCHAR(2)
	,[FastMethod] VARCHAR(50)
	,[FastDF] VARCHAR(10)
	,[Analysis] VARCHAR(12)
	,[AnalysisStd] VARCHAR(12)
	,[SequenceId] VARCHAR(36)
	,[DateTime] VARCHAR(20)
	,[ProtocolId] VARCHAR(20));

	CREATE TABLE actual ([Id] INT
	,[UserDevice] VARCHAR(4)
	,[CalType] VARCHAR(20)
	,[SeqNum] SMALLINT
	,[Index] INT
	,[Status] SMALLINT
	,[TraxId] VARCHAR(20)
	,[Rack] VARCHAR(2)
	,[Vial] VARCHAR(2)
	,[Description] VARCHAR(50)
	,[SampleType] VARCHAR(50)
	,[SampleTypeId] INT
	,[Priority] TINYINT
	,[Calibration] VARCHAR(50) 
	,[CalId] SMALLINT
	,[Point] TINYINT
	,[Value] VARCHAR(10)
	,[StdId] TINYINT
	,[SyringeGroup] VARCHAR(2)
	,[FastMethod] VARCHAR(50)
	,[FastDF] VARCHAR(10)
	,[Analysis] VARCHAR(12)
	,[AnalysisStd] VARCHAR(12)
	,[SequenceId] VARCHAR(36)
	,[DateTime] VARCHAR(20)
	,[ProtocolId] VARCHAR(20));

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

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_DATA_LIST_1_VIEW](@analysis, @analysisStd, @sequenceId);

	INSERT INTO expected([Id]
	,[UserDevice]
	,[CalType]
	,[SeqNum]
	,[Index]
	,[Status]
	,[TraxId]
	,[Rack]
	,[Vial]
	,[Description]
	,[SampleType]
	,[SampleTypeId]
	,[Priority]
	,[Calibration]  
	,[CalId] 
	,[Point] 
	,[Value] 
	,[StdId] 
	,[SyringeGroup]
	,[FastMethod] 
	,[FastDF] 
	,[Analysis] 
	,[AnalysisStd] 
	,[SequenceId] 
	,[DateTime] 
	,[ProtocolId]) VALUES (1
	,'0303'
	,'EXTERNAL'
	,0
	,1
	,3
	,'0101'
	,'R'
	,'2'
	,'Std-0'
	,'Testing'
	,0
	,0
	,'Testing_Cal'
	,1
	,0
	,0
	,0
	,''
	,'S5_VL_D1.fast'
	,1
	,'083023094432'
	,''
	,'imasequenceID'
	,'08/30/2023 09:55:03'
	,1);
	INSERT INTO expected([Id]
	,[UserDevice]
	,[CalType]
	,[SeqNum]
	,[Index]
	,[Status]
	,[TraxId]
	,[Rack]
	,[Vial]
	,[Description]
	,[SampleType]
	,[SampleTypeId]
	,[Priority]
	,[Calibration]  
	,[CalId] 
	,[Point] 
	,[Value] 
	,[StdId] 
	,[SyringeGroup]
	,[FastMethod] 
	,[FastDF] 
	,[Analysis] 
	,[AnalysisStd] 
	,[SequenceId] 
	,[DateTime] 
	,[ProtocolId]) VALUES (2
	,'0303'
	,'EXTERNAL'
	,0
	,2
	,1
	,'0101'
	,'R'
	,'2'
	,'Std-1'
	,'Testing'
	,0
	,0
	,'Testing_Cal'
	,1
	,0
	,0
	,0
	,''
	,'S5_VL_D1.fast'
	,1
	,'083023094432'
	,''
	,'imasequenceID'
	,'08/30/2023 10:03:25'
	,1);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';