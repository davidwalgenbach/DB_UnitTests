USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.select_CCVFreq]    Script Date: 8/29/2023 10:29:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.select_CCVFreq]
AS
BEGIN
	DECLARE @actual VARCHAR(10);
	DECLARE @expected VARCHAR(10);	SET @expected = 2;
	DECLARE @rule	VARCHAR(30);	SET @rule = 'Testing_QC';

	EXEC tSQLt.FakeTable 'dbo', 'QCRule';
	INSERT INTO [dbo].[QCRule] ([Id]
      ,[QCName]
      ,[QCTypeId]
      ,[QCType]
      ,[CalId]
      ,[ICVEnabled]
      ,[CCVEnabled]
      ,[ICVWashEnabled]
      ,[ICVWash]
      ,[ICVStockId]
      ,[ICVBarcode]
      ,[CCVStd]
      ,[CCVFreq]) VALUES (1
	  ,'Testing_QC'
	  ,8
	  ,'Solution'
	  ,1
	  ,0
	  ,1
	  ,0
	  ,0
	  ,0
	  ,''
	  ,2
	  ,2);

	SET @actual = [dbo].[select_CCVFreq](@rule);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
