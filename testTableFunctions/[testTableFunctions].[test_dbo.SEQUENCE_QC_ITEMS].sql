ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_QC_ITEMS]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @versionId	VARCHAR(36);	SET @versionId = 'imaversionID';

	CREATE TABLE expected ([Id]	INT
						,ProtocolId		INT
						,QCId			INT
						,QCName			VARCHAR(50)
						,QCTypeId		TINYINT
						,QCType			VARCHAR(50)
						,LimitType		VARCHAR(20)
						,[Priority]		TINYINT
						,CalId			TINYINT
						,WashEnabled	BIT
						,WashMethod		VARCHAR(50)
						,QCTraxId		VARCHAR(50)
						,StockId		TINYINT
						,Frequency		INT
						,Point			TINYINT
						,[Enabled]		BIT);

	CREATE TABLE actual ([Id]	INT
						,ProtocolId		INT
						,QCId			INT
						,QCName			VARCHAR(50)
						,QCTypeId		TINYINT
						,QCType			VARCHAR(50)
						,LimitType		VARCHAR(20)
						,[Priority]		TINYINT
						,CalId			TINYINT
						,WashEnabled	BIT
						,WashMethod		VARCHAR(50)
						,QCTraxId		VARCHAR(50)
						,StockId		TINYINT
						,Frequency		INT
						,Point			TINYINT
						,[Enabled]		BIT);

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
	  ,'TestingQC'
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
      ,[Enabled]) VALUES (2
	  ,'imaversionID'
	  ,1
	  ,2
	  ,'TestingQC_2'
	  ,4
	  ,'Sample'
	  ,'OverRange'
	  ,2
	  ,1
	  ,0
	  ,''
	  ,''
	  ,0
	  ,0
	  ,4
	  ,1);
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
      ,[Enabled]) VALUES (3
	  ,'imaversionID'
	  ,1
	  ,3
	  ,'CCV'
	  ,3
	  ,'Solution'
	  ,'Concentration'
	  ,3
	  ,1
	  ,0
	  ,''
	  ,''
	  ,0
	  ,2
	  ,3
	  ,1);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_QC_ITEMS](@versionId);

	INSERT INTO expected ([Id]
	,ProtocolId
	,QCId
	,QCName
	,QCTypeId
	,QCType
	,LimitType
	,[Priority]
	,CalId
	,WashEnabled
	,WashMethod
	,QCTraxId
	,StockId
	,Frequency
	,Point
	,[Enabled]) VALUES (1
	,1
	,3
	,'CCV'
	,3
	,'Solution'
	,'Concentration'
	,3
	,1
	,0
	,''
	,''
	,0
	,2
	,3
	,1);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';