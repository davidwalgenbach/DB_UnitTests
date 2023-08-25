ALTER PROCEDURE testScalarFunctions.[test_dbo.getSequenceIndex]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE expected([index] VARCHAR(3));
	CREATE TABLE actual([index] VARCHAR(3));

	DECLARE @analysis	VARCHAR(12);	SET @analysis = '082423153832';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceID = '8FF0C915-3B7F-4B79-B541-3D28BB00BC0B';

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_DATA_2';
	INSERT INTO [dbo].[SEQUENCE_DATA_2] ([Id]
      ,[Index]
      ,[UserId]
      ,[DeviceId]
      ,[Instrument]
      ,[Status]
      ,[SequenceId]
      ,[Analysis]
      ,[Execution]
      ,[DateTime]
      ,[Description]
      ,[SolutionType]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[SampleType]
      ,[Order]
      ,[FastMethod]
      ,[SampleMethod]
      ,[WashMethod]
      ,[DilutionFactor]
      ,[ProtocolId]
      ,[CalType]
      ,[CalId]
      ,[Calibration]
      ,[StdId]
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
	  ,1
	  ,'03'
	  ,'03'
	  ,1
	  ,1
	  ,'8FF0C915-3B7F-4B79-B541-3D28BB00BC0B' --sequenceID
	  ,'082423153832' --Analysis
	  ,1
	  ,'08/24/2023 15:36:33'
	  ,'Std-0'
	  ,'CalStandard'
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,'Testing'
	  ,1 -- Order??
	  ,'S5_VL_D1.fast'
	  ,''
	  ,''
	  ,1
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'123'
	  ,'142'
	  ,'134'
	  ,'130'
	  ,'0.9847'
	  ,'1.231'
	  ,'21'
	  ,'1.2'
	  ,'0.999483');
	INSERT INTO [dbo].[SEQUENCE_DATA_2] ([Id]
      ,[Index]
      ,[UserId]
      ,[DeviceId]
      ,[Instrument]
      ,[Status]
      ,[SequenceId]
      ,[Analysis]
      ,[Execution]
      ,[DateTime]
      ,[Description]
      ,[SolutionType]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[SampleType]
      ,[Order]
      ,[FastMethod]
      ,[SampleMethod]
      ,[WashMethod]
      ,[DilutionFactor]
      ,[ProtocolId]
      ,[CalType]
      ,[CalId]
      ,[Calibration]
      ,[StdId]
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
	  ,1
	  ,'03'
	  ,'03'
	  ,1
	  ,1
	  ,'8FF0C915-3B7F-4B79-B541-3D28BB00BC0A' --sequenceID
	  ,'082423153832' --Analysis
	  ,1
	  ,'08/24/2023 15:44:33'
	  ,'Std-0'
	  ,'CalStandard'
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,'Testing_1'
	  ,1 -- Order??
	  ,'S5_VL_D1.fast'
	  ,''
	  ,''
	  ,1
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'Testing_Cal'
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'123'
	  ,'142'
	  ,'134'
	  ,'130'
	  ,'0.9847'
	  ,'1.231'
	  ,'21'
	  ,'1.2'
	  ,'0.999483');

	INSERT INTO actual VALUES([dbo].[getSequenceIndex](@analysis, @sequenceId));
	INSERT INTO expected VALUES('1');
	SET @sequenceId = '8FF0C915-3B7F-4B79-B541-3D28BB00BC0A';
	INSERT INTO actual VALUES([dbo].[getSequenceIndex](@analysis, @sequenceId));
	INSERT INTO expected VALUES('1');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';