CREATE PROCEDURE testScalarFunctions.[test_dbo.getVersionId]
AS
BEGIN
	DECLARE @actual VARCHAR(36);
	DECLARE @expected VARCHAR(36);	SET @expected = 'imaversionID';
	DECLARE @sequenceId	VARCHAR(36);	SET @sequenceId = 'imasequenceID';

	EXEC tSQlt.FakeTable 'dbo', 'SEQUENCE_VERSIONS';
	INSERT INTO [dbo].[SEQUENCE_VERSIONS] ([Id]
      ,[UserDevice]
      ,[Analysis]
      ,[SequenceId]
      ,[VersionId]
      ,[DateTime]) VALUES (1
	  ,'0303'
	  ,'imananalysis'
	  ,'imasequenceID'
	  ,'imaversionID'
	  ,'08/25/2023 11:24:40');

	SET @actual = [dbo].[getVersionId](@sequenceId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';