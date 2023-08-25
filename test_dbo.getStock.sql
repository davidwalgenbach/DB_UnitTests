CREATE PROCEDURE testScalarFunctions.[test_dbo.getStock]
AS
BEGIN
	DECLARE @actual		VARCHAR(10);
	DECLARE @expected	VARCHAR(10);	SET @expected = '500';
	DECLARE @calId		TINYINT;		SET @calId = 1;
	DECLARE @groupId	TINYINT;		SET @groupId = 0;

	EXEC tSQLt.FakeTable 'dbo', 'CalDATA';
	INSERT INTO [dbo].[CalDATA] ([Id]
      ,[CalId]
      ,[ProtocolId]
      ,[GroupId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[StdId]
      ,[Unit]
      ,[Stock]
      ,[Std-0]
      ,[Std-1]
      ,[Std-2]
      ,[Std-3]
      ,[Std-4]
      ,[Std-5]
      ,[Std-6]
      ,[Std-7]
      ,[Std-8]
      ,[Std-9]) VALUES (1
	  ,1
	  ,1
	  ,0
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,4
	  ,'ppb'
	  ,'500'
	  ,'0'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	SET @actual = [dbo].[getStock](@calId, @groupId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';