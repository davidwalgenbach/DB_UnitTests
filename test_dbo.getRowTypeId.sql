CREATE PROCEDURE testScalarFunctions.[test_dbo.getRowTypeId]
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
GO

EXEC tSQLt.Run 'testScalarFunctions';