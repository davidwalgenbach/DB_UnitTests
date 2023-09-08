ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_VIEW]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis	VARCHAR(12);	SET @analysis = 'analysisID';

	CREATE TABLE expected (TraxId	VARCHAR(20)
						,SequenceId	VARCHAR(36));

	CREATE TABLE actual (TraxId	VARCHAR(20)
						,SequenceId	VARCHAR(36));

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
	  ,1
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
	  ,'09/06/2023 11:17:23'
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
	  ,1
	  ,'0102'
	  ,'1'
	  ,'2'
	  ,'0102'
	  ,'0102'
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
	  ,'09/06/2023 11:19:23'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_VIEW]('EXTERNAL', @analysis);

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_LIST';
	INSERT INTO [dbo].[SEQUENCE_LIST] ([Id]
      ,[UserDevice]
      ,[Description]
      ,[Index]
      ,[StartRow]
      ,[Status]
      ,[CalType]
      ,[CalTypeId]
      ,[SeqType]
      ,[Analysis]
      ,[AnalysisStd]
      ,[SequenceId]
      ,[DateTime]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[Calibration]
      ,[CalId]
      ,[FastMethod]
      ,[FastDF]
      ,[ProtocolId]) VALUES (1
	  ,'0303'
	  ,'0105'
	  ,1
	  ,1
	  ,1
	  ,'MSA'
	  ,3
	  ,'NewCal'
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/06/2023 11:21:32'
	  ,'0105'
	  ,'1'
	  ,'5'
	  ,'Testing'
	  ,2
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,'S5_VL_D1.fast'
	  ,1
	  ,1);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_VIEW]('MSA', @analysis);

	INSERT INTO expected (TraxId
						,SequenceId) VALUES ('0101'
						,'imasequenceID');
	INSERT INTO expected (TraxId
						,SequenceId) VALUES ('0102'
						,'imasequenceID');
	INSERT INTO expected (TraxId
						,SequenceId) VALUES ('0105'
						,'imasequenceID');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';