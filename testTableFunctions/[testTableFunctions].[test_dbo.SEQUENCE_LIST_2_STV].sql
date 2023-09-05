ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_2_STV]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected (Id	INT
						,UserDevice	VARCHAR(4)
						,CalType	VARCHAR(20)
						,SeqNum		TINYINT
						,RepNum		TINYINT
						,[Index]	INT
						,[Status]	SMALLINT
						,TraxId		VARCHAR(20)
						,Rack		VARCHAR(2)
						,Vial		VARCHAR(2)
						,[Description]	VARCHAR(50)
						,RowType		VARCHAR(50)
						,BarCode		VARCHAR(20)
						,SampleType		VARCHAR(50)
						,SampleTypeId	SMALLINT
						,[Priority]		TINYINT
						,Calibration	VARCHAR(50)
						,CalId			SMALLINT
						,FastMethod		VARCHAR(50)
						,FastDF			VARCHAR(10)
						,SyringeGroup	VARCHAR(2)
						,Analysis		VARCHAR(12)
						,AnalysisStd	VARCHAR(12)
						,SequenceId		VARCHAR(36)
						,[DateTime]		VARCHAR(20)
						,ProtocolId		INT
						,ReqType		VARCHAR(20)
						,Line			NVARCHAR(10)
						,Material		NVARCHAR(20)
						,SamplingPoint	NVARCHAR(20)
						,Note1			NVARCHAR(50)
						,Note2			NVARCHAR(50));

	CREATE TABLE actual (Id	INT
						,UserDevice	VARCHAR(4)
						,CalType	VARCHAR(20)
						,SeqNum		TINYINT
						,RepNum		TINYINT
						,[Index]	INT
						,[Status]	SMALLINT
						,TraxId		VARCHAR(20)
						,Rack		VARCHAR(2)
						,Vial		VARCHAR(2)
						,[Description]	VARCHAR(50)
						,RowType		VARCHAR(50)
						,BarCode		VARCHAR(20)
						,SampleType		VARCHAR(50)
						,SampleTypeId	SMALLINT
						,[Priority]		TINYINT
						,Calibration	VARCHAR(50)
						,CalId			SMALLINT
						,FastMethod		VARCHAR(50)
						,FastDF			VARCHAR(10)
						,SyringeGroup	VARCHAR(2)
						,Analysis		VARCHAR(12)
						,AnalysisStd	VARCHAR(12)
						,SequenceId		VARCHAR(36)
						,[DateTime]		VARCHAR(20)
						,ProtocolId		INT
						,ReqType		VARCHAR(20)
						,Line			NVARCHAR(10)
						,Material		NVARCHAR(20)
						,SamplingPoint	NVARCHAR(20)
						,Note1			NVARCHAR(50)
						,Note2			NVARCHAR(50));

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
	  ,'09/05/2023 14:51:41'
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
	  ,'0105'
	  ,'1'
	  ,'5'
	  ,'0105'
	  ,'0105'
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
	  ,'09/05/2023 14:54:41'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_2_STV](@sequenceId);

	INSERT INTO expected (Id	
						,UserDevice	
						,CalType	
						,SeqNum		
						,RepNum		
						,[Index]	
						,[Status]
						,TraxId		
						,Rack		
						,Vial		
						,[Description]	
						,RowType		
						,BarCode		
						,SampleType		
						,SampleTypeId	
						,[Priority]		
						,Calibration	
						,CalId			
						,FastMethod		
						,FastDF			
						,SyringeGroup	
						,Analysis		
						,AnalysisStd	
						,SequenceId		
						,[DateTime]		
						,ProtocolId		
						,ReqType		
						,Line			
						,Material		
						,SamplingPoint	
						,Note1			
						,Note2) VALUES (1
						,'0303'
						,'EXTERNAL'
						,1
						,0
						,1
						,1
						,'0101'
						,1
						,1
						,'Sample'
						,'SampleRow'
						,'0101'
						,'Testing'
						,1
						,0
						,'Testing_Cal'
						,1
						,'S5_VL_D1.fast'
						,1
						,1
						,'analysisID'
						,''
						,'imasequenceID'
						,'09/05/2023 14:51:41'
						,1
						,''
						,''
						,''
						,''
						,''
						,'');
	INSERT INTO expected (Id	
						,UserDevice	
						,CalType	
						,SeqNum		
						,RepNum		
						,[Index]	
						,[Status]
						,TraxId		
						,Rack		
						,Vial		
						,[Description]	
						,RowType		
						,BarCode		
						,SampleType		
						,SampleTypeId	
						,[Priority]		
						,Calibration	
						,CalId			
						,FastMethod		
						,FastDF			
						,SyringeGroup	
						,Analysis		
						,AnalysisStd	
						,SequenceId		
						,[DateTime]		
						,ProtocolId		
						,ReqType		
						,Line			
						,Material		
						,SamplingPoint	
						,Note1			
						,Note2) VALUES (2
						,'0303'
						,'EXTERNAL'
						,1
						,0
						,2
						,1
						,'0105'
						,1
						,5
						,'Sample'
						,'SampleRow'
						,'0105'
						,'Testing'
						,1
						,0
						,'Testing_Cal'
						,1
						,'S5_VL_D1.fast'
						,1
						,1
						,'analysisID'
						,''
						,'imasequenceID'
						,'09/05/2023 14:54:41'
						,1
						,''
						,''
						,''
						,''
						,''
						,'');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';