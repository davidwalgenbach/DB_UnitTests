CREATE PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_OVERRIDE_VIEW]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysisId	VARCHAR(12);	SET @analysisId = '083023112734';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected ([Id] INT
	,[AnalysisId] VARCHAR(12)
	,[SequenceId] VARCHAR(36)
	,[Initial] VARCHAR(10)
	,[TraxId] VARCHAR(20)
	,[Analyte] VARCHAR(10)
	,[Mode] VARCHAR(10)
	,[LineFit] VARCHAR(20)
	,[InitialSampleNumber] VARCHAR(2)
	,[InterceptFitType] VARCHAR(20)
	,[SampleType] VARCHAR(20)
	,[InternalStd] VARCHAR(10)
	,[ExPoints] VARCHAR(10)
	,[Index] VARCHAR(10)
	,[OriginalConc] VARCHAR(15)
	,[ChangedConc] VARCHAR(15));

	CREATE TABLE actual ([Id] INT
	,[AnalysisId] VARCHAR(12)
	,[SequenceId] VARCHAR(36)
	,[Initial] VARCHAR(10)
	,[TraxId] VARCHAR(20)
	,[Analyte] VARCHAR(10)
	,[Mode] VARCHAR(10)
	,[LineFit] VARCHAR(20)
	,[InitialSampleNumber] VARCHAR(2)
	,[InterceptFitType] VARCHAR(20)
	,[SampleType] VARCHAR(20)
	,[InternalStd] VARCHAR(10)
	,[ExPoints] VARCHAR(10)
	,[Index] VARCHAR(10)
	,[OriginalConc] VARCHAR(15)
	,[ChangedConc] VARCHAR(15));

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_DATA_OVERRIDE';
	INSERT INTO [dbo].[SEQUENCE_DATA_OVERRIDE] ([Id]
      ,[AnalysisId]
      ,[SequenceId]
      ,[TraxId]
      ,[Initial]
      ,[Analyte]
      ,[Mode]
      ,[LineFit]
      ,[InitialSampleNumber]
      ,[InterceptFitType]
      ,[SampleType]
      ,[InternalStd]
      ,[ExPoints]) VALUES (1
	  ,'083023112734'
	  ,'imasequenceID'
	  ,'0101'
	  ,'ET'
	  ,'Li'
	  ,'Hot'
	  ,'None'
	  ,5
	  ,'None'
	  ,'Testing'
	  ,''
	  ,'');
	INSERT INTO [dbo].[SEQUENCE_DATA_OVERRIDE] ([Id]
      ,[AnalysisId]
      ,[SequenceId]
      ,[TraxId]
      ,[Initial]
      ,[Analyte]
      ,[Mode]
      ,[LineFit]
      ,[InitialSampleNumber]
      ,[InterceptFitType]
      ,[SampleType]
      ,[InternalStd]
      ,[ExPoints]) VALUES (2
	  ,'083023112734'
	  ,'imasequenceID'
	  ,'0101'
	  ,'ET'
	  ,'Mg'
	  ,'Cool'
	  ,'None'
	  ,1
	  ,'None'
	  ,'Testing'
	  ,''
	  ,'');

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_DATA_OVERRIDE_VIEW](@analysisId, @sequenceId);

	INSERT INTO expected ([Id]
	,[AnalysisId]
	,[SequenceId]
	,[Initial] 
	,[TraxId] 
	,[Analyte] 
	,[Mode] 
	,[LineFit] 
	,[InitialSampleNumber]
	,[InterceptFitType]
	,[SampleType] 
	,[InternalStd] 
	,[ExPoints] 
	,[Index] 
	,[OriginalConc] 
	,[ChangedConc]) VALUES (1
	,'083023112734'
	,'imasequenceID'
	,'ET'
	,'0101'
	,'Li'
	,'Hot'
	,'None'
	,5
	,'None'
	,'Testing'
	,''
	,''
	,''
	,''
	,'');
	INSERT INTO expected ([Id]
	,[AnalysisId]
	,[SequenceId]
	,[Initial] 
	,[TraxId] 
	,[Analyte] 
	,[Mode] 
	,[LineFit] 
	,[InitialSampleNumber]
	,[InterceptFitType]
	,[SampleType] 
	,[InternalStd] 
	,[ExPoints] 
	,[Index] 
	,[OriginalConc] 
	,[ChangedConc]) VALUES (2
	,'083023112734'
	,'imasequenceID'
	,'ET'
	,'0101'
	,'Mg'
	,'Cool'
	,'None'
	,1
	,'None'
	,'Testing'
	,''
	,''
	,''
	,''
	,'');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';