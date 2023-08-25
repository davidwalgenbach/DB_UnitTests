CREATE PROCEDURE testScalarFunctions.[test_dbo.select_ICVenabled]
AS
BEGIN
	DECLARE @actual		VARCHAR(10);
	DECLARE @expected	VARCHAR(10);	SET @expected = '1';
	DECLARE @rule		VARCHAR(30);	SET @rule = 'Testing';

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
	  ,'Testing'
	  ,1
	  ,'Solution'
	  ,1
	  ,1
	  ,0
	  ,0
	  ,''
	  ,1
	  ,''
	  ,0
	  ,0);

	SET @actual = [dbo].[select_ICVEnabled](@rule);
	
	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';