CREATE PROCEDURE testScalarFunctions.[test_dbo.getQCChanged]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(result BIT);
	CREATE TABLE expected(result BIT);
	DECLARE @latestVersion VARCHAR(36);	SET @latestVersion = '01324523';
	DECLARE @userDevice	VARCHAR(4);		SET @userDevice = '0303';
	DECLARE @calType	VARCHAR(12);	SET @calType = 'EXTERNAL';
	DECLARE @calId		INT;			SET @calId = 1;

	EXEC tSQLt.FakeTable 'dbo', 'QC';
	INSERT INTO [dbo].[QC] ([Id]
      ,[ProtocolId]
      ,[QCName]
      ,[QCTypeId]
      ,[QCType]
      ,[Priority]
      ,[CalId]
      ,[LimitType]
      ,[WashEnabled]
      ,[WashMethod]
      ,[QCTraxId]
      ,[StockId]
      ,[Frequency]
      ,[Point]) VALUES (1
	  ,1
	  ,'Intensity'
	  ,1
	  ,'Blank'
	  ,1
	  ,1
	  ,'Intensity'
	  ,0
	  ,''
	  ,''
	  ,0
	  ,0
	  ,0);

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
	  ,'08/24/2023 09:31:34'
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
	  ,'TXR_31_62_F'
	  ,13
	  ,0
	  ,0
	  ,''
	  ,0
	  ,''
	  ,'');

	EXEC tSQLt.FakeTable 'dbo', 'QCDATA';
	INSERT INTO [dbo].[QCDATA] ([Id]
      ,[QCId]
      ,[CalId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LimitType]
      ,[MinLimit]
      ,[MaxLimit]
      ,[LimitFormat]
      ,[Prerequisite]) VALUES (1
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'Intensity'
	  ,'0'
	  ,'150'
	  ,'Absolute'
	  ,0);

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_QC';
	INSERT INTO [dbo].[SEQUENCE_QC] ([Id]
      ,[VersionId]
      ,[ProtocolId]
      ,[QCId]
      ,[QCName]
      ,[QCTypeId]
      ,[QCType]
      ,[LimitType]
      ,[Priority]
      ,[CalId]
      ,[WashEnabled]
      ,[WashMethod]
      ,[QCTraxId]
      ,[StockId]
      ,[Frequency]
      ,[Point]
      ,[Enabled]) VALUES (1
	  ,'01324523'
	  ,1
	  ,1
	  ,'Intensity'
	  ,1
	  ,'Blank'
	  ,'Intensity'
	  ,1
	  ,1
	  ,0
	  ,''
	  ,''
	  ,0
	  ,0
	  ,0
	  ,1);

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_QCData';
	INSERT INTO [dbo].[SEQUENCE_QCData] ([Id]
      ,[VersionId]
      ,[ProtocolId]
      ,[QCId]
      ,[CalId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LimitType]
      ,[MinLimit]
      ,[MaxLimit]
      ,[LimitFormat]
      ,[Prerequisite]) VALUES (1
	  ,'01324523'
	  ,1
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'Intensity'
	  ,'0'
	  ,'150'
	  ,'Absolute'
	  ,0);

	EXEC tSQLt.FakeTable 'dbo', 'QCActionDATA';
	INSERT INTO [dbo].[QCActionDATA] ([Id]
      ,[QCId]
      ,[Priority]
      ,[GroupIndex]
      ,[Index]
      ,[ActionName]
      ,[ActionType]
      ,[ActionValue]
      ,[Repeat]
      ,[NotifyLevel]) VALUES (1
	  ,1
	  ,1
	  ,1
	  ,1
	  ,'Ignore'
	  ,'Delimiter'
	  ,''
	  ,''
	  ,'');

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_QCActionDATA';
	INSERT INTO [dbo].[SEQUENCE_QCActionDATA] ([Id]
      ,[VersionId]
      ,[ProtocolId]
      ,[QCId]
      ,[Priority]
      ,[GroupIndex]
      ,[Index]
      ,[ActionId]
      ,[ActionName]
      ,[ActionType]
      ,[ActionValue]
      ,[Repeat]
      ,[NotifyLevel]) VALUES (1
	  ,'01324523'
	  ,1
	  ,1
	  ,1
	  ,1
	  ,1
	  ,1
	  ,'Ignore'
	  ,'Delimiter'
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual VALUES([dbo].[getQCChanged](@userDevice, @latestVersion, @calType, @calId));

	UPDATE [dbo].[SEQUENCE_QCActionDATA] SET [Priority] = 3 WHERE VersionId = '01324523';

	INSERT INTO actual VALUES([dbo].[getQCChanged](@userDevice, @latestVersion, @calType, @calId));

	INSERT INTO expected VALUES(0);
	INSERT INTO expected VALUES(1);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';