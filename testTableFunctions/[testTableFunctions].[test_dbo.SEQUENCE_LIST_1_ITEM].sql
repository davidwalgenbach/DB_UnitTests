ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_1_ITEM]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected (Id	INT
				,UserDevice		VARCHAR(4)
				,CalType		VARCHAR(20)
				,[Index]		INT
				,[Status]		SMALLINT
				,TraxId			VARCHAR(20)
				,RowNum			INT
				,ChildCount		TINYINT
				,Rack			VARCHAR(2)
				,Vial			VARCHAR(2)
				,[Description]	VARCHAR(50)
				,SampleType		VARCHAR(50)
				,SampleTypeId	SMALLINT
				,[Priority]		TINYINT
				,Calibration	VARCHAR(50)
				,CalId			SMALLINT
				,Point			TINYINT
				,[Value]		VARCHAR(10)
				,StdId			TINYINT
				,SyringeGroup	VARCHAR(2)
				,Unit			VARCHAR(10)
				,FastMethod		VARCHAR(50)
				,FastDF			VARCHAR(10)
				,Analysis		VARCHAR(12)
				,AnalysisStd	VARCHAR(12)
				,SequenceId		VARCHAR(36)
				,[DateTime]		VARCHAR(20)
				,ProtocolId		SMALLINT
				,RowType		VARCHAR(30));

	CREATE TABLE actual (Id	INT
				,UserDevice		VARCHAR(4)
				,CalType		VARCHAR(20)
				,[Index]		INT
				,[Status]		SMALLINT
				,TraxId			VARCHAR(20)
				,RowNum			INT
				,ChildCount		TINYINT
				,Rack			VARCHAR(2)
				,Vial			VARCHAR(2)
				,[Description]	VARCHAR(50)
				,SampleType		VARCHAR(50)
				,SampleTypeId	SMALLINT
				,[Priority]		TINYINT
				,Calibration	VARCHAR(50)
				,CalId			SMALLINT
				,Point			TINYINT
				,[Value]		VARCHAR(10)
				,StdId			TINYINT
				,SyringeGroup	VARCHAR(2)
				,Unit			VARCHAR(10)
				,FastMethod		VARCHAR(50)
				,FastDF			VARCHAR(10)
				,Analysis		VARCHAR(12)
				,AnalysisStd	VARCHAR(12)
				,SequenceId		VARCHAR(36)
				,[DateTime]		VARCHAR(20)
				,ProtocolId		SMALLINT
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

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_1_ITEM](@sequenceId);

	INSERT INTO expected (Id	
				,UserDevice		
				,CalType		
				,[Index]	
				,[Status]		
				,TraxId			
				,RowNum			
				,ChildCount		
				,Rack			
				,Vial			
				,[Description]	
				,SampleType		
				,SampleTypeId	
				,[Priority]		
				,Calibration	
				,CalId			
				,Point			
				,[Value]		
				,StdId		
				,SyringeGroup	
				,Unit		
				,FastMethod		
				,FastDF			
				,Analysis		
				,AnalysisStd	
				,SequenceId		
				,[DateTime]		
				,ProtocolId		
				,RowType) VALUES (1
				,'0303'
				,'EXTERNAL'
				,1
				,1
				,''
				,1
				,4
				,'R'
				,'2'
				,'Standard Calibration'
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
				,1
				,'CalIndex');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';