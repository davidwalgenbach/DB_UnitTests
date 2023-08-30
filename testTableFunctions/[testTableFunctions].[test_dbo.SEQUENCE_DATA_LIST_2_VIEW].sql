ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_LIST_2_VIEW]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis VARCHAR(12);	SET @analysis = '083023111643';
	DECLARE @analysisStd VARCHAR(12);	SET @analysisStd = '';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected ([Id] INT
	,[UserDevice] VARCHAR(4)
	,[SeqNum] SMALLINT
	,[Status] SMALLINT
	,[Description] VARCHAR(50)
	,[Analysis] VARCHAR(12)
	,[AnalysisStd] VARCHAR(12)
	,[Index] TINYINT
	,[SequenceId] VARCHAR(36)
	,[TraxId] VARCHAR(20)
	,[Rack] VARCHAR(2)
	,[Vial] VARCHAR(2)
	,[SampleType] VARCHAR(50)
	,[SampleTypeId] INT
	,[Priority] TINYINT
	,[CalType] VARCHAR(20)
	,[CalId] SMALLINT
	,[StdId] TINYINT
	,[Std] TINYINT
	,[StdVal] VARCHAR(10)
	,[FastMethod] VARCHAR(50)
	,[FastDF] VARCHAR(10)
	,[ProtocolId] VARCHAR(20)
	,[DateTime] VARCHAR(20));

	CREATE TABLE actual ([Id] INT
	,[UserDevice] VARCHAR(4)
	,[SeqNum] SMALLINT
	,[Status] SMALLINT
	,[Description] VARCHAR(50)
	,[Analysis] VARCHAR(12)
	,[AnalysisStd] VARCHAR(12)
	,[Index] TINYINT
	,[SequenceId] VARCHAR(36)
	,[TraxId] VARCHAR(20)
	,[Rack] VARCHAR(2)
	,[Vial] VARCHAR(2)
	,[SampleType] VARCHAR(50)
	,[SampleTypeId] INT
	,[Priority] TINYINT
	,[CalType] VARCHAR(20)
	,[CalId] SMALLINT
	,[StdId] TINYINT
	,[Std] TINYINT
	,[StdVal] VARCHAR(10)
	,[FastMethod] VARCHAR(50)
	,[FastDF] VARCHAR(10)
	,[ProtocolId] VARCHAR(20)
	,[DateTime] VARCHAR(20));

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_LIST_1';
	INSERT INTO [dbo].[SEQUENCE_LIST_1] ([Id]
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
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[Calibration]
      ,[CalId]
      ,[Point]
      ,[Value]
      ,[StdId]
      ,[SyringeGroup]
      ,[Unit]
      ,[FastMethod]
      ,[FastDF]
      ,[Analysis]
      ,[AnalysisStd]
      ,[SequenceId]
      ,[DateTime]
      ,[ProtocolId]) VALUES (1
	  ,'0303'
	  ,'EXTERNAL'
	  ,'Standard'
	  ,1
	  ,1
	  ,0
	  ,3
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,'Std-0'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,0
	  ,0
	  ,1
	  ,1
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'083023111643'
	  ,''
	  ,'imasequenceID'
	  ,'08/30/2023 11:16:43'
	  ,1);
	INSERT INTO [dbo].[SEQUENCE_LIST_1] ([Id]
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
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[Calibration]
      ,[CalId]
      ,[Point]
      ,[Value]
      ,[StdId]
      ,[SyringeGroup]
      ,[Unit]
      ,[FastMethod]
      ,[FastDF]
      ,[Analysis]
      ,[AnalysisStd]
      ,[SequenceId]
      ,[DateTime]
      ,[ProtocolId]) VALUES (2
	  ,'0303'
	  ,'EXTERNAL'
	  ,'Standard'
	  ,1
	  ,2
	  ,0
	  ,3
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,'Std-1'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,1
	  ,0.5
	  ,1
	  ,2
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'083023111643'
	  ,''
	  ,'imasequenceID'
	  ,'08/30/2023 11:21:43'
	  ,1);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_DATA_LIST_2_VIEW](@analysis, @analysisStd, @sequenceId);

	INSERT INTO expected ([Id]
	,[UserDevice]
	,[SeqNum] 
	,[Status] 
	,[Description] 
	,[Analysis] 
	,[AnalysisStd] 
	,[Index] 
	,[SequenceId] 
	,[TraxId] 
	,[Rack] 
	,[Vial] 
	,[SampleType] 
	,[SampleTypeId] 
	,[Priority] 
	,[CalType] 
	,[CalId] 
	,[StdId] 
	,[Std] 
	,[StdVal] 
	,[FastMethod] 
	,[FastDF] 
	,[ProtocolId] 
	,[DateTime]) VALUES (1
	,'0303'
	,1
	,3
	,'Std-0'
	,'083023111643'
	,''
	,1
	,'imasequenceID'
	,'0101'
	,'R'
	,'2'
	,'Testing'
	,1
	,0
	,'EXTERNAL'
	,1
	,1
	,0
	,0
	,'S5_VL_D1.fast'
	,1
	,1
	,'08/30/2023 11:16:43');

	INSERT INTO expected ([Id]
	,[UserDevice]
	,[SeqNum] 
	,[Status] 
	,[Description] 
	,[Analysis] 
	,[AnalysisStd] 
	,[Index] 
	,[SequenceId] 
	,[TraxId] 
	,[Rack] 
	,[Vial] 
	,[SampleType] 
	,[SampleTypeId] 
	,[Priority] 
	,[CalType] 
	,[CalId] 
	,[StdId] 
	,[Std] 
	,[StdVal] 
	,[FastMethod] 
	,[FastDF] 
	,[ProtocolId] 
	,[DateTime]) VALUES (2
	,'0303'
	,1
	,3
	,'Std-1'
	,'083023111643'
	,''
	,2
	,'imasequenceID'
	,'0101'
	,'R'
	,'2'
	,'Testing'
	,1
	,0
	,'EXTERNAL'
	,1
	,1
	,1
	,0.5
	,'S5_VL_D1.fast'
	,1
	,1
	,'08/30/2023 11:21:43');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';