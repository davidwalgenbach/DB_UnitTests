CREATE PROCEDURE testScalarFunctions.[test_dbo.getStdPoint]
AS
BEGIN
	DECLARE @actual			TINYINT;
	DECLARE @expected		TINYINT;		SET @expected = 2;
	DECLARE @versionId		VARCHAR(36);	SET @versionId = 'imaversionID';
	DECLARE @description	VARCHAR(50);	SET @description = 'Recovery';
	DECLARE @protocolId		INT;			SET @protocolId = 1;

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
	  ,'imaversionID'
	  ,1
	  ,1
	  ,'Recovery'
	  ,1
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

	SET @actual = [dbo].[getStdPoint](@versionId, @description, @protocolId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';