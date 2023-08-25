CREATE PROCEDURE testScalarFunctions.[test_dbo.getReEvaluatedValue]
AS
BEGIN
	DECLARE @actual VARCHAR(20);
	DECLARE @expected VARCHAR(20);	SET @expected = '765.55884';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = '7D04EC7D-09CA-47D7-8FBC-EAC07B7B64D5';
	DECLARE @traxId		VARCHAR(30);	SET @traxId = '0101';
	DECLARE @analyte	VARCHAR(4);		SET @analyte = 'Li';
	DECLARE @mass		VARCHAR(4);		SET @mass = '7';
	DECLARE @mode		VARCHAR(20);	SET @mode = 'Hot';

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_DATA_Evaluation';
	INSERT INTO [dbo].[SEQUENCE_DATA_Evaluation] ([Id]
      ,[Analysis]
      ,[SequenceId]
      ,[CalType]
      ,[TraxId]
      ,[SampleType]
      ,[Description]
      ,[Initial]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[OriginalConcentration]
      ,[ChangedFinalConcentration]
      ,[Index]
      ,[SEQUENCE_DATA_ID]) VALUES (1
	  ,'082423105832'
	  ,'7D04EC7D-09CA-47D7-8FBC-EAC07B7B64D5'
	  ,'EXTERNAL'
	  ,'0101'
	  ,'Testing'
	  ,'0101'
	  ,'ET'
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'68688.4'
	  ,'765.55884'
	  ,6
	  ,65);

	SET @actual = [dbo].[getReEvaluatedValue](@sequenceId, @traxId, @analyte, @mass, @mode);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';