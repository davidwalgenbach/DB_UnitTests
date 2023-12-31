USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getNumeric]    Script Date: 8/29/2023 10:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getNumeric]
AS
BEGIN
	DECLARE @actual VARCHAR(256);
	DECLARE @expected VARCHAR(256);	SET @expected = '123214321';
	DECLARE @strAlphaNumeric VARCHAR(256);	SET @strAlphaNumeric = '123214TESTING_?><-+.AVD321';

	SET @actual = [dbo].[getNumeric](@strAlphaNumeric);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
