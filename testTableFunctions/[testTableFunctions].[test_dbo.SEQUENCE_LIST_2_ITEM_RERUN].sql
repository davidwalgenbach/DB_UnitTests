ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_2_ITEM_RERUN]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @userdevice	VARCHAR(4);		SET @userdevice = '0303';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';
	DECLARE @index		INT;			SET @index = 1;

	CREATE TABLE expected (UserDevice	VARCHAR(4)
						,[Status]	SMALLINT
						,SampleType	VARCHAR(50)
						,[Priority]	TINYINT
						,TraxId		VARCHAR(20)
						,Rack		VARCHAR(2)
						,Vial		VARCHAR(2)
						,ProtocolId	INT
						,CalType	VARCHAR(20)
						,CalId		SMALLINT
						,FastMethod	VARCHAR(50)
						,FastDF		VARCHAR(10));

	CREATE TABLE actual (UserDevice	VARCHAR(4)
						,[Status]	SMALLINT
						,SampleType	VARCHAR(50)
						,[Priority]	TINYINT
						,TraxId		VARCHAR(20)
						,Rack		VARCHAR(2)
						,Vial		VARCHAR(2)
						,ProtocolId	INT
						,CalType	VARCHAR(20)
						,CalId		SMALLINT
						,FastMethod	VARCHAR(50)
						,FastDF		VARCHAR(10));

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
	  ,'09/05/2023 14:28:32'
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
	  ,'09/05/2023 14:30:32'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_2_ITEM_RERUN](@userdevice, @sequenceId, @index);

	INSERT INTO expected (UserDevice	
						,[Status]	
						,SampleType	
						,[Priority]	
						,TraxId		
						,Rack		
						,Vial		
						,ProtocolId	
						,CalType	
						,CalId		
						,FastMethod
						,FastDF) VALUES ('0303'
						,1
						,'Testing'
						,0
						,'0101'
						,'1'
						,'1'
						,1
						,'EXTERNAL'
						,1
						,'S5_VL_D1.fast'
						,1);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';