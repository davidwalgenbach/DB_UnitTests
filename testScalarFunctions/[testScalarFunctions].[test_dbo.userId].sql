USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.userId]    Script Date: 8/29/2023 10:32:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.userId]
AS
BEGIN
	DECLARE @actual	TINYINT;
	DECLARE @expected	TINYINT;	SET @expected = 3;
	DECLARE @userdevice	VARCHAR(4);	SET @userdevice = '0303';

	SET @actual = [dbo].[userId](@userdevice);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
