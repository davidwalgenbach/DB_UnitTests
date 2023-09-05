ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_MSA]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @userdevice	VARCHAR(4);	SET @userdevice = '0303';

	CREATE TABLE expected ([Status] TINYINT
						,SampleType		VARCHAR(50)
						,[Priority]		TINYINT
						,TraxId			VARCHAR(20)
						,Rack			VARCHAR(2)
						,Vial			VARCHAR(2)
						,ProtocolId		INT
						,CalType		VARCHAR(20)
						,CalId			TINYINT
						,StdBlank		TINYINT
						,StdWash		TINYINT
						,Blank			TINYINT
						,Wash			TINYINT
						,Repetition		TINYINT
						,FastMethod		VARCHAR(50)
						,FastDF			VARCHAR(10)
						,SequenceWash	VARCHAR(50)
						,SampleTypeWash	VARCHAR(50)
						,SeqNum			INT);

	CREATE TABLE actual ([Status] TINYINT
						,SampleType		VARCHAR(50)
						,[Priority]		TINYINT
						,TraxId			VARCHAR(20)
						,Rack			VARCHAR(2)
						,Vial			VARCHAR(2)
						,ProtocolId		INT
						,CalType		VARCHAR(20)
						,CalId			TINYINT
						,StdBlank		TINYINT
						,StdWash		TINYINT
						,Blank			TINYINT
						,Wash			TINYINT
						,Repetition		TINYINT
						,FastMethod		VARCHAR(50)
						,FastDF			VARCHAR(10)
						,SequenceWash	VARCHAR(50)
						,SampleTypeWash	VARCHAR(50)
						,SeqNum			INT);

	EXEC tSQLt.FakeTable 'dbo', 'DiscoverDATA';
	INSERT INTO [dbo].[DiscoverDATA] ([Id]
      ,[UserDevice]
      ,[User]
      ,[DateTime]
      ,[BottleDetails_Id]
      ,[Status]
      ,[Description]
      ,[BarCode]
      ,[Match]
      ,[Rack]
      ,[Vial]
      ,[ProtocolId]
      ,[CalType]
      ,[Standard]
      ,[StdId]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[CalId]
      ,[Calibration]
      ,[FastMethod]
      ,[FastDF]
      ,[SequenceWash]
      ,[SampleTypeWash]
      ,[Blank]
      ,[Wash]
      ,[Repetition]
      ,[StdBlank]
      ,[StdWash]
      ,[RackType]
      ,[RackVials]
      ,[Destination]
      ,[Inverted]
      ,[RackAlias]
      ,[PrepRoute]
      ,[PrepMethod]
      ,[PrepDF]) VALUES (1
	  ,'0303'
	  ,'ESI\Testing'
	  ,'09/05/2023 16:24:23'
	  ,0
	  ,0
	  ,'0101'
	  ,'0101'
	  ,3
	  ,'1'
	  ,'1'
	  ,1
	  ,'MSA'
	  ,''
	  ,0
	  ,'Testing'
	  ,1
	  ,0
	  ,1
	  ,'Testing_Cal'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,''
	  ,0
	  ,0
	  ,0
	  ,''
	  ,''
	  ,''
	  ,'');
	INSERT INTO [dbo].[DiscoverDATA] ([Id]
      ,[UserDevice]
      ,[User]
      ,[DateTime]
      ,[BottleDetails_Id]
      ,[Status]
      ,[Description]
      ,[BarCode]
      ,[Match]
      ,[Rack]
      ,[Vial]
      ,[ProtocolId]
      ,[CalType]
      ,[Standard]
      ,[StdId]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[CalId]
      ,[Calibration]
      ,[FastMethod]
      ,[FastDF]
      ,[SequenceWash]
      ,[SampleTypeWash]
      ,[Blank]
      ,[Wash]
      ,[Repetition]
      ,[StdBlank]
      ,[StdWash]
      ,[RackType]
      ,[RackVials]
      ,[Destination]
      ,[Inverted]
      ,[RackAlias]
      ,[PrepRoute]
      ,[PrepMethod]
      ,[PrepDF]) VALUES (2
	  ,'0303'
	  ,'ESI\Testing'
	  ,'09/05/2023 16:26:23'
	  ,0
	  ,0
	  ,'0102'
	  ,'0102'
	  ,3
	  ,'1'
	  ,'2'
	  ,1
	  ,'MSA'
	  ,''
	  ,0
	  ,'Testing'
	  ,1
	  ,0
	  ,1
	  ,'Testing_Cal'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,''
	  ,0
	  ,0
	  ,0
	  ,''
	  ,''
	  ,''
	  ,'');
	INSERT INTO [dbo].[DiscoverDATA] ([Id]
      ,[UserDevice]
      ,[User]
      ,[DateTime]
      ,[BottleDetails_Id]
      ,[Status]
      ,[Description]
      ,[BarCode]
      ,[Match]
      ,[Rack]
      ,[Vial]
      ,[ProtocolId]
      ,[CalType]
      ,[Standard]
      ,[StdId]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[CalId]
      ,[Calibration]
      ,[FastMethod]
      ,[FastDF]
      ,[SequenceWash]
      ,[SampleTypeWash]
      ,[Blank]
      ,[Wash]
      ,[Repetition]
      ,[StdBlank]
      ,[StdWash]
      ,[RackType]
      ,[RackVials]
      ,[Destination]
      ,[Inverted]
      ,[RackAlias]
      ,[PrepRoute]
      ,[PrepMethod]
      ,[PrepDF]) VALUES (3
	  ,'0303'
	  ,'ESI\Testing'
	  ,'09/05/2023 16:28:23'
	  ,0
	  ,0
	  ,'0103'
	  ,'0103'
	  ,3
	  ,'1'
	  ,'3'
	  ,1
	  ,'MSA'
	  ,''
	  ,0
	  ,'Testing'
	  ,1
	  ,0
	  ,1
	  ,'Testing_Cal'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,''
	  ,0
	  ,0
	  ,0
	  ,''
	  ,''
	  ,''
	  ,'');

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
	  ,'SC'
	  ,1
	  ,1
	  ,0
	  ,'MSA'
	  ,3
	  ,'NewCal'
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'09/05/2023 16:19:21'
	  ,'0101'
	  ,'1'
	  ,'1'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,'S5_VL_D1.fast'
	  ,1
	  ,1);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_MSA](@userdevice);

	INSERT INTO expected ([Status] 
						,SampleType	
						,[Priority]		
						,TraxId			
						,Rack		
						,Vial			
						,ProtocolId		
						,CalType		
						,CalId		
						,StdBlank		
						,StdWash		
						,Blank		
						,Wash		
						,Repetition		
						,FastMethod		
						,FastDF			
						,SequenceWash	
						,SampleTypeWash	
						,SeqNum) VALUES (0
						,'Testing'
						,0
						,'0102'
						,'1'
						,'2'
						,1
						,'MSA'
						,1
						,0
						,0
						,0
						,0
						,0
						,'S5_VL_D1.fast'
						,1
						,0
						,0
						,1);
	INSERT INTO expected ([Status] 
						,SampleType	
						,[Priority]		
						,TraxId			
						,Rack		
						,Vial			
						,ProtocolId		
						,CalType		
						,CalId		
						,StdBlank		
						,StdWash		
						,Blank		
						,Wash		
						,Repetition		
						,FastMethod		
						,FastDF			
						,SequenceWash	
						,SampleTypeWash	
						,SeqNum) VALUES (0
						,'Testing'
						,0
						,'0103'
						,'1'
						,'3'
						,1
						,'MSA'
						,1
						,0
						,0
						,0
						,0
						,0
						,'S5_VL_D1.fast'
						,1
						,0
						,0
						,2);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';