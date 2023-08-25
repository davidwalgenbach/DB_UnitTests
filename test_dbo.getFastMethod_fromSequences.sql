CREATE PROCEDURE testScalarFunctions.[test_dbo.getFastMethod_fromSequences]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE expected(FastMethod VARCHAR(50));
	CREATE TABLE actual(FastMethod VARCHAR(50));
	DECLARE @description VARCHAR(50);	SET @description = 'Std-2';
	DECLARE @sequenceId VARCHAR(36);	SET @sequenceId = '75569F05-EB82-4334-97FC-C334147E46D5';
	DECLARE @analysis VARCHAR(12);	SET @analysis = '082323093432';

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_LIST_1';
	INSERT INTO [dbo].[SEQUENCE_LIST_1] ([Id]
      ,[UserDevice]
      ,[CalType]
      ,[RowType]
      ,[SeqNum]
      ,[Index]
      ,[RepNum]
      ,[Status]
      ,[TraxId]
      ,[Rack]
      ,[Vial]
      ,[Description]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[Calibration]
      ,[CalId]
      ,[Point]
      ,[Value]
      ,[StdId]
      ,[SyringeGroup]
      ,[Unit]
      ,[FastMethod]
      ,[FastDF]
      ,[Analysis]
      ,[AnalysisStd]
      ,[SequenceId]
      ,[DateTime]
      ,[ProtocolId]) VALUES (1
	  ,'0302'
	  ,'EXTERNAL'
	  ,'Standard'
	  ,1
	  ,3
	  ,0
	  ,1
	  ,'0101'
	  ,'R'
	  ,'2'
	  ,'Std-2'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,2
	  ,1.5
	  ,1
	  ,2
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'082323093432'
	  ,''
	  ,'75569F05-EB82-4334-97FC-C334147E46D5'
	  ,'08/23/2023 09:34:21'
	  ,1);

	INSERT INTO actual VALUES([dbo].[getFastMethod_fromSequences](@description, @sequenceId, @analysis));

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
	  ,'0302'
	  ,'SC'
	  ,1
	  ,1
	  ,1
	  ,'EXTERNAL'
	  ,1
	  ,'NewCal'
	  ,'082323093935'
	  ,''
	  ,'5B0972AE-8500-4A9C-8826-487C6F29C57F'
	  ,'08/23/2023 09:39:35'
	  ,'0101'
	  ,'1'
	  ,'1'
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,'S5_SA_C2.fast'
	  ,1
	  ,1);

	SET @description = 'SC';
	SET @analysis = '082323093935';
	SET @sequenceId = '5B0972AE-8500-4A9C-8826-487C6F29C57F';

	INSERT INTO actual VALUES([dbo].[getFastMethod_fromSequences](@description, @sequenceId, @analysis));

	INSERT INTO expected VALUES('S5_VL_D1.fast');
	INSERT INTO expected VALUES('S5_SA_C2.fast');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';