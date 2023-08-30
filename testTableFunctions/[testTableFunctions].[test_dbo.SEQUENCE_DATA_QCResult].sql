ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_QCResult]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis	VARCHAR(12);	SET @analysis = 'analysisID';
	DECLARE @analysisStd	VARCHAR(12);	SET @analysisStd = '';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';
	DECLARE @index		VARCHAR(12);	SET @index = '3';
	DECLARE @qcId		INT;			SET @qcId = 1;

	CREATE TABLE expected ([QCId] INT
	,[QCName] VARCHAR(50)
	,[QCType] VARCHAR(50)
	,[Priority] TINYINT
	,[QCStockId] INT
	,[Index] VARCHAR(12)
	,[Analyte] VARCHAR(10)
	,[Mass] VARCHAR(3)
	,[Mode] VARCHAR(10)
	,[LimitType] VARCHAR(20)
	,[LimitFormat] VARCHAR(20)
	,[Result] VARCHAR(5)
	,[MinResult] VARCHAR(10)
	,[MaxResult] VARCHAR(10)
	,[Details] VARCHAR(500));

	CREATE TABLE actual ([QCId] INT
	,[QCName] VARCHAR(50)
	,[QCType] VARCHAR(50)
	,[Priority] TINYINT
	,[QCStockId] INT
	,[Index] VARCHAR(12)
	,[Analyte] VARCHAR(10)
	,[Mass] VARCHAR(3)
	,[Mode] VARCHAR(10)
	,[LimitType] VARCHAR(20)
	,[LimitFormat] VARCHAR(20)
	,[Result] VARCHAR(5)
	,[MinResult] VARCHAR(10)
	,[MaxResult] VARCHAR(10)
	,[Details] VARCHAR(500));

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
	  ,'08/30/2023 16:21:03');

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
	  ,'08/30/2023 14:18:03'
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
	  ,'08/30/2023 14:26:03'
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
	  ,'50'
	  ,'45'
	  ,'55'
	  ,'50'
	  ,'12'
	  ,'2.4543'
	  ,'1.4738'
	  ,'0.875'
	  ,'0.99998');
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
	  ,'08/30/2023 14:34:03'
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
	  ,'200'
	  ,'215'
	  ,'185'
	  ,'200'
	  ,'5'
	  ,'5.323'
	  ,'1.8746'
	  ,'0.6574'
	  ,'0.99998');
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
	  ,'08/30/2023 14:34:03'
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
	  ,'1100'
	  ,'1000'
	  ,'900'
	  ,'1000'
	  ,'3.43'
	  ,'11.231'
	  ,'1.947'
	  ,'0.4231'
	  ,'0.9999');

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
	  ,3
	  ,1);

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
	  ,'2000'
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
	  ,'2000'
	  ,'ppb'
	  ,''
	  ,'50'
	  ,'190'
	  ,'1100'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	EXEC tSQLt.FakeTable 'dbo', 'SolutionDATA';
	INSERT INTO [dbo].[SolutionDATA] ([Id]
      ,[Name]
      ,[TypeId]
      ,[Type]
      ,[Description]
      ,[Part]
      ,[Matrix]
      ,[Acid]
      ,[TraxID]
      ,[Unit]
      ,[FastMethod]
      ,[H]
      ,[He]
      ,[Li]
      ,[Be]
      ,[B]
      ,[C]
      ,[N]
      ,[O]
      ,[F]
      ,[Ne]
      ,[Na]
      ,[Mg]
      ,[Al]
      ,[Si]
      ,[P]
      ,[S]
      ,[Cl]
      ,[K]
      ,[Ar]
      ,[Ca]
      ,[Sc]
      ,[Ti]
      ,[V]
      ,[Cr]
      ,[Mn]
      ,[Fe]
      ,[Co]
      ,[Ni]
      ,[Cu]
      ,[Zn]
      ,[Ga]
      ,[Ge]
      ,[As]
      ,[Se]
      ,[Br]
      ,[Kr]
      ,[Rb]
      ,[Sr]
      ,[Y]
      ,[Zr]
      ,[Nb]
      ,[Tc]
      ,[Mo]
      ,[Ru]
      ,[Rh]
      ,[Pd]
      ,[Ag]
      ,[Cd]
      ,[In]
      ,[Sn]
      ,[Sb]
      ,[Te]
      ,[I]
      ,[Xe]
      ,[Cs]
      ,[Ba]
      ,[La]
      ,[Ce]
      ,[Pr]
      ,[Pm]
      ,[Nd]
      ,[Sm]
      ,[Eu]
      ,[Gd]
      ,[Tb]
      ,[Dy]
      ,[Ho]
      ,[Er]
      ,[Tm]
      ,[Yb]
      ,[Lu]
      ,[Hf]
      ,[Ta]
      ,[W]
      ,[Re]
      ,[Os]
      ,[Ir]
      ,[Pt]
      ,[Au]
      ,[Hg]
      ,[Tl]
      ,[Pb]
      ,[Bi]
      ,[At]
      ,[Po]
      ,[Rn]
      ,[Fr]
      ,[Ra]
      ,[Ac]
      ,[Pa]
      ,[Th]
      ,[Np]
      ,[U]
      ,[Pu]
      ,[Am]
      ,[Cm]
      ,[Bk]
      ,[Cf]
      ,[Es]
      ,[Fm]
      ,[Md]
      ,[No]
      ,[Lr]) VALUES (1
	  ,'Testing_Sol'
	  ,0
	  ,'Calibration'
	  ,''
	  ,''
	  ,''
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'2000'
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
	  ,'');

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
	  ,'imaversionID'
	  ,1
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'RS2'
	  ,'1500'
	  ,'2000'
	  ,'Absolute'
	  ,'0');

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_DATA_QCResult](@analysis, @analysisStd, @sequenceId, @index, @qcId);

	INSERT INTO expected([QCId]
	,[QCName] 
	,[QCType] 
	,[Priority] 
	,[QCStockId] 
	,[Index] 
	,[Analyte]
	,[Mass] 
	,[Mode]
	,[LimitType] 
	,[LimitFormat] 
	,[Result] 
	,[MinResult] 
	,[MaxResult] 
	,[Details]) VALUES (1
	,'TestingQC'
	,'Calibration'
	,1
	,0
	,3
	,'Li'
	,'7'
	,'Hot'
	,'RS2'
	,'Absolute'
	,'Under'
	,''
	,''
	,'');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';