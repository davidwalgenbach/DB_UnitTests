ALTER PROCEDURE testScalarFunctions.[test_dbo.getStatus]
AS
BEGIN
	DECLARE @actual		VARCHAR(50);
	DECLARE @expected	VARCHAR(50);	SET @expected = 3;
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = '5B0972AE-8500-4A9C-8826-487C6F29C57F';
	DECLARE @index		INT;			SET @index = 1;
	DECLARE @childcount TINYINT;		SET @childcount = 1;

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_LIST_2';
	INSERT INTO [dbo].[SEQUENCE_LIST_2] ([Id]
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
      ,[BarCode]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[Calibration]
      ,[CalId]
      ,[SyringeGroup]
      ,[Unit]
      ,[FastMethod]
      ,[FastDF]
      ,[Analysis]
      ,[AnalysisStd]
      ,[SequenceId]
      ,[DateTime]
      ,[ProtocolId]
      ,[ReqType]
      ,[Line]
      ,[Material]
      ,[SamplingPoint]
      ,[Note1]
      ,[Note2]) VALUES (1
	  ,'0303'
	  ,'EXTERNAL'
	  ,'Sample'
	  ,1
	  ,1
	  ,0
	  ,3
	  ,'0101'
	  ,'1'
	  ,'1'
	  ,'0101'
	  ,''
	  ,'Testing'
	  ,1
	  ,0
	  ,'Testing_Cal'
	  ,1
	  ,1
	  ,'ppq'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'082523091523'
	  ,''
	  ,'5B0972AE-8500-4A9C-8826-487C6F29C57F'
	  ,'08/25/2023 09:15:34'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	SET @actual = [dbo].[getStatus](@sequenceId, @index, @childcount);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';