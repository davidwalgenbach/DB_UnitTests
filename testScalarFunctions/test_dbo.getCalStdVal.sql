ALTER PROCEDURE testScalarFunctions.[test_dbo.getCalStdVal]
AS
BEGIN
	DECLARE @expected VARCHAR(10);	SET @expected = '35';
	DECLARE @calId TINYINT;
	DECLARE @std TINYINT;

	EXEC tSQLt.FakeTable 'dbo', 'CalDATA';
	INSERT INTO dbo.CalDATA ([Id]
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
	  ,2
	  ,1
	  ,0
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,2
	  ,'ppb'
	  ,'100'
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
	INSERT INTO dbo.CalDATA ([Id]
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
      ,[Std-9]) VALUES (2
	  ,2
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,2
	  ,'ppb'
	  ,'100'
	  ,''
	  ,'2.5'
	  ,'15'
	  ,'35' --expected comes from std-3
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	  DECLARE @actual VARCHAR(10);
	  SELECT @actual = [dbo].[getCalStdVal](2, 3);	--This cannot be executed because of the dynamic SQL in the scalar function.... 

	  EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';