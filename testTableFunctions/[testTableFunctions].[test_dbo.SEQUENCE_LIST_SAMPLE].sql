ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_SAMPLE]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis		VARCHAR(12);	SET @analysis = 'analysisID';
	DECLARE @analysisStd	VARCHAR(12);	SET @analysisStd = '';
	DECLARE @sequenceId		VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected ([Id]			INT
						,[Status]		SMALLINT
						,Validate		TINYINT
						,RowType		VARCHAR(20)
						,[Description]	VARCHAR(50)
						,[Index]		INT
						,SequenceId		VARCHAR(36)
						,TraxId			VARCHAR(20)
						,Rack			VARCHAR(2)
						,Vial			VARCHAR(2)
						,SampleType		VARCHAR(50)
						,CalType		VARCHAR(20)
						,Calibration	VARCHAR(50)
						,FastMethod		VARCHAR(50)
						,FastDF			VARCHAR(10)
						,[DateTime]		VARCHAR(20));

	CREATE TABLE actual ([Id]			INT
						,[Status]		SMALLINT
						,Validate		TINYINT
						,RowType		VARCHAR(20)
						,[Description]	VARCHAR(50)
						,[Index]		INT
						,SequenceId		VARCHAR(36)
						,TraxId			VARCHAR(20)
						,Rack			VARCHAR(2)
						,Vial			VARCHAR(2)
						,SampleType		VARCHAR(50)
						,CalType		VARCHAR(20)
						,Calibration	VARCHAR(50)
						,FastMethod		VARCHAR(50)
						,FastDF			VARCHAR(10)
						,[DateTime]		VARCHAR(20));

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
      ,[Note2]) VALUES (1
	  ,'0303'
	  ,'EXTERNAL'
	  ,'Sample'
	  ,1
	  ,1
	  ,0
	  ,0
	  ,'0101'
	  ,'1'
	  ,'1'
	  ,'0101'
	  ,'0101'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,1
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/06/2023 09:01:32'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');
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
      ,[Note2]) VALUES (2
	  ,'0303'
	  ,'EXTERNAL'
	  ,'Sample'
	  ,1
	  ,2
	  ,0
	  ,0
	  ,'0103'
	  ,'1'
	  ,'3'
	  ,'0103'
	  ,'0103'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,1
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/06/2023 09:02:32'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');
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
      ,[Note2]) VALUES (3
	  ,'0303'
	  ,'EXTERNAL'
	  ,'Sample'
	  ,1
	  ,3
	  ,0
	  ,0
	  ,'0111'
	  ,'1'
	  ,'11'
	  ,'0111'
	  ,'0111'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,1
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/06/2023 09:03:32'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_SAMPLE](@analysis, @analysisStd, @sequenceId);

	INSERT INTO expected ([Id]
	,[Status]
	,Validate
	,RowType
	,[Description]
	,[Index]
	,SequenceId
	,TraxId
	,Rack
	,Vial
	,SampleType
	,CalType
	,Calibration
	,FastMethod
	,FastDF
	,[DateTime]) VALUES (1
	,0
	,0
	,''
	,'0101'
	,1
	,'imasequenceID'
	,'0101'
	,'1'
	,'1'
	,'Testing'
	,'EXTERNAL'
	,'Testing_Cal'
	,'S5_VL_D1.fast'
	,1
	,'09/06/2023 09:01:32');
	INSERT INTO expected ([Id]
	,[Status]
	,Validate
	,RowType
	,[Description]
	,[Index]
	,SequenceId
	,TraxId
	,Rack
	,Vial
	,SampleType
	,CalType
	,Calibration
	,FastMethod
	,FastDF
	,[DateTime]) VALUES (2
	,0
	,0
	,''
	,'0103'
	,2
	,'imasequenceID'
	,'0103'
	,'1'
	,'3'
	,'Testing'
	,'EXTERNAL'
	,'Testing_Cal'
	,'S5_VL_D1.fast'
	,1
	,'09/06/2023 09:02:32');
	INSERT INTO expected ([Id]
	,[Status]
	,Validate
	,RowType
	,[Description]
	,[Index]
	,SequenceId
	,TraxId
	,Rack
	,Vial
	,SampleType
	,CalType
	,Calibration
	,FastMethod
	,FastDF
	,[DateTime]) VALUES (3
	,0
	,0
	,''
	,'0111'
	,3
	,'imasequenceID'
	,'0111'
	,'1'
	,'11'
	,'Testing'
	,'EXTERNAL'
	,'Testing_Cal'
	,'S5_VL_D1.fast'
	,1
	,'09/06/2023 09:03:32');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';