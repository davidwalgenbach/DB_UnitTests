USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getQCName]    Script Date: 8/29/2023 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getQCName]
AS
BEGIN
	DECLARE @actual VARCHAR(50);
	DECLARE @expected VARCHAR(50);	SET @expected = 'Intensity';
	DECLARE @qcId	INT;			SET @qcId = 1;

	EXEC tSQLt.FakeTable 'dbo', 'QC';
	INSERT INTO [dbo].[QC] ([Id]
      ,[ProtocolId]
      ,[QCName]
      ,[QCTypeId]
      ,[QCType]
      ,[Priority]
      ,[CalId]
      ,[LimitType]
      ,[WashEnabled]
      ,[WashMethod]
      ,[QCTraxId]
      ,[StockId]
      ,[Frequency]
      ,[Point]) VALUES (1
	  ,1
	  ,'Intensity'
	  ,1
	  ,'Blank'
	  ,1
	  ,1
	  ,'Intensity'
	  ,0
	  ,''
	  ,''
	  ,0
	  ,0
	  ,0);

	SET @actual = [dbo].[getQCName](@qcId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
