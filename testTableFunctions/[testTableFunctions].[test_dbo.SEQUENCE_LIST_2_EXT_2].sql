ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_2_EXT_2]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @userdevice	VARCHAR(4);	SET @userdevice = '0303';
	DECLARE @calId		TINYINT;	SET @calId = 1;

	CREATE TABLE expected ([Status]	SMALLINT
							,CalType	VARCHAR(20)
							,SampleType	VARCHAR(50)
							,BarCode	VARCHAR(20)
							,Rack		VARCHAR(2)
							,Vial		VARCHAR(2)
							,CalId		SMALLINT
							,[Priority]	TINYINT
							,FastMethod	VARCHAR(50)
							,FastDF		VARCHAR(10)
							,SequenceWash	VARCHAR(50)
							,SampleTypeWash	VARCHAR(50)
							,ProtocolId		SMALLINT
							,Blank			TINYINT
							,Wash			TINYINT
							,Repetition		TINYINT
							,Seq			TINYINT);

	CREATE TABLE actual ([Status]	SMALLINT
							,CalType	VARCHAR(20)
							,SampleType	VARCHAR(50)
							,BarCode	VARCHAR(20)
							,Rack		VARCHAR(2)
							,Vial		VARCHAR(2)
							,CalId		SMALLINT
							,[Priority]	TINYINT
							,FastMethod	VARCHAR(50)
							,FastDF		VARCHAR(10)
							,SequenceWash	VARCHAR(50)
							,SampleTypeWash	VARCHAR(50)
							,ProtocolId		SMALLINT
							,Blank			TINYINT
							,Wash			TINYINT
							,Repetition		TINYINT
							,Seq			TINYINT);

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
	  ,'09/05/2023 11:58:14'
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
	  ,1
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
	  ,'09/05/2023 11:58:14'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_2_EXT_2](@userdevice, @calId);

	INSERT INTO expected ([Status]
	,CalType
	,SampleType
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
	,Seq) VALUES (0
	,'EXTERNAL'
	,'Testing'
	,'0101'
	,'1'
	,'1'
	,1
	,1
	,'S5_VL_D1.fast'
	,1
	,0
	,0
	,1
	,0
	,0
	,0
	,1);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';