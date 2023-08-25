CREATE PROCEDURE testScalarFunctions.[test_dbo.IsEvaluationValueExist]
AS
BEGIN
	DECLARE @actual BIT;
	DECLARE @expected BIT;	SET @expected = 1;
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';
	DECLARE @traxId	VARCHAR(30);	SET @traxId = '0101';
	DECLARE @analyte	VARCHAR(4);	SET @analyte = 'Li';
	DECLARE @mass	VARCHAR(4);	SET @mass = '7';
	DECLARE @mode	VARCHAR(20);	SET @mode = 'Hot';

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
	  ,'082523115032'
	  ,'imasequenceID'
	  ,'EXTERNAL'
	  ,'0101'
	  ,'Testing'
	  ,'0101'
	  ,'ET'
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'1.25'
	  ,'124.2'
	  ,3
	  ,214);

	SET @actual = [dbo].[IsEvaluationValueExist](@sequenceId, @traxId, @analyte, @mass, @mode);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';