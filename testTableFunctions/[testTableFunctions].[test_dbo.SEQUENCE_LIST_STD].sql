ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_STD]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis		VARCHAR(12);	SET @analysis = 'analysisID';
	DECLARE @analysisStd	VARCHAR(12);	SET @analysisStd = '';
	DECLARE @sequenceId		VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected ([Id]			INT
						,[Status]		TINYINT
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
						,[Status]		TINYINT
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
	  ,'CalBlank'
	  ,1
	  ,1
	  ,0
	  ,0
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
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/06/2023 09:38:12'
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
	  ,'CalStandard'
	  ,1
	  ,2
	  ,0
	  ,0
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
	  ,'5'
	  ,1
	  ,2
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/06/2023 09:46:12'
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
      ,[ProtocolId]) VALUES (3
	  ,'0303'
	  ,'EXTERNAL'
	  ,'CalStandard'
	  ,1
	  ,3
	  ,0
	  ,0
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,'Std-2'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,2
	  ,'15'
	  ,1
	  ,2
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/06/2023 09:54:12'
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
      ,[ProtocolId]) VALUES (4
	  ,'0303'
	  ,'EXTERNAL'
	  ,'CalStandard'
	  ,1
	  ,4
	  ,0
	  ,0
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,'Std-3'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,3
	  ,'50'
	  ,1
	  ,2
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/06/2023 10:02:12'
	  ,1);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_STD](@analysis, @analysisStd, @sequenceId);

	INSERT INTO expected([Id]
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
	,'Std-0'
	,1
	,'imasequenceID'
	,'0101'
	,'R'
	,'2'
	,'Testing'
	,'EXTERNAL'
	,'Testing_Cal'
	,'S5_VL_D1.fast'
	,1
	,'09/06/2023 09:38:12');
	INSERT INTO expected([Id]
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
	,'Std-1'
	,2
	,'imasequenceID'
	,'0101'
	,'R'
	,'2'
	,'Testing'
	,'EXTERNAL'
	,'Testing_Cal'
	,'S5_VL_D1.fast'
	,1
	,'09/06/2023 09:46:12');
	INSERT INTO expected([Id]
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
	,'Std-2'
	,3
	,'imasequenceID'
	,'0101'
	,'R'
	,'2'
	,'Testing'
	,'EXTERNAL'
	,'Testing_Cal'
	,'S5_VL_D1.fast'
	,1
	,'09/06/2023 09:54:12');
	INSERT INTO expected([Id]
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
	,[DateTime]) VALUES (4
	,0
	,0
	,''
	,'Std-3'
	,4
	,'imasequenceID'
	,'0101'
	,'R'
	,'2'
	,'Testing'
	,'EXTERNAL'
	,'Testing_Cal'
	,'S5_VL_D1.fast'
	,1
	,'09/06/2023 10:02:12');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';