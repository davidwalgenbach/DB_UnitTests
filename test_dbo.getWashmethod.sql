CREATE PROCEDURE testScalarFunctions.[test_dbo.getWashmethod]
AS
BEGIN
	DECLARE @actual VARCHAR(50);
	DECLARE @expected VARCHAR(50);	SET @expected = 'imawashmethod.fast';
	DECLARE @Id	TINYINT;	SET @Id = 1;

	EXEC tSQLt.FakeTable 'dbo', 'WASHMETHOD';
	INSERT INTO [dbo].[WASHMETHOD] ([Id]
      ,[Name]) VALUES (1
	  ,'imawashmethod.fast');

	SET @actual = [dbo].[getWashmethod](@Id);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';