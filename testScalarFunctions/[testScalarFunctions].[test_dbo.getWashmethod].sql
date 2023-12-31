USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getWashmethod]    Script Date: 8/29/2023 10:28:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getWashmethod]
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
