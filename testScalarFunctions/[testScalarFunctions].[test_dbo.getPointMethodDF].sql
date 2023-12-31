USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getPointMethodDF]    Script Date: 8/29/2023 10:22:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getPointMethodDF]
AS
BEGIN
	DECLARE @actual VARCHAR(10);
	DECLARE @expected VARCHAR(10);	SET @expected = '0.8100';
	DECLARE @acidval INT			SET @acidval = 1;
	DECLARE @stdval	VARCHAR(4)		SET @stdval = '50';
	DECLARE @ppt	INT				SET @ppt = 500;
	DECLARE @scdf	VARCHAR(10)		SET @scdf = '1';

	SET @actual = [dbo].[getPointMethodDf](@acidval, @stdval, @ppt, @scdf);
	
	EXEC tSQLt.AssertEquals @expected, @actual;
END;
