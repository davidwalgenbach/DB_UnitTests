ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_2_ADDITION]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @userdevice		VARCHAR(4);		SET @userdevice = '0303';
	DECLARE @sampletype		VARCHAR(30);	SET @sampletype = 'Testing';

	CREATE TABLE expected ([Status]	SMALLINT
							,BarCode		VARCHAR(20)
							,Rack			VARCHAR(2)
							,Vial			VARCHAR(2)
							,CalId			SMALLINT
							,[Priority]		TINYINT
							,FastMethod		VARCHAR(50)
							,FastDF			VARCHAR(10)
							,SequenceWash	VARCHAR(50)
							,SampleTypeWash	VARCHAR(50)
							,ProtocolId		SMALLINT
							,Blank			TINYINT
							,Wash			TINYINT
							,Repetition		TINYINT
							,Seq			TINYINT
							,RowNum			TINYINT);

	CREATE TABLE actual ([Status]	SMALLINT
							,BarCode		VARCHAR(20)
							,Rack			VARCHAR(2)
							,Vial			VARCHAR(2)
							,CalId			SMALLINT
							,[Priority]		TINYINT
							,FastMethod		VARCHAR(50)
							,FastDF			VARCHAR(10)
							,SequenceWash	VARCHAR(50)
							,SampleTypeWash	VARCHAR(50)
							,ProtocolId		SMALLINT
							,Blank			TINYINT
							,Wash			TINYINT
							,Repetition		TINYINT
							,Seq			TINYINT
							,RowNum			TINYINT);

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
	  ,'09/05/2023 10:31:34'
	  ,0
	  ,0
	  ,'0101'
	  ,'0101'
	  ,3
	  ,'1'
	  ,'1'
	  ,1
	  ,'ADDITION'
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
	  ,'09/05/2023 10:35:34'
	  ,0
	  ,0
	  ,'0102'
	  ,'0102'
	  ,3
	  ,'1'
	  ,'2'
	  ,1
	  ,'ADDITION'
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
	  ,'09/05/2023 10:35:34'
	  ,0
	  ,0
	  ,'0103'
	  ,'0103'
	  ,3
	  ,'1'
	  ,'3'
	  ,1
	  ,'ADDITION'
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

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_2_ADDITION](@userdevice, @sampletype);

	INSERT INTO expected ([Status]
							,BarCode		
							,Rack			
							,Vial			
							,CalId			
							,[Priority]	
							,FastMethod		
							,FastDF			
							,SequenceWash	
							,SampleTypeWash	
							,ProtocolId		
							,Blank		
							,Wash			
							,Repetition		
							,Seq			
							,RowNum) VALUES (0
							,'0101'
							,1
							,1
							,1
							,0
							,'S5_VL_D1.fast'
							,1
							,0
							,0
							,1
							,0
							,0
							,0
							,1
							,1);
	INSERT INTO expected ([Status]
							,BarCode		
							,Rack			
							,Vial			
							,CalId			
							,[Priority]	
							,FastMethod		
							,FastDF			
							,SequenceWash	
							,SampleTypeWash	
							,ProtocolId		
							,Blank		
							,Wash			
							,Repetition		
							,Seq			
							,RowNum) VALUES (0
							,'0102'
							,1
							,2
							,1
							,0
							,'S5_VL_D1.fast'
							,1
							,0
							,0
							,1
							,0
							,0
							,0
							,2
							,2);
	INSERT INTO expected ([Status]
							,BarCode		
							,Rack			
							,Vial			
							,CalId			
							,[Priority]	
							,FastMethod		
							,FastDF			
							,SequenceWash	
							,SampleTypeWash	
							,ProtocolId		
							,Blank		
							,Wash			
							,Repetition		
							,Seq			
							,RowNum) VALUES (0
							,'0103'
							,1
							,3
							,1
							,0
							,'S5_VL_D1.fast'
							,1
							,0
							,0
							,1
							,0
							,0
							,0
							,3
							,3);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';