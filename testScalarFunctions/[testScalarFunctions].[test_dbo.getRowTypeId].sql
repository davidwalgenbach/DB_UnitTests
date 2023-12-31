USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getRowTypeId]    Script Date: 8/29/2023 10:24:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getRowTypeId]
AS
BEGIN
	DECLARE @actual			TINYINT;
	DECLARE @expected		TINYINT;		SET @expected = 9;
	DECLARE @solutiontype	VARCHAR(30);	SET @solutiontype = 'Sample';

	EXEC tSQLt.FakeTable 'dbo', 'RowTypes';
	INSERT INTO [dbo].[RowTypes] ([Id]
      ,[RowType]
      ,[SEQUENCE_RowType]
      ,[SolutionType]) VALUES (9
	  ,'SampleRow'
	  ,'Sample'
	  ,'Sample');

	SET @actual = [dbo].[getRowTypeId](@solutiontype);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
