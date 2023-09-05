ALTER PROCEDURE testTableFunctions.[test_dbo.SEQUENCE_DATA_STDSAMPLES]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	DECLARE @analysis	VARCHAR(12);	SET @analysis = 'analysisID';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	CREATE TABLE expected (Id		INT
					,[Index]		INT
					,[Description]	VARCHAR(50)
					,SolutionType	VARCHAR(20)
					,TraxId			VARCHAR(30)
					,CalId			TINYINT
					,Calibration	VARCHAR(50)
					,SampleType		VARCHAR(50)
					,[Priority]		TINYINT
					,DilutionFactor	VARCHAR(10)
					
					,[DateTime]		VARCHAR(20)
					,CalType		VARCHAR(10)
					,Analysis		VARCHAR(12)
					,AnalysisStd	VARCHAR(12)
					,SequenceId		VARCHAR(36)
					,RowType		VARCHAR(30)

					,Analyte		VARCHAR(10)
					,Mass			VARCHAR(3)
					,Mode			VARCHAR(10)
					,Replicate1		VARCHAR(24)
					,Replicate2		VARCHAR(24)
					,Replicate3		VARCHAR(24)
					,MeanValue		VARCHAR(24)
					,RSD			VARCHAR(24)
					,Concentration	VARCHAR(24)
					,Slope			VARCHAR(24)
					,Intercept		VARCHAR(24)
					,RS2			VARCHAR(24)
					
					,[User]			VARCHAR(50)
					,Instrument		TINYINT

					,Auto_Data1		VARCHAR(20)
					,Auto_Data2		VARCHAR(20)
					,Auto_Data3		VARCHAR(20)
					,Auto_Data4		VARCHAR(20)
					,Manual_Data1	VARCHAR(50)
					,Manual_Data2	VARCHAR(50));

	CREATE TABLE actual (Id			INT
					,[Index]		INT
					,[Description]	VARCHAR(50)
					,SolutionType	VARCHAR(20)
					,TraxId			VARCHAR(30)
					,CalId			TINYINT
					,Calibration	VARCHAR(50)
					,SampleType		VARCHAR(50)
					,[Priority]		TINYINT
					,DilutionFactor	VARCHAR(10)
					
					,[DateTime]		VARCHAR(20)
					,CalType		VARCHAR(10)
					,Analysis		VARCHAR(12)
					,AnalysisStd	VARCHAR(12)
					,SequenceId		VARCHAR(36)
					,RowType		VARCHAR(30)

					,Analyte		VARCHAR(10)
					,Mass			VARCHAR(3)
					,Mode			VARCHAR(10)
					,Replicate1		VARCHAR(24)
					,Replicate2		VARCHAR(24)
					,Replicate3		VARCHAR(24)
					,MeanValue		VARCHAR(24)
					,RSD			VARCHAR(24)
					,Concentration	VARCHAR(24)
					,Slope			VARCHAR(24)
					,Intercept		VARCHAR(24)
					,RS2			VARCHAR(24)
					
					,[User]			VARCHAR(50)
					,Instrument		TINYINT

					,Auto_Data1		VARCHAR(20)
					,Auto_Data2		VARCHAR(20)
					,Auto_Data3		VARCHAR(20)
					,Auto_Data4		VARCHAR(20)
					,Manual_Data1	VARCHAR(50)
					,Manual_Data2	VARCHAR(50));

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

	INSERT INTO actual SELECT * FROM [dbo].[SEQUENCE_DATA_STDSAMPLES](@analysis, @sequenceId);

	INSERT INTO expected (Id		
					,[Index]		
					,[Description]	
					,SolutionType	
					,TraxId			
					,CalId			
					,Calibration	
					,SampleType		
					,[Priority]		
					,DilutionFactor	
					
					,[DateTime]		
					,CalType		
					,Analysis		
					,AnalysisStd	
					,SequenceId		
					,RowType		

					,Analyte		
					,Mass			
					,Mode			
					,Replicate1		
					,Replicate2		
					,Replicate3		
					,MeanValue		
					,RSD			
					,Concentration	
					,Slope			
					,Intercept		
					,RS2			
					
					,[User]			
					,Instrument		

					,Auto_Data1		
					,Auto_Data2		
					,Auto_Data3		
					,Auto_Data4		
					,Manual_Data1	
					,Manual_Data2) VALUES (1
					,1
					,'Std-0'
					,'CalBlank'
					,'0101'
					,1
					,'Testing_Cal'
					,'Testing'
					,0
					,1
					,'08/31/2023 11:26:34'
					,'EXTERNAL'
					,'analysisID'
					,''
					,'imasequenceID'
					,'CalStandard'
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
					,'0'
					,'ESI\Testing'
					,1
					,'AD1'
					,'AD2'
					,'AD3'
					,'AD4'
					,'MD1'
					,'MD2');
	INSERT INTO expected (Id		
					,[Index]		
					,[Description]	
					,SolutionType	
					,TraxId			
					,CalId			
					,Calibration	
					,SampleType		
					,[Priority]		
					,DilutionFactor	
					
					,[DateTime]		
					,CalType		
					,Analysis		
					,AnalysisStd	
					,SequenceId		
					,RowType		

					,Analyte		
					,Mass			
					,Mode			
					,Replicate1		
					,Replicate2		
					,Replicate3		
					,MeanValue		
					,RSD			
					,Concentration	
					,Slope			
					,Intercept		
					,RS2			
					
					,[User]			
					,Instrument		

					,Auto_Data1		
					,Auto_Data2		
					,Auto_Data3		
					,Auto_Data4		
					,Manual_Data1	
					,Manual_Data2) VALUES (2
					,2
					,'Std-1'
					,'CalStandard'
					,'0101'
					,1
					,'Testing_Cal'
					,'Testing'
					,0
					,1
					,'08/31/2023 11:34:34'
					,'EXTERNAL'
					,'analysisID'
					,''
					,'imasequenceID'
					,'CalStandard'
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
					,'0.56473'
					,'ESI\Testing'
					,1
					,'AD1'
					,'AD2'
					,'AD3'
					,'AD4'
					,'MD1'
					,'MD2');
	INSERT INTO expected (Id		
					,[Index]		
					,[Description]	
					,SolutionType	
					,TraxId			
					,CalId			
					,Calibration	
					,SampleType		
					,[Priority]		
					,DilutionFactor	
					
					,[DateTime]		
					,CalType		
					,Analysis		
					,AnalysisStd	
					,SequenceId		
					,RowType		

					,Analyte		
					,Mass			
					,Mode			
					,Replicate1		
					,Replicate2		
					,Replicate3		
					,MeanValue		
					,RSD			
					,Concentration	
					,Slope			
					,Intercept		
					,RS2			
					
					,[User]			
					,Instrument		

					,Auto_Data1		
					,Auto_Data2		
					,Auto_Data3		
					,Auto_Data4		
					,Manual_Data1	
					,Manual_Data2) VALUES (3
					,3
					,'Std-2'
					,'CalStandard'
					,'0101'
					,1
					,'Testing_Cal'
					,'Testing'
					,0
					,1
					,'08/31/2023 11:34:34'
					,'EXTERNAL'
					,'analysisID'
					,''
					,'imasequenceID'
					,'CalStandard'
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
					,'0.7685'
					,'ESI\Testing'
					,1
					,'AD1'
					,'AD2'
					,'AD3'
					,'AD4'
					,'MD1'
					,'MD2');
	INSERT INTO expected (Id		
					,[Index]		
					,[Description]	
					,SolutionType	
					,TraxId			
					,CalId			
					,Calibration	
					,SampleType		
					,[Priority]		
					,DilutionFactor	
					
					,[DateTime]		
					,CalType		
					,Analysis		
					,AnalysisStd	
					,SequenceId		
					,RowType		

					,Analyte		
					,Mass			
					,Mode			
					,Replicate1		
					,Replicate2		
					,Replicate3		
					,MeanValue		
					,RSD			
					,Concentration	
					,Slope			
					,Intercept		
					,RS2			
					
					,[User]			
					,Instrument		

					,Auto_Data1		
					,Auto_Data2		
					,Auto_Data3		
					,Auto_Data4		
					,Manual_Data1	
					,Manual_Data2) VALUES (4
					,4
					,'Std-3'
					,'CalStandard'
					,'0101'
					,1
					,'Testing_Cal'
					,'Testing'
					,0
					,1
					,'08/31/2023 11:42:34'
					,'EXTERNAL'
					,'analysisID'
					,''
					,'imasequenceID'
					,'CalStandard'
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
					,'0.8537'
					,'ESI\Testing'
					,1
					,'AD1'
					,'AD2'
					,'AD3'
					,'AD4'
					,'MD1'
					,'MD2');
	INSERT INTO expected (Id		
					,[Index]		
					,[Description]	
					,SolutionType	
					,TraxId			
					,CalId			
					,Calibration	
					,SampleType		
					,[Priority]		
					,DilutionFactor	
					
					,[DateTime]		
					,CalType		
					,Analysis		
					,AnalysisStd	
					,SequenceId		
					,RowType		

					,Analyte		
					,Mass			
					,Mode			
					,Replicate1		
					,Replicate2		
					,Replicate3		
					,MeanValue		
					,RSD			
					,Concentration	
					,Slope			
					,Intercept		
					,RS2			
					
					,[User]			
					,Instrument		

					,Auto_Data1		
					,Auto_Data2		
					,Auto_Data3		
					,Auto_Data4		
					,Manual_Data1	
					,Manual_Data2) VALUES (5
					,5
					,'0101'
					,'Sample'
					,'0101'
					,1
					,'Testing_Cal'
					,'Testing'
					,0
					,1
					,'08/31/2023 11:42:34'
					,'EXTERNAL'
					,'analysisID'
					,''
					,'imasequenceID'
					,'Sample'
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
					,'12.525'
					,'ESI\Testing'
					,1
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