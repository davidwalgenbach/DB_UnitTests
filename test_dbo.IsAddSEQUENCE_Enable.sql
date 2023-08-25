ALTER PROCEDURE testScalarFunctions.[test_dbo.isAddSEQUENCE_Enable]
AS
BEGIN
	DECLARE @actual BIT;
	DECLARE @expected BIT;	SET @expected = 0;
	DECLARE @userdevice VARCHAR(4);	SET @userdevice = '0303';
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
	  ,'08/25/2023 11:33:34'
	  ,0
	  ,0
	  ,''
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
	  ,13
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
	  ,2
	  ,1
	  ,0
	  ,'EXTERNAL'
	  ,1
	  ,'NewCal'
	  ,'082523113634'
	  ,''
	  ,'imasequenceID'
	  ,'08/25/2023 11:36:47'
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

	SET @actual = [dbo].[IsAddSEQUENCE_Enable](@userdevice, @caltype);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';