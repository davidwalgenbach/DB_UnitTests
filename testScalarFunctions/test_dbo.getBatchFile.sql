ALTER PROCEDURE testScalarFunctions.[test_dbo.getBatchFile]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(BatchFile VARCHAR(50));
	DECLARE @sampletypeId INT;	SET @sampletypeId = 2;
	DECLARE @userdevice VARCHAR(4);	SET @userdevice = '0302'

	EXEC tSQLt.FakeTable 'dbo', 'SampleTypeBATCH';
	INSERT INTO [dbo].[SampleTypeBATCH] ([Id]
      ,[SampleTypeId]
      ,[DeviceId]
      ,[BatchFileId]
      ,[BatchFile]
      ,[Keyword]) VALUES (1
	  ,2
	  ,'02'
	  ,1
	  ,'ImABatch'
	  ,null);
	INSERT INTO [dbo].[SampleTypeBATCH] ([Id]
      ,[SampleTypeId]
      ,[DeviceId]
      ,[BatchFileId]
      ,[BatchFile]
      ,[Keyword]) VALUES (2
	  ,4
	  ,'02'
	  ,2
	  ,''
	  ,'Detection');

	EXEC tSQLt.FakeTable 'dbo', 'BatchDetails';
	INSERT INTO [dbo].[BatchDetails] ([Id]
      ,[DeviceId]
      ,[FileName]
      ,[TIMESTAMP]) VALUES (1
	  ,'02'
	  ,'ImABatch'
	  ,'2023-08-09 14:35:09.000');
	INSERT INTO [dbo].[BatchDetails] ([Id]
      ,[DeviceId]
      ,[FileName]
      ,[TIMESTAMP]) VALUES (2
	  ,'02'
	  ,'DetectionBatch'
	  ,'2023-08-09 14:35:09.000');
	INSERT INTO [dbo].[BatchDetails] ([Id]
      ,[DeviceId]
      ,[FileName]
      ,[TIMESTAMP]) VALUES (3
	  ,'02'
	  ,'AThirdBatch'
	  ,'2023-08-09 14:35:09.000');

	
	INSERT INTO actual (BatchFile) VALUES (dbo.getBatchFile(2, '0302'));
	INSERT INTO actual (BatchFile) VALUES (dbo.getBatchFile(4, '0302'));

	CREATE TABLE expected(BatchFile VARCHAR(50));
	INSERT INTO expected (BatchFile) VALUES ('ImABatch');
	INSERT INTO expected (BatchFile) VALUES ('DetectionBatch');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions'