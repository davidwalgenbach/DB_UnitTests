CREATE PROCEDURE testScalarFunctions.[test_dbo.getStdVal]
AS
BEGIN
	DECLARE @actual VARCHAR(10);
	DECLARE @expected VARCHAR(10);	SET @expected = '1.5';
	DECLARE @sequenceId VARCHAR(36);	SET @sequenceId = 'imasequenceID';
	DECLARE @point	TINYINT;	SET @point = 2;

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
	  ,'0303'
	  ,'EXTERNAL'
	  ,'Standard'
	  ,1
	  ,3
	  ,0
	  ,3
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
	  ,'1.5'
	  ,2
	  ,1
	  ,'ppq'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,'082523102831'
	  ,''
	  ,'imasequenceID'
	  ,'08/25/2023 10:28:34'
	  ,1);

	SET @actual = [dbo].[getStdVal](@sequenceId, @point);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';