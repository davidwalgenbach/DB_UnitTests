USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getVersionId]    Script Date: 8/29/2023 10:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getVersionId]
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
