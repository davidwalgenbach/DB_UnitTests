ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_REALTIME]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis	VARCHAR(12);	SET @analysis = 'analysisID';

	CREATE TABLE expected ([Index] TINYINT
		,[SeqType]		VARCHAR(20)
		,[CalType]		VARCHAR(20)
		,[Description]	VARCHAR(50)
		,[Analysis]		VARCHAR(12)
		,[AnalysisStd]	VARCHAR(12)
		,[SequenceId]	VARCHAR(36)
		,[TraxId]		VARCHAR(20));


	CREATE TABLE actual ([Index] TINYINT
		,[SeqType]		VARCHAR(20)
		,[CalType]		VARCHAR(20)
		,[Description]	VARCHAR(50)
		,[Analysis]		VARCHAR(12)
		,[AnalysisStd]	VARCHAR(12)
		,[SequenceId]	VARCHAR(36)
		,[TraxId]		VARCHAR(20));

	EXEC tSQLt.FakeTable 'dbo', 'UserDeviceSTATUS';
	INSERT INTO [dbo].[UserDeviceSTATUS] ([UserId]
      ,[DeviceId]
      ,[DeviceCode]
      ,[UserDevice]
      ,[LoginName]
      ,[HostName]
      ,[UpdateTime]
      ,[Status]
      ,[Rack]
      ,[Vial]
      ,[Execute]
      ,[RunType]
      ,[CalType]
      ,[Analysis]
      ,[SequenceId]
      ,[Description]
      ,[Params]
      ,[Interrupt]
      ,[LoginTime]) VALUES (3
	  ,3
	  ,''
	  ,'0303'
	  ,'ESI\Testing'
	  ,'W-W10-Testing'
	  ,'08/31/2023 11:22:34'
	  ,''
	  ,''
	  ,''
	  ,0
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'08/31/2023 11:22:34');

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
	  ,'analysisID'
	  ,''
	  ,1
	  ,'imasequenceID'
	  ,'08/31/2023 11:26:34'
	  ,'Std-0'
	  ,'CalBlank'
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
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0'
	  ,'0');
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
      ,[RS2]) VALUES (2
	  ,'0303'
	  ,'ESI\Testing'
	  ,1
	  ,'SC'
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,'analysisID'
	  ,''
	  ,2
	  ,'imasequenceID'
	  ,'08/31/2023 11:34:34'
	  ,'Std-1'
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
	  ,'45'
	  ,'50'
	  ,'55'
	  ,'50'
	  ,'13.21'
	  ,'0.75342'
	  ,'1.1231'
	  ,'0.589'
	  ,'0.56473');
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
      ,[RS2]) VALUES (3
	  ,'0303'
	  ,'ESI\Testing'
	  ,1
	  ,'SC'
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,'analysisID'
	  ,''
	  ,3
	  ,'imasequenceID'
	  ,'08/31/2023 11:34:34'
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
	  ,'129'
	  ,'126'
	  ,'126'
	  ,'9.54'
	  ,'2.12314'
	  ,'1.241'
	  ,'1.454'
	  ,'0.7685');
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
      ,[RS2]) VALUES (4
	  ,'0303'
	  ,'ESI\Testing'
	  ,1
	  ,'SC'
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,'analysisID'
	  ,''
	  ,4
	  ,'imasequenceID'
	  ,'08/31/2023 11:42:34'
	  ,'Std-3'
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
	  ,'255'
	  ,'250'
	  ,'245'
	  ,'250'
	  ,'15.523'
	  ,'1.897'
	  ,'3.5'
	  ,'2.1241'
	  ,'0.8537');
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
      ,[RS2]) VALUES (5
	  ,'0303'
	  ,'ESI\Testing'
	  ,1
	  ,'SC'
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,'analysisID'
	  ,''
	  ,5
	  ,'imasequenceID'
	  ,'08/31/2023 11:42:34'
	  ,'0101'
	  ,'Sample'
	  ,'0101'
	  ,'1'
	  ,'1'
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
	  ,'12'
	  ,'15'
	  ,'18'
	  ,'15'
	  ,'21.23'
	  ,'0.4213'
	  ,'0'
	  ,'0'
	  ,'12.525');

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
	  ,'SC'
	  ,1
	  ,1
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'NewCal'
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,'08/31/2023 11:26:34'
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

	  INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_DATA_REALTIME](@analysis);

	  INSERT INTO expected ([Index]
		,[SeqType]		
		,[CalType]		
		,[Description]	
		,[Analysis]		
		,[AnalysisStd]	
		,[SequenceId]	
		,[TraxId]) VALUES (1
		,'NewCal'
		,'EXTERNAL'
		,'SC'
		,'analysisID'
		,''
		,'imasequenceID'
		,'0101');

	  EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';