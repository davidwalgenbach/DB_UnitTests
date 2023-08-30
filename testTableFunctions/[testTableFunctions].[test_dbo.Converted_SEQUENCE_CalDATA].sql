CREATE PROCEDURE testTableFunctions.[test_dbo.Converted_SEQUENCE_CalDATA]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @versionId	VARCHAR(36);	SET @versionId = 'imaversionID';

	CREATE TABLE expected ([Id] INT
	,[UserDevice] VARCHAR(4)
	,[Analysis] VARCHAR(12)
	,[SequenceId] VARCHAR(36)
	,[Calibration] VARCHAR(50)
	,[CalId] INT
	,[ProtocolId] INT
	,[Analyte] VARCHAR(10)
	,[Mass] VARCHAR(10)
	,[Mode] VARCHAR(30)
	,[LineFit] VARCHAR(20)
	,[InterceptFitType] VARCHAR(20)
	,[Forcing] VARCHAR(20)
	,[InternalStd] VARCHAR(30)
	,[SyringeGroup] TINYINT
	,[StdId] INT
	,[StdVal] VARCHAR(10)
	,[Unit] VARCHAR(10)
	,[Std-0] VARCHAR(50)
	,[Std-1] VARCHAR(50)
	,[Std-2] VARCHAR(50)
	,[Std-3] VARCHAR(50)
	,[Std-4] VARCHAR(50)
	,[Std-5] VARCHAR(50)
	,[Std-6] VARCHAR(50)
	,[Std-7] VARCHAR(50)
	,[Std-8] VARCHAR(50)
	,[Std-9] VARCHAR(50));

	CREATE TABLE actual ([Id] INT
	,[UserDevice] VARCHAR(4)
	,[Analysis] VARCHAR(12)
	,[SequenceId] VARCHAR(36)
	,[Calibration] VARCHAR(50)
	,[CalId] INT
	,[ProtocolId] INT
	,[Analyte] VARCHAR(10)
	,[Mass] VARCHAR(10)
	,[Mode] VARCHAR(30)
	,[LineFit] VARCHAR(20)
	,[InterceptFitType] VARCHAR(20)
	,[Forcing] VARCHAR(20)
	,[InternalStd] VARCHAR(30)
	,[SyringeGroup] TINYINT
	,[StdId] INT
	,[StdVal] VARCHAR(10)
	,[Unit] VARCHAR(10)
	,[Std-0] VARCHAR(50)
	,[Std-1] VARCHAR(50)
	,[Std-2] VARCHAR(50)
	,[Std-3] VARCHAR(50)
	,[Std-4] VARCHAR(50)
	,[Std-5] VARCHAR(50)
	,[Std-6] VARCHAR(50)
	,[Std-7] VARCHAR(50)
	,[Std-8] VARCHAR(50)
	,[Std-9] VARCHAR(50));

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_VERSIONS';
	INSERT INTO [dbo].[SEQUENCE_VERSIONS] ([Id]
      ,[UserDevice]
      ,[Analysis]
      ,[SequenceId]
      ,[VersionId]
      ,[DateTime]) VALUES (1
	  ,'0303'
	  ,'082923150123'
	  ,'imasequenceID'
	  ,'imaversionID'
	  ,'08/29/2023 15:01:23')
	
	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_CalDATA';
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
	  ,'imaversionID'
	  ,1
	  ,'Testing_Cal'
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
	  ,'');
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
	  ,'imaversionID'
	  ,1
	  ,'Testing_Cal'
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
	  ,'15'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO expected ([Id]
	,[UserDevice]
	,[Analysis]
	,[SequenceId]
	,[Calibration]
	,[CalId]
	,[ProtocolId]
	,[Analyte]
	,[Mass]
	,[Mode]
	,[LineFit]
	,[InterceptFitType]
	,[Forcing]
	,[InternalStd]
	,[SyringeGroup]
	,[StdId]
	,[StdVal]
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
	,'0303'
	,'082923150123'
	,'imasequenceID'
	,'Testing_Cal'
	,1
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
	,'5'
	,'10'
	,'15'
	,''
	,''
	,''
	,''
	,''
	,'');

	INSERT INTO actual SELECT * FROM [dbo].[Converted_SEQUENCE_CalDATA](@versionId);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';