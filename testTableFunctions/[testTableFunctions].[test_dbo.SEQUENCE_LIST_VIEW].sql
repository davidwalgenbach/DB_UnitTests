ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_LIST_VIEW]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis	VARCHAR(12);	SET @analysis = 'analysisID';

	CREATE TABLE expected ([Id]	INT
						,UserDevice	VARCHAR(4)
						,[Description]	VARCHAR(50)
						,[Index]		INT
						,StartRow		TINYINT
						,[Status]		SMALLINT
						,CalType		VARCHAR(20)
						,CalTypeId		TINYINT
						,SeqType		VARCHAR(20)
						,Analysis		VARCHAR(12)
						,AnalysisStd	VARCHAR(12)
						,SequenceId		VARCHAR(36)
						,[DateTime]		VARCHAR(20)
						,TraxId			VARCHAR(20)
						,Rack			VARCHAR(2)
						,Vial			VARCHAR(2)
						,SampleType		VARCHAR(50)
						,SampleTypeId	INT
						,[Priority]		TINYINT
						,Calibration	VARCHAR(50)
						,CalId			SMALLINT
						,FastMethod		VARCHAR(50)
						,FastDF			VARCHAR(10)
						,ProtocolId		VARCHAR(20));

	CREATE TABLE actual ([Id]	INT
						,UserDevice	VARCHAR(4)
						,[Description]	VARCHAR(50)
						,[Index]		INT
						,StartRow		TINYINT
						,[Status]		SMALLINT
						,CalType		VARCHAR(20)
						,CalTypeId		TINYINT
						,SeqType		VARCHAR(20)
						,Analysis		VARCHAR(12)
						,AnalysisStd	VARCHAR(12)
						,SequenceId		VARCHAR(36)
						,[DateTime]		VARCHAR(20)
						,TraxId			VARCHAR(20)
						,Rack			VARCHAR(2)
						,Vial			VARCHAR(2)
						,SampleType		VARCHAR(50)
						,SampleTypeId	INT
						,[Priority]		TINYINT
						,Calibration	VARCHAR(50)
						,CalId			SMALLINT
						,FastMethod		VARCHAR(50)
						,FastDF			VARCHAR(10)
						,ProtocolId		VARCHAR(20));

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
	  ,'09/06/2023 10:02:43'
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
	  ,''
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
	  ,'09/06/2023 10:10:43'
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
	  ,''
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'4'
	  ,'5'
	  ,'6'
	  ,'5'
	  ,'12'
	  ,'1'
	  ,'0.5443'
	  ,'1.2'
	  ,'0.7342');
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
	  ,'09/06/2023 10:18:43'
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
	  ,''
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'11'
	  ,'10'
	  ,'9'
	  ,'10'
	  ,'3.5'
	  ,'5'
	  ,'0.864'
	  ,'0.8'
	  ,'0.86584');

	EXEC tSQLt.FakeTable 'dbo', 'SampleType';
	INSERT INTO [dbo].[SampleType] ([Id]
      ,[Name]
      ,[TypeId]
      ,[EnableNano]
      ,[EnablePrepMass]) VALUES (1
	  ,'Testing'
	  ,0
	  ,0
	  ,0);

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_LIST_VIEW](@analysis);

	INSERT INTO expected ([Id]
	,UserDevice
	,[Description]
	,[Index]
	,StartRow
	,[Status]
	,CalType
	,CalTypeId
	,SeqType
	,Analysis
	,AnalysisStd
	,SequenceId
	,[DateTime]
	,TraxId
	,Rack
	,Vial
	,SampleType
	,SampleTypeId
	,[Priority]
	,Calibration
	,CalId
	,FastMethod
	,FastDF
	,ProtocolId) VALUES (1
	,'0303'
	,'SC'
	,1
	,1
	,1
	,'EXTERNAL'
	,0
	,'NewCal'
	,'analysisID'
	,''
	,'imasequenceID'
	,'09/06/2023 10:02:43'
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
	,0);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';