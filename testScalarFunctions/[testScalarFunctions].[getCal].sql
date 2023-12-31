USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getCal]    Script Date: 8/29/2023 10:16:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getCal]
AS
BEGIN
	DECLARE @expected VARCHAR(50);	SET @expected = 'IMACALIBRATION';
	DECLARE @actual VARCHAR(50); 
	DECLARE @calId TINYINT;	SET @calId = 1

	EXEC tSQLt.FakeTable 'dbo', 'Calibration';
	INSERT INTO [dbo].[Calibration] ([Id]
      ,[Name]
      ,[ProtocolId]
      ,[Points]
      ,[Groups]
      ,[MultiGroupEnabled]
      ,[NanoCalEnabled]) VALUES (@calId
	  ,'IMACALIBRATION'
	  ,123
	  ,4
	  ,2
	  ,1
	  ,0)

	SET @actual = dbo.GetCal(@calId)

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
