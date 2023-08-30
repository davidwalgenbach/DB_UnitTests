ALTER PROCEDURE testTableFunctions.[test_dbo.CALDATA_STD_VALUES]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE expected (Std TINYINT, [Value] VARCHAR(10));
	CREATE TABLE actual (Std TINYINT, [Value] VARCHAR(10));

	DECLARE @versionId VARCHAR(36);	SET @versionId = 'imaversionID';

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

	INSERT INTO expected (Std
	,[Value]) VALUES (0
	,0);
	INSERT INTO expected (Std
	,[Value]) VALUES (1
	,5);
	INSERT INTO expected (Std
	,[Value]) VALUES (2
	,10);
	INSERT INTO expected (Std
	,[Value]) VALUES (3
	,15);
	INSERT INTO expected (Std
	,[Value]) VALUES (4
	,'');
	INSERT INTO expected (Std
	,[Value]) VALUES (5
	,'');
	INSERT INTO expected (Std
	,[Value]) VALUES (6
	,'');
	INSERT INTO expected (Std
	,[Value]) VALUES (7
	,'');
	INSERT INTO expected(Std
	,[Value]) VALUES (8
	,'');
	INSERT INTO expected(Std
	,[Value]) VALUES (9
	,'');

	INSERT INTO actual SELECT * FROM [dbo].[CALDATA_STD_VALUES](@versionId);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';