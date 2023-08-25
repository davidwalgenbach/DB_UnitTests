CREATE PROCEDURE testScalarFunctions.[test_dbo.getRelativeValue]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(results DECIMAL(18,4));
	CREATE TABLE expected(results DECIMAL(18,4));

	DECLARE @analysis		VARCHAR(12);	SET @analysis = '082423112934';
	DECLARE @analysisStd	VARCHAR(12);	SET @analysisStd = '';
	DECLARE @sequenceId		VARCHAR(36);	SET @sequenceId = '6EA10428-E70C-4B62-AE91-F722321CB622';
	DECLARE @versionId		VARCHAR(36);	SET @versionId = 'FEAACA41-C23E-4F69-B4FA-F4312DBAE45F';
	DECLARE @qcId			INT;			SET @qcId = 1;

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
	  ,'FEAACA41-C23E-4F69-B4FA-F4312DBAE45F'
	  ,1
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'Recovery'
	  ,75
	  ,125
	  ,'Relative'
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
	  ,'FEAACA41-C23E-4F69-B4FA-F4312DBAE45F'
	  ,1
	  ,1
	  ,'Recov'
	  ,2
	  ,'Calibration'
	  ,'Recovery'
	  ,1
	  ,1
	  ,0
	  ,''
	  ,''
	  ,0
	  ,0
	  ,2
	  ,1);

	--Looks like this scalar function is not called anywhere...

END;
GO

EXEC tSQLt.Run 'testScalarFunctions';