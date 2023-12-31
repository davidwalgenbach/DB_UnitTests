USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getRackVial]    Script Date: 8/29/2023 10:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getRackVial]
AS
BEGIN
	DECLARE @actual VARCHAR(4);
	DECLARE @expected VARCHAR(4);	SET @expected = '0110';
	DECLARE @rack	VARCHAR(2);		SET @rack = '1';
	DECLARE @vial	VARCHAR(2);		SET @vial = '10';

	SET @actual = [dbo].[getRackVial](@rack, @vial);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
