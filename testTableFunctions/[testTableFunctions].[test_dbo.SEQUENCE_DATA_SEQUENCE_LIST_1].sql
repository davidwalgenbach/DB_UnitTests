ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_SEQUENCE_LIST_1]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis	VARCHAR(12);	SET @analysis = 'analysisID';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected ([Index] INT
		,[Status] TINYINT
		,[UserDevice] VARCHAR(4)
		,[Analysis] VARCHAR(12)
		,[AnalysisStd] VARCHAR(12)
		,[SequenceId] VARCHAR(36)
		,[Description] VARCHAR(50)
		,[SolutionType] VARCHAR(50)
		,[TraxId] VARCHAR(20)
		,[Rack] VARCHAR(2)
		,[Vial] VARCHAR(2)

		,[SampleType] VARCHAR(50)
		,[Priority] TINYINT
		,[FastMethod] VARCHAR(50)
		,[FastDF] VARCHAR(10)
		,[CalType] VARCHAR(20)
		,[BatchFile] VARCHAR(50)
		,[RowType] VARCHAR(30)

		,[WashMethod] VARCHAR(50)
		,[Cal] VARCHAR(50)
		,[CalId] SMALLINT
		,[Point] TINYINT
		,[StdVal] VARCHAR(10)
		,[StdId] TINYINT
		,[SyringeGroup] TINYINT
		,[Unit] VARCHAR(10)

		,[Protocol] VARCHAR(50)
		,[StdStock] VARCHAR(10)
		,[AcidSpk] VARCHAR(10)
		,[AcidVal] VARCHAR(10)
		,[AcidStd] VARCHAR(10)

		,[Auto_Data1] VARCHAR(20)
		,[Auto_Data2] NVARCHAR(10)
		,[Auto_Data3] NVARCHAR(20)
		,[Auto_Data4] NVARCHAR(20)
		,[Manual_Data1] NVARCHAR(50)
		,[Manual_Data2] NVARCHAR(50));

	CREATE TABLE actual ([Index] INT
		,[Status] TINYINT
		,[UserDevice] VARCHAR(4)
		,[Analysis] VARCHAR(12)
		,[AnalysisStd] VARCHAR(12)
		,[SequenceId] VARCHAR(36)
		,[Description] VARCHAR(50)
		,[SolutionType] VARCHAR(50)
		,[TraxId] VARCHAR(20)
		,[Rack] VARCHAR(2)
		,[Vial] VARCHAR(2)
		,[SampleType] VARCHAR(50)
		,[Priority] TINYINT
		,[FastMethod] VARCHAR(50)
		,[FastDF] VARCHAR(10)
		,[CalType] VARCHAR(20)
		,[BatchFile] VARCHAR(50)
		,[RowType] VARCHAR(30)
		,[WashMethod] VARCHAR(50)
		,[Cal] VARCHAR(50)
		,[CalId] SMALLINT
		,[Point] TINYINT
		,[StdVal] VARCHAR(10)
		,[StdId] TINYINT
		,[SyringeGroup] TINYINT
		,[Unit] VARCHAR(10)
		,[Protocol] VARCHAR(50)
		,[StdStock] VARCHAR(10)
		,[AcidSpk] VARCHAR(10)
		,[AcidVal] VARCHAR(10)
		,[AcidStd] VARCHAR(10)
		,[Auto_Data1] VARCHAR(20)
		,[Auto_Data2] NVARCHAR(10)
		,[Auto_Data3] NVARCHAR(20)
		,[Auto_Data4] NVARCHAR(20)
		,[Manual_Data1] NVARCHAR(50)
		,[Manual_Data2] NVARCHAR(50));

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
	  ,'08/31/2023 14:32:34');

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
	  ,'5'
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

	EXEC tSQLt.FakeTable 'dbo', 'BottleDetails';
	INSERT INTO [dbo].[BottleDetails] ([Id]
      ,[UserId]
      ,[User]
      ,[TraxId]
      ,[Status]
      ,[SampleTypeId]
      ,[SampleType]
      ,[ProtocolId]
      ,[SequenceId]
      ,[Analysis]
      ,[DateTime]) VALUES (1
	  ,'3'
	  ,'ESI\Testing'
	  ,'0101'
	  ,1
	  ,1
	  ,'Testing'
	  ,1
	  ,'imasequenceID'
	  ,'analysisID'
	  ,'08/29/2023 13:34:41')

	EXEC tSQLt.FakeTable 'dbo', 'LIMS_DATA';
	INSERT INTO [dbo].[LIMS_DATA] ([Id]
      ,[UserId]
      ,[User]
      ,[TraxID]
      ,[BottleDetails_Id]
      ,[AUTO_DATA_COLUMN_1]
      ,[AUTO_DATA_COLUMN_2]
      ,[AUTO_DATA_COLUMN_3]
      ,[AUTO_DATA_COLUMN_4]
      ,[MANUAL_DATA_COLUMN_1]
      ,[MANUAL_DATA_COLUMN_2]
      ,[TIMESTAMP]
      ,[STATUS_ID]) VALUES (1
	  ,'3'
	  ,'ESI\Testing'
	  ,'0101'
	  ,1
	  ,'AD1'
	  ,'AD2'
	  ,'AD3'
	  ,'AD4'
	  ,'MD1'
	  ,'MD2'
	  ,'08/29/2023 13:34:41'
	  ,1)

	EXEC tSQLt.FakeTable 'dbo', 'SampleTypeDATA';
	INSERT INTO [dbo].[SampleTypeDATA] ([Id]
      ,[SampleTypeId]
      ,[SampleType]
      ,[CalType]
      ,[CalId]
      ,[StdId]
      ,[AcidSpk]
      ,[AcidSoln]
      ,[ProtocolId]
      ,[QCRuleId]
      ,[SampleMethod]
      ,[SampleDF]
      ,[WashMethod]
      ,[Priority]
      ,[StdBlank]
      ,[SampleBlank]
      ,[StdWash]
      ,[StdWashMethod]
      ,[SampleWash]
      ,[SampleWashMethod]
      ,[Repetition]
      ,[LoopSize]
      ,[LoadingType]
      ,[MethodSet]
      ,[PrepMethod]
      ,[PrepDF]
      ,[RouteId]
      ,[Rack1]
      ,[Rack2]
      ,[Rack3]
      ,[Rack4]
      ,[TargetWeight]
      ,[MinWeight]
      ,[MaxWeight]
      ,[Weight]
      ,[DailyDose]
      ,[Comments]) VALUES (1
	  ,1
	  ,'Testing'
	  ,'EXTERNAL'
	  ,1
	  ,1
	  ,1
	  ,1
	  ,1
	  ,0
	  ,''
	  ,1
	  ,''
	  ,0
	  ,0
	  ,0
	  ,0
	  ,''
	  ,0
	  ,''
	  ,0
	  ,15
	  ,'VL'
	  ,'D1'
	  ,''
	  ,''
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	EXEC tSQLt.FakeTable 'dbo', 'CalDATA';
	INSERT INTO [dbo].[CalDATA] ([Id]
      ,[CalId]
      ,[ProtocolId]
      ,[GroupId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[StdId]
      ,[Unit]
      ,[Stock]
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
	  ,1
	  ,1
	  ,0
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,'ppb'
	  ,'1000'
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
	INSERT INTO [dbo].[CalDATA] ([Id]
      ,[CalId]
      ,[ProtocolId]
      ,[GroupId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[StdId]
      ,[Unit]
      ,[Stock]
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
	  ,1
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,'ppb'
	  ,'1000'
	  ,''
	  ,'0.75'
	  ,'2'
	  ,'5'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

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
	  ,'1000'
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
	  ,'1000'
	  ,'ppb'
	  ,''
	  ,'0.75'
	  ,'2'
	  ,'5'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual SELECT [Index], [Status], UserDevice, Analysis, AnalysisStd, SequenceId, [Description], SolutionType, TraxId, Rack, Vial, SampleType, [Priority], FastMethod, FastDF, CalType, BatchFile, RowType, WashMethod, Cal, CalId, Point, StdVal, StdId, SyringeGroup, Unit, Protocol, StdStock, AcidSpk, AcidVal, AcidStd, Auto_Data1, Auto_Data2, Auto_Data3, Auto_Data4, Manual_Data1, Manual_Data2 FROM [dbo].[SEQUENCE_DATA_SEQUENCE_LIST_1](@analysis, @sequenceId);

	INSERT INTO expected([Index]
				,[Status]
				,UserDevice
				,Analysis
				,AnalysisStd
				,SequenceId
				,[Description]
				,SolutionType
				,TraxId
				,Rack
				,Vial
				,SampleType
				,[Priority]
				,FastMethod
				,FastDF
				,CalType
				,BatchFile
				,RowType
				,WashMethod
				,Cal
				,CalId
				,Point
				,StdVal
				,StdId
				,SyringeGroup
				,Unit
				,Protocol
				,StdStock
				,AcidSpk
				,AcidVal
				,AcidStd
				,Auto_Data1
				,Auto_Data2
				,Auto_Data3
				,Auto_Data4
				,Manual_Data1
				,Manual_Data2) VALUES (1
				,1
				,'0303'
				,'analysisID'
				,''
				,'imasequenceID'
				,'Std-0'
				,'CalBlank'
				,'0101'
				,'R'
				,'2'
				,'Testing'
				,0
				,'S5_VL_D1.fast'
				,1
				,'EXTERNAL'
				,''
				,'CalBlank'
				,''
				,'Testing_Cal'
				,1
				,0
				,''
				,1
				,1
				,''
				,'Semiconductor'
				,'1000'
				,1
				,1
				,0
				,'AD1'
				,'AD2'
				,'AD3'
				,'AD4'
				,'MD1'
				,'MD2');
	INSERT INTO expected([Index]
				,[Status]
				,UserDevice
				,Analysis
				,AnalysisStd
				,SequenceId
				,[Description]
				,SolutionType
				,TraxId
				,Rack
				,Vial
				,SampleType
				,[Priority]
				,FastMethod
				,FastDF
				,CalType
				,BatchFile
				,RowType
				,WashMethod
				,Cal
				,CalId
				,Point
				,StdVal
				,StdId
				,SyringeGroup
				,Unit
				,Protocol
				,StdStock
				,AcidSpk
				,AcidVal
				,AcidStd
				,Auto_Data1
				,Auto_Data2
				,Auto_Data3
				,Auto_Data4
				,Manual_Data1
				,Manual_Data2) VALUES (2
				,1
				,'0303'
				,'analysisID'
				,''
				,'imasequenceID'
				,'Std-1'
				,'CalStandard'
				,'0101'
				,'R'
				,'2'
				,'Testing'
				,0
				,'S5_VL_D1.fast'
				,1
				,'EXTERNAL'
				,''
				,'CalStandard'
				,''
				,'Testing_Cal'
				,1
				,0
				,''
				,1
				,1
				,''
				,'Semiconductor'
				,'1000'
				,1
				,1
				,0
				,'AD1'
				,'AD2'
				,'AD3'
				,'AD4'
				,'MD1'
				,'MD2');
	INSERT INTO expected([Index]
				,[Status]
				,UserDevice
				,Analysis
				,AnalysisStd
				,SequenceId
				,[Description]
				,SolutionType
				,TraxId
				,Rack
				,Vial
				,SampleType
				,[Priority]
				,FastMethod
				,FastDF
				,CalType
				,BatchFile
				,RowType
				,WashMethod
				,Cal
				,CalId
				,Point
				,StdVal
				,StdId
				,SyringeGroup
				,Unit
				,Protocol
				,StdStock
				,AcidSpk
				,AcidVal
				,AcidStd
				,Auto_Data1
				,Auto_Data2
				,Auto_Data3
				,Auto_Data4
				,Manual_Data1
				,Manual_Data2) VALUES (3
				,1
				,'0303'
				,'analysisID'
				,''
				,'imasequenceID'
				,'Std-2'
				,'CalStandard'
				,'0101'
				,'R'
				,'2'
				,'Testing'
				,0
				,'S5_VL_D1.fast'
				,1
				,'EXTERNAL'
				,''
				,'CalStandard'
				,''
				,'Testing_Cal'
				,1
				,0
				,''
				,1
				,1
				,''
				,'Semiconductor'
				,'1000'
				,1
				,1
				,0
				,'AD1'
				,'AD2'
				,'AD3'
				,'AD4'
				,'MD1'
				,'MD2');
	INSERT INTO expected([Index]
				,[Status]
				,UserDevice
				,Analysis
				,AnalysisStd
				,SequenceId
				,[Description]
				,SolutionType
				,TraxId
				,Rack
				,Vial
				,SampleType
				,[Priority]
				,FastMethod
				,FastDF
				,CalType
				,BatchFile
				,RowType
				,WashMethod
				,Cal
				,CalId
				,Point
				,StdVal
				,StdId
				,SyringeGroup
				,Unit
				,Protocol
				,StdStock
				,AcidSpk
				,AcidVal
				,AcidStd
				,Auto_Data1
				,Auto_Data2
				,Auto_Data3
				,Auto_Data4
				,Manual_Data1
				,Manual_Data2) VALUES (4
				,1
				,'0303'
				,'analysisID'
				,''
				,'imasequenceID'
				,'Std-3'
				,'CalStandard'
				,'0101'
				,'R'
				,'2'
				,'Testing'
				,0
				,'S5_VL_D1.fast'
				,1
				,'EXTERNAL'
				,''
				,'CalStandard'
				,''
				,'Testing_Cal'
				,1
				,0
				,''
				,1
				,1
				,''
				,'Semiconductor'
				,'1000'
				,1
				,1
				,0
				,'AD1'
				,'AD2'
				,'AD3'
				,'AD4'
				,'MD1'
				,'MD2');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';

