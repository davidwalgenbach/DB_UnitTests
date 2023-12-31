USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getBECValue]    Script Date: 8/29/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getBECValue]
AS
BEGIN
	DECLARE @expected VARCHAR(24);	SET @expected = '2.649527';
	DECLARE @actual VARCHAR(24);
	DECLARE @meanvalue VARCHAR(24);	SET @meanvalue = '12.324';
	DECLARE @intercept VARCHAR(24);	SET @intercept = '1.4';
	DECLARE @slope VARCHAR(24);	SET @slope = '4.123';

	SET @actual = dbo.getBECValue(@meanvalue, @intercept, @slope)

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
