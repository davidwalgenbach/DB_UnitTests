CREATE PROCEDURE testTableFunctions.[test_dbo.NANOCALDATA_STD_VALUES]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE expected ([Analyte] VARCHAR(10)
	,[Mass] VARCHAR(10)
	,[Mode] VARCHAR(30)
	,[Point] TINYINT
	,[RowType] VARCHAR(20));

	CREATE TABLE actual ([Analyte] VARCHAR(10)
	,[Mass] VARCHAR(10)
	,[Mode] VARCHAR(30)
	,[Point] TINYINT
	,[RowType] VARCHAR(20));

	DECLARE @versionId VARCHAR(36);	SET @versionId = 'imaversionID';

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_NanoCalDATA';
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
	  ,'imaversionID'
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,2
	  ,'Transport'
	  ,'2'
	  ,1
	  ,'1.231'
	  ,1
	  ,'5.2'
	  ,1
	  ,'5.414'
	  ,1)
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
      ,[RMMFUnitId]) VALUES (2
	  ,'imaversionID'
	  ,1
	  ,1
	  ,'Mg'
	  ,'24'
	  ,'Cold'
	  ,4
	  ,''
	  ,'2'
	  ,1
	  ,'1.231'
	  ,1
	  ,'5.2'
	  ,1
	  ,'5.414'
	  ,1)


	INSERT INTO actual SELECT * FROM [dbo].[NANOCALDATA_STD_VALUES](@versionId);

	INSERT INTO expected ([Analyte]
	,[Mass]
	,[Mode]
	,[Point]
	,[RowType]) VALUES ('Li'
	,'7'
	,'Hot'
	,2
	,'NanoRM');

	INSERT INTO expected ([Analyte]
	,[Mass]
	,[Mode]
	,[Point]
	,[RowType]) VALUES ('Mg'
	,'24'
	,'Cold'
	,4
	,'NanoStandard');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';