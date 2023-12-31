USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.SFRound]    Script Date: 8/29/2023 10:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.SFRound]
AS
BEGIN
	DECLARE @actual	FLOAT;
	DECLARE @expected FLOAT;	SET @expected = 2.23141;
	DECLARE @number	FLOAT;	SET @number = 2.231414453333333;
	DECLARE @sf	INT;	SET @sf = 6;

	SET @actual = [dbo].[SFRound](@number, @sf);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
