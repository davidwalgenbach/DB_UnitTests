CREATE PROCEDURE testScalarFunctions.[test_dbo.getSequenceTraxId_bySampleType]
AS
BEGIN
	DECLARE @actual		VARCHAR(50);
	DECLARE @expected	VARCHAR(50);	SET @expected = '0101';
	DECLARE @userdevice VARCHAR(4);		SET @userdevice = '0303';
	DECLARE @sampletype VARCHAR(30);	SET @sampletype = 'Testing';
	DECLARE @caltype	VARCHAR(20);	SET @caltype = 'EXTERNAL';

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
	  ,'08/25/2023 09:05:34'
	  ,'0'
	  ,'0'
	  ,''
	  ,'0101'
	  ,'3'
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
	  ,13
	  ,0
	  ,0
	  ,''
	  ,''
	  ,''
	  ,'');

	SET @actual = [dbo].[getSequenceTraxId_BySampleType](@userdevice, @sampletype, @caltype);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';