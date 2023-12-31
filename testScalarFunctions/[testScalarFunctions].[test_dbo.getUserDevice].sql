USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getUserDevice]    Script Date: 8/29/2023 10:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getUserDevice]
AS
BEGIN
	DECLARE @actual		VARCHAR(4);
	DECLARE @expected	VARCHAR(4);	SET @expected = '0303';
	DECLARE @userId		TINYINT;	SET @userId = 3;
	DECLARE @deviceId	TINYINT;	SET @deviceId = 3;

	SET @actual = [dbo].[getUserDevice](@userId, @deviceId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
