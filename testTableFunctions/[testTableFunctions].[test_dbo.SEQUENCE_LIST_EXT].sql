ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_EXT]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @userdevice	VARCHAR(4);	SET @userdevice = '0303';
	DECLARE @option		TINYINT;	SET @option = 0;

	CREATE TABLE expected ([Status]	TINYINT
	,SampleType		VARCHAR(50)
	,[Priority]		TINYINT
	,Barcode		VARCHAR(20)
	,Rack			VARCHAR(2)
	,Vial			VARCHAR(2)
	,Protocol		VARCHAR(50)
	,CalType		VARCHAR(20)
	,CalId			SMALLINT
	,FastMethod		VARCHAR(50)
	,FastDF			VARCHAR(10)
	,SequenceWash	VARCHAR(50)
	,SampleTypeWash	VARCHAR(50)
	,Seq			VARCHAR(50));

	CREATE TABLE actual ([Status]	TINYINT
	,SampleType		VARCHAR(50)
	,[Priority]		TINYINT
	,Barcode		VARCHAR(20)
	,Rack			VARCHAR(2)
	,Vial			VARCHAR(2)
	,Protocol		VARCHAR(50)
	,CalType		VARCHAR(20)
	,CalId			SMALLINT
	,FastMethod		VARCHAR(50)
	,FastDF			VARCHAR(10)
	,SequenceWash	VARCHAR(50)
	,SampleTypeWash	VARCHAR(50)
	,Seq			VARCHAR(50));

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
	  ,'09/05/2023 15:48:32'
	  ,0
	  ,0
	  ,'0101'
	  ,'0101'
	  ,3
	  ,'1'
	  ,'1'
	  ,1
	  ,'EXTERNAL'
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
	  ,'09/05/2023 15:49:32'
	  ,0
	  ,0
	  ,'0103'
	  ,'0103'
	  ,3
	  ,'1'
	  ,'3'
	  ,1
	  ,'EXTERNAL'
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
	  ,'09/05/2023 15:50:32'
	  ,0
	  ,0
	  ,'0111'
	  ,'0111'
	  ,3
	  ,'1'
	  ,'11'
	  ,1
	  ,'EXTERNAL'
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
	  ,'09/05/2023 15:53:21'
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
	  ,'09/05/2023 15:55:21'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	EXEC tSQLt.FakeTable 'dbo', 'Protocol';
	INSERT INTO [dbo].[Protocol] (Id
	,[Name]
	,CalId
	,Prefix
	,TypeId) VALUES (1
	,'TestingProto'
	,1
	,''
	,0);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_EXT](@userdevice, @option);

	SET @option = 1;

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_EXT](@userdevice, @option);

	INSERT INTO expected ([Status]	
	,SampleType		
	,[Priority]		
	,Barcode		
	,Rack			
	,Vial		
	,Protocol		
	,CalType	
	,CalId			
	,FastMethod	
	,FastDF			
	,SequenceWash	
	,SampleTypeWash
	,Seq) VALUES (0
	,'Testing'
	,0
	,'0101'
	,'1'
	,'1'
	,'TestingProto'
	,'EXTERNAL'
	,1
	,'S5_VL_D1.fast'
	,1
	,0
	,0
	,1);
	INSERT INTO expected ([Status]	
	,SampleType		
	,[Priority]		
	,Barcode		
	,Rack			
	,Vial		
	,Protocol		
	,CalType	
	,CalId			
	,FastMethod	
	,FastDF			
	,SequenceWash	
	,SampleTypeWash
	,Seq) VALUES (0
	,'Testing'
	,0
	,'0103'
	,'1'
	,'3'
	,'TestingProto'
	,'EXTERNAL'
	,1
	,'S5_VL_D1.fast'
	,1
	,0
	,0
	,1);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';