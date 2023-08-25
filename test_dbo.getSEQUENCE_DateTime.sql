ALTER PROCEDURE testScalarFunctions.[test_dbo.getSEQUENCE_DateTime]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual([DateTime] VARCHAR(20));
	CREATE TABLE expected([DateTime] VARCHAR(20));

	DECLARE @sequenceId		VARCHAR(36);	SET @sequenceId = 'DC9417D8-0A1D-475C-8024-88B16EA0AF0D';
	DECLARE @description	VARCHAR(50);	SET @description = 'Std-2';

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_LIST';
	INSERT INTO [dbo].[SEQUENCE_LIST] ([Id]
      ,[UserDevice]
      ,[Description]
      ,[Index]
      ,[StartRow]
      ,[Status]
      ,[CalType]
      ,[CalTypeId]
      ,[SeqType]
      ,[Analysis]
      ,[AnalysisStd]
      ,[SequenceId]
      ,[DateTime]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[Calibration]
      ,[CalId]
      ,[FastMethod]
      ,[FastDF]
      ,[ProtocolId]) VALUES (1
	  ,'0303'
	  ,'Std-2'
	  ,3
	  ,1
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'NewCal'
	  ,'082423142135' --analysis
	  ,''
	  ,'DC9417D8-0A1D-475C-8024-88B16EA0AF0D' --sequenceid
	  ,'08/24/2023 14:22:47'
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,'S5_VL_D1.fast'
	  ,1
	  ,1);

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_DATA';
	INSERT INTO [dbo].[SEQUENCE_DATA] ([Id]
      ,[UserDevice]
      ,[User]
      ,[Instrument]
      ,[RunType]
      ,[Status]
      ,[CalType]
      ,[CalId]
      ,[Calibration]
      ,[Analysis]
      ,[AnalysisStd]
      ,[Index]
      ,[SequenceId]
      ,[DateTime]
      ,[Description]
      ,[SolutionType]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[StdId]
      ,[SampleType]
      ,[Priority]
      ,[Blank]
      ,[Wash]
      ,[Repetition]
      ,[RepNum]
      ,[StdBlank]
      ,[StdWash]
      ,[FastMethod]
      ,[SampleMethod]
      ,[DilutionFactor]
      ,[SequenceWash]
      ,[SampleTypeWash]
      ,[BatchFile]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[Replicate1]
      ,[Replicate2]
      ,[Replicate3]
      ,[MeanValue]
      ,[RSD]
      ,[Concentration]
      ,[Slope]
      ,[Intercept]
      ,[RS2]) VALUES (1
	  ,'0303'
	  ,'ESI\Testing'
	  ,1
	  ,'SC'
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,'082423142135'
	  ,''
	  ,3
	  ,'DC9417D8-0A1D-475C-8024-88B16EA0AF0D'
	  ,'08/24/2023 14:25:47'
	  ,'Std-2'
	  ,'CalStandard'
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,1
	  ,'Testing'
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,'S5_VL_D1.fast'
	  ,''
	  ,1
	  ,0
	  ,0
	  ,''
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'123'
	  ,'132'
	  ,'321'
	  ,'214'
	  ,'0.99'
	  ,'1.32'
	  ,'21'
	  ,'4.2'
	  ,'0.98594');

	INSERT INTO expected VALUES ('08/24/2023 14:25:47');
	INSERT INTO actual VALUES ([dbo].[getSEQUENCE_DateTime](@sequenceId, @description));

	UPDATE [dbo].[SEQUENCE_LIST] SET [AnalysisStd] = '123456' WHERE Id = 1;
	UPDATE [dbo].[SEQUENCE_DATA] SET [AnalysisStd] = '123456' WHERE Id = 1;

	--has a possibility to fail if this proc takes too long. havent run into any issues yet. 
	INSERT INTO expected VALUES (format(getdate(), 'MM/dd/yyyy HH:mm:ss'));
	INSERT INTO actual VALUES ([dbo].[getSEQUENCE_DateTime](@sequenceId, @description));

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';