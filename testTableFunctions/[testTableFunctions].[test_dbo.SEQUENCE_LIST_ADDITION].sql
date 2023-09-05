ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_ADDITION]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @userdevice	VARCHAR(4);	SET @userdevice = '0303';

	CREATE TABLE expected ([Status]	SMALLINT
						,SampleType	VARCHAR(50)
						,[Priority]	TINYINT
						,TraxId	VARCHAR(20)
						,Rack	VARCHAR(2)
						,Vial	VARCHAR(2)
						,Protocol	VARCHAR(50)
						,CalType	VARCHAR(20)
						,CalId		SMALLINT
						,FastMethod	VARCHAR(50)
						,FastDF		VARCHAR(10)
						,SequenceWash	VARCHAR(50)
						,SampleTypeWash	VARCHAR(50));

	CREATE TABLE actual ([Status]	SMALLINT
						,SampleType	VARCHAR(50)
						,[Priority]	TINYINT
						,TraxId	VARCHAR(20)
						,Rack	VARCHAR(2)
						,Vial	VARCHAR(2)
						,Protocol	VARCHAR(50)
						,CalType	VARCHAR(20)
						,CalId		SMALLINT
						,FastMethod	VARCHAR(50)
						,FastDF		VARCHAR(10)
						,SequenceWash	VARCHAR(50)
						,SampleTypeWash	VARCHAR(50));

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
	  ,'09/05/2023 15:17:18'
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
	  ,'S5_Wash_3mL_1x_1min.fast'
	  ,''
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

	EXEC tSQLt.FakeTable 'dbo', 'Protocol';
	INSERT INTO [dbo].[Protocol] ([Id]
      ,[Name]
      ,[CalId]
      ,[Prefix]
      ,[TypeId]) VALUES (1
	  ,'TestingProto'
	  ,1
	  ,''
	  ,0);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_ADDITION](@userdevice);

	INSERT INTO expected ([Status]	
						,SampleType	
						,[Priority]	
						,TraxId
						,Rack	
						,Vial	
						,Protocol	
						,CalType	
						,CalId		
						,FastMethod	
						,FastDF		
						,SequenceWash	
						,SampleTypeWash) VALUES (0
						,'Testing'
						,0
						,'0101'
						,'1'
						,'1'
						,'TestingProto'
						,'ADDITION'
						,1
						,'S5_VL_D1.fast'
						,1
						,'S5_Wash_3mL_1x_1min.fast'
						,'');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';