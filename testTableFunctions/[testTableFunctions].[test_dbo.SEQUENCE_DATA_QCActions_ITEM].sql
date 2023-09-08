ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_QCActions_ITEM]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis		VARCHAR(12);	SET @analysis = 'analysisID';
	DECLARE @analysisStd	VARCHAR(12);	SET @analysisStd = '';
	DECLARE @sequenceId		VARCHAR(36);	SET @sequenceId = 'imasequenceID';
	DECLARE @index			TINYINT;		SET @index = 2;

	CREATE TABLE expected (VersionId	VARCHAR(36)
						,ProtocolId		INT
						,QCId			INT
						,[Priority]		TINYINT
						,GroupIndex		TINYINT
						,[Index]		TINYINT
						,OriginIndex	TINYINT
						,ActionId		INT
						,ActionName		VARCHAR(50)
						,ActionType		VARCHAR(50)
						,ActionValue	VARCHAR(50)
						,Attempt		VARCHAR(5)
						,NotifyLevel	VARCHAR(10));

	CREATE TABLE actual (VersionId	VARCHAR(36)
						,ProtocolId		INT
						,QCId			INT
						,[Priority]		TINYINT
						,GroupIndex		TINYINT
						,[Index]		TINYINT
						,OriginIndex	TINYINT
						,ActionId		INT
						,ActionName		VARCHAR(50)
						,ActionType		VARCHAR(50)
						,ActionValue	VARCHAR(50)
						,Attempt		VARCHAR(5)
						,NotifyLevel	VARCHAR(10));

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_VERSIONS';
	INSERT INTO [dbo].[SEQUENCE_VERSIONS] ([Id]
						,[UserDevice]
						,[Analysis]
						,[SequenceId]
						,[VersionId]
						,[DateTime]) VALUES (1
						,'0303'
						,'analysisID'
						,'imasequenceID'
						,'imaversionID'
						,'09/07/2023 10:18:12');

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
	  ,'09/08/2023 11:51:12'
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
	  ,''
	  ,''
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
	  ,'09/08/2023 11:59:12'
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
	  ,''
	  ,''
	  ,''
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'10'
	  ,'11'
	  ,'9'
	  ,'10'
	  ,'2.3'
	  ,'1.523'
	  ,'0.2123'
	  ,'0.0123'
	  ,'0.5423');
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
	  ,'09/08/2023 12:07:12'
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
	  ,''
	  ,''
	  ,''
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'125'
	  ,'120'
	  ,'130'
	  ,'125'
	  ,'3.5'
	  ,'5.512'
	  ,'0.4512'
	  ,'0.2412'
	  ,'0.7452');
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
	  ,'09/08/2023 12:15:12'
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
	  ,''
	  ,''
	  ,''
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'351'
	  ,'350'
	  ,'349'
	  ,'350'
	  ,'1.1'
	  ,'10.234'
	  ,'1.425'
	  ,'2.523'
	  ,'0.88542');
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
	  ,'09/08/2023 12:24:12'
	  ,'Std-4'
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
	  ,''
	  ,''
	  ,''
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'654'
	  ,'658'
	  ,'656'
	  ,'656'
	  ,'2.4'
	  ,'20.213'
	  ,'3.532'
	  ,'5.2'
	  ,'0.98952');
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
      ,[RS2]) VALUES (6
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
	  ,6
	  ,'imasequenceID'
	  ,'09/08/2023 12:32:12'
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
	  ,''
	  ,''
	  ,''
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'0.241'
	  ,'1.24'
	  ,'1.1'
	  ,'0.768'
	  ,'0.63'
	  ,'0.0421'
	  ,'0'
	  ,'0'
	  ,'0');

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
	  ,'TestQC'
	  ,2
	  ,'Calibration'
	  ,'RS2'
	  ,1
	  ,1
	  ,0
	  ,''
	  ,''
	  ,0
	  ,0
	  ,1
	  ,1);

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_DATA_QCHistory';
	INSERT INTO [dbo].[SEQUENCE_DATA_QCHistory] ([Id]
      ,[SEQUENCE_DATA_Id]
      ,[Analysis]
      ,[AnalysisStd]
      ,[SequenceId]
      ,[Index]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[ProtocolId]
      ,[QCId]
      ,[LimitType]
      ,[LimitFormat]
      ,[DateTime]
      ,[Result]
      ,[MinResult]
      ,[MaxResult]
      ,[Details]
      ,[QCActionId]) VALUES (1
	  ,2
	  ,'analysisID'
	  ,''
	  ,'imasequenceID'
	  ,2
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,1
	  ,1
	  ,''
	  ,''
	  ,'09/08/2023 11:59:53'
	  ,'Under'
	  ,''
	  ,''
	  ,''
	  ,0);

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_QCActionDATA';
	INSERT INTO [dbo].[SEQUENCE_QCActionDATA] ([Id]
      ,[VersionId]
      ,[ProtocolId]
      ,[QCId]
      ,[Priority]
      ,[GroupIndex]
      ,[Index]
      ,[ActionId]
      ,[ActionName]
      ,[ActionType]
      ,[ActionValue]
      ,[Repeat]
      ,[NotifyLevel]) VALUES (1
	  ,'imaversionID'
	  ,1
	  ,1
	  ,1
	  ,1
	  ,1
	  ,'1'
	  ,'Ignore'
	  ,'Delimiter'
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_DATA_QCActions_ITEM](@analysis, @analysisStd, @sequenceId, @index);

	INSERT INTO expected (VersionId
	,ProtocolId	
	,QCId	
	,[Priority]	
	,GroupIndex
	,[Index]
	,OriginIndex
	,ActionId
	,ActionName
	,ActionType
	,ActionValue
	,Attempt
	,NotifyLevel) VALUES ('imaversionID'
	,1
	,1
	,1
	,1
	,1
	,2
	,1
	,'Ignore'
	,'Delimiter'
	,''
	,1
	,'');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';