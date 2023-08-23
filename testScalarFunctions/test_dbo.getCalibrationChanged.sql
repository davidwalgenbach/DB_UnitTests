ALTER PROCEDURE testScalarFunctions.[test_dbo.getCalibrationChanged]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(result BIT);
	DECLARE @latestVersion VARCHAR(36);	SET @latestVersion = '01324523';
	DECLARE @calId INT;	SET @calId = 1;

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

	  INSERT INTO actual VALUES([dbo].[getCalibrationChanged]('01324523', 1));

	  CREATE TABLE expected(result BIT);

	  INSERT INTO expected VALUES(0);
	  INSERT INTO expected VALUES(1);

	  --change the current data to force a failure - simulates a changed versionId.. new run with slightly different cal definitions
	  UPDATE [dbo].[SEQUENCE_CalDATA] SET Stock = '200' WHERE VersionId = '01324523'
	  UPDATE [dbo].[SEQUENCE_NanoCalDATA] SET RMDensity = '1' WHERE VersionId = '01324523'

	  INSERT INTO actual VALUES([dbo].[getCalibrationChanged]('01324523', 1));

	  EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions'
