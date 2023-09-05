ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_1_VIEW]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis	VARCHAR(12);	SET @analysis = 'analysisID';
	DECLARE @analysisStd	VARCHAR(12);	SET @analysisStd = '';
	DECLARE @sequenceId		VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected (Id	INT
	,UserDevice		VARCHAR(4)
	,SeqNum			SMALLINT
	,[Status]		SMALLINT
	,[Description]	VARCHAR(50)
	,Analysis		VARCHAR(12)
	,AnalysisStd	VARCHAR(12)
	,[Index]		INT
	,SequenceId		VARCHAR(36)
	,TraxId			VARCHAR(20)
	,Rack			VARCHAR(2)
	,Vial			VARCHAR(2)
	,SampleType		VARCHAR(50)
	,SampleTypeId	INT
	,[Priority]		TINYINT
	,CalType		VARCHAR(20)
	,CalId			SMALLINT
	,Point			TINYINT
	,StdVal			VARCHAR(10)
	,StdId			TINYINT
	,SyringeGroup	VARCHAR(2)
	,Unit			VARCHAR(10)
	,FastMethod		VARCHAR(50)
	,FastDF			VARCHAR(10)
	,ProtocolId		VARCHAR(20)
	,[DateTime]		VARCHAR(20)
	,RowType		VARCHAR(30));

	CREATE TABLE actual (Id	INT
	,UserDevice		VARCHAR(4)
	,SeqNum			SMALLINT
	,[Status]		SMALLINT
	,[Description]	VARCHAR(50)
	,Analysis		VARCHAR(12)
	,AnalysisStd	VARCHAR(12)
	,[Index]		INT
	,SequenceId		VARCHAR(36)
	,TraxId			VARCHAR(20)
	,Rack			VARCHAR(2)
	,Vial			VARCHAR(2)
	,SampleType		VARCHAR(50)
	,SampleTypeId	INT
	,[Priority]		TINYINT
	,CalType		VARCHAR(20)
	,CalId			SMALLINT
	,Point			TINYINT
	,StdVal			VARCHAR(10)
	,StdId			TINYINT
	,SyringeGroup	VARCHAR(2)
	,Unit			VARCHAR(10)
	,FastMethod		VARCHAR(50)
	,FastDF			VARCHAR(10)
	,ProtocolId		VARCHAR(20)
	,[DateTime]		VARCHAR(20)
	,RowType		VARCHAR(30));

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
	  ,1
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
	  ,'09/05/2023 09:47:42'
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
	  ,'CalBlank'
	  ,1
	  ,2
	  ,0
	  ,1
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
	  ,'09/05/2023 09:55:42'
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
	  ,'CalBlank'
	  ,1
	  ,3
	  ,0
	  ,1
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
	  ,'09/05/2023 10:03:42'
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
	  ,'CalBlank'
	  ,1
	  ,4
	  ,0
	  ,1
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
	  ,'30'
	  ,1
	  ,2
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/05/2023 10:11:42'
	  ,1);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_1_VIEW](@analysis, @analysisStd, @sequenceId);

	INSERT INTO expected (Id
	,UserDevice	
	,SeqNum			
	,[Status]		
	,[Description]	
	,Analysis		
	,AnalysisStd	
	,[Index]	
	,SequenceId		
	,TraxId			
	,Rack			
	,Vial			
	,SampleType		
	,SampleTypeId	
	,[Priority]	
	,CalType		
	,CalId			
	,Point			
	,StdVal			
	,StdId			
	,SyringeGroup	
	,Unit			
	,FastMethod		
	,FastDF			
	,ProtocolId		
	,[DateTime]		
	,RowType) VALUES (1
	,'0303'
	,1
	,1
	,'Std-0'
	,'analysisID'
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
	,0
	,0
	,1
	,1
	,'ppb'
	,'S5_VL_D1.fast'
	,1
	,1
	,'09/05/2023 09:47:42'
	,'CalBlank');
	INSERT INTO expected (Id
	,UserDevice	
	,SeqNum			
	,[Status]		
	,[Description]	
	,Analysis		
	,AnalysisStd	
	,[Index]	
	,SequenceId		
	,TraxId			
	,Rack			
	,Vial			
	,SampleType		
	,SampleTypeId	
	,[Priority]	
	,CalType		
	,CalId			
	,Point			
	,StdVal			
	,StdId			
	,SyringeGroup	
	,Unit			
	,FastMethod		
	,FastDF			
	,ProtocolId		
	,[DateTime]		
	,RowType) VALUES (2
	,'0303'
	,1
	,1
	,'Std-1'
	,'analysisID'
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
	,5
	,1
	,2
	,'ppb'
	,'S5_VL_D1.fast'
	,1
	,1
	,'09/05/2023 09:55:42'
	,'CalBlank');
	INSERT INTO expected (Id
	,UserDevice	
	,SeqNum			
	,[Status]		
	,[Description]	
	,Analysis		
	,AnalysisStd	
	,[Index]	
	,SequenceId		
	,TraxId			
	,Rack			
	,Vial			
	,SampleType		
	,SampleTypeId	
	,[Priority]	
	,CalType		
	,CalId			
	,Point			
	,StdVal			
	,StdId			
	,SyringeGroup	
	,Unit			
	,FastMethod		
	,FastDF			
	,ProtocolId		
	,[DateTime]		
	,RowType) VALUES (3
	,'0303'
	,1
	,1
	,'Std-2'
	,'analysisID'
	,''
	,3
	,'imasequenceID'
	,'0101'
	,'R'
	,'2'
	,'Testing'
	,1
	,0
	,'EXTERNAL'
	,1
	,2
	,15
	,1
	,2
	,'ppb'
	,'S5_VL_D1.fast'
	,1
	,1
	,'09/05/2023 10:03:42'
	,'CalBlank');
	INSERT INTO expected (Id
	,UserDevice	
	,SeqNum			
	,[Status]		
	,[Description]	
	,Analysis		
	,AnalysisStd	
	,[Index]	
	,SequenceId		
	,TraxId			
	,Rack			
	,Vial			
	,SampleType		
	,SampleTypeId	
	,[Priority]	
	,CalType		
	,CalId			
	,Point			
	,StdVal			
	,StdId			
	,SyringeGroup	
	,Unit			
	,FastMethod		
	,FastDF			
	,ProtocolId		
	,[DateTime]		
	,RowType) VALUES (4
	,'0303'
	,1
	,1
	,'Std-3'
	,'analysisID'
	,''
	,4
	,'imasequenceID'
	,'0101'
	,'R'
	,'2'
	,'Testing'
	,1
	,0
	,'EXTERNAL'
	,1
	,3
	,30
	,1
	,2
	,'ppb'
	,'S5_VL_D1.fast'
	,1
	,1
	,'09/05/2023 10:11:42'
	,'CalBlank');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.RUn 'testTableFunctions';