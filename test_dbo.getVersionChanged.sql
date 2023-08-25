CREATE PROCEDURE testScalarFunctions.[test_dbo.getVersionChanged]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE expected(result BIT);
	CREATE TABLE actual(result BIT);
	DECLARE @userDevice		VARCHAR(4);		SET @userDevice = '0303';
	DECLARE @latestVersion	VARCHAR(36);	SET @latestVersion = '01324523';
	DECLARE @calType		VARCHAR(12);	SET @calType = 'EXTERNAL';
	DECLARE @calId			INT;			SET @calId = 1;

	EXEC tSQLt.FakeTable 'dbo', 'CalDATA'
	INSERT INTO [dbo].[CalDATA] ([Id]
      ,[CalId]
      ,[ProtocolId]
      ,[GroupId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[StdId]
      ,[Unit]
      ,[Stock]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (1
	  ,1
	  ,1
	  ,0
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,'ppb'
	  ,'150'
	  ,'0'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');
	INSERT INTO [dbo].[CalDATA] ([Id]
      ,[CalId]
      ,[ProtocolId]
      ,[GroupId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[StdId]
      ,[Unit]
      ,[Stock]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (2
	  ,1
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,'ppb'
	  ,'150'
	  ,''
	  ,'5'
	  ,'10'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');
	INSERT INTO [dbo].[CalDATA] ([Id]
      ,[CalId]
      ,[ProtocolId]
      ,[GroupId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[StdId]
      ,[Unit]
      ,[Stock]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (3
	  ,1
	  ,1
	  ,0
	  ,'Mg'
	  ,'24'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,'ppb'
	  ,'150'
	  ,'0'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');
	INSERT INTO [dbo].[CalDATA] ([Id]
      ,[CalId]
      ,[ProtocolId]
      ,[GroupId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[StdId]
      ,[Unit]
      ,[Stock]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (4
	  ,1
	  ,1
	  ,1
	  ,'Mg'
	  ,'24'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,'ppb'
	  ,'150'
	  ,''
	  ,'5'
	  ,'10'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_CalDATA'
	INSERT INTO [dbo].[SEQUENCE_CalDATA] ([Id]
      ,[VersionId]
      ,[CalId]
      ,[Calibration]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[GroupId]
      ,[StdId]
      ,[Stock]
      ,[Unit]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (1
	  ,'01324523' --VERSION ID
	  ,1
	  ,'TestingCal'
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,0
	  ,1
	  ,'150'
	  ,'ppb'
	  ,'0'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'')
	INSERT INTO [dbo].[SEQUENCE_CalDATA] ([Id]
      ,[VersionId]
      ,[CalId]
      ,[Calibration]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[GroupId]
      ,[StdId]
      ,[Stock]
      ,[Unit]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (2
	  ,'01324523' --VERSION ID
	  ,1
	  ,'TestingCal'
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,1
	  ,'150'
	  ,'ppb'
	  ,''
	  ,'5'
	  ,'10'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'')
	INSERT INTO [dbo].[SEQUENCE_CalDATA] ([Id]
      ,[VersionId]
      ,[CalId]
      ,[Calibration]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[GroupId]
      ,[StdId]
      ,[Stock]
      ,[Unit]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (3
	  ,'01324523' --VERSION ID
	  ,1
	  ,'TestingCal'
	  ,1
	  ,'Mg'
	  ,'24'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,0
	  ,1
	  ,'150'
	  ,'ppb'
	  ,'0'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'')
	INSERT INTO [dbo].[SEQUENCE_CalDATA] ([Id]
      ,[VersionId]
      ,[CalId]
      ,[Calibration]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[GroupId]
      ,[StdId]
      ,[Stock]
      ,[Unit]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (4
	  ,'01324523' --VERSION ID
	  ,1
	  ,'TestingCal'
	  ,1
	  ,'Mg'
	  ,'24'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,1
	  ,'150'
	  ,'ppb'
	  ,''
	  ,'5'
	  ,'10'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'')

	EXEC tSQLt.FakeTable 'dbo', 'NanoCalDATA'
	INSERT INTO [dbo].[NanoCalDATA] ([Id]
      ,[CalDATAId]
      ,[CalId]
      ,[StdId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[Point]
      ,[ReferenceMaterial]
      ,[RMDiameter]
      ,[RMDiaUnitId]
      ,[RMConcentration]
      ,[RMConUnitId]
      ,[RMDensity]
      ,[RMDenUnitId]
      ,[RMMassFraction]
      ,[RMMFUnitId]) VALUES (1
		,2
		,1
		,1
		,'Li'
		,'7'
		,'Hot'
		,'1'
		,''
		,''
		,''
		,''
		,''
		,''
		,''
		,''
		,'')

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_NanoCalDATA'
	INSERT INTO [dbo].[SEQUENCE_NanoCalDATA] ([Id]
      ,[VersionId]
      ,[CalId]
      ,[StdId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[Point]
      ,[ReferenceMaterial]
      ,[RMDiameter]
      ,[RMDiaUnitId]
      ,[RMConcentration]
      ,[RMConUnitId]
      ,[RMDensity]
      ,[RMDenUnitId]
      ,[RMMassFraction]
      ,[RMMFUnitId]) VALUES (1
	  ,'01324523'
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'1'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'')

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

	INSERT INTO expected VALUES (0);
	INSERT INTO actual VALUES ([dbo].[getVersionChanged](@userDevice, @latestVersion, @calType, @calId));

	UPDATE [dbo].[SEQUENCE_QCActionDATA] SET [Priority] = 3 WHERE VersionId = '01324523';

	INSERT INTO expected VALUES (1);
	INSERT INTO actual VALUES ([dbo].[getVersionChanged](@userDevice, @latestVersion, @calType, @calId));

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';