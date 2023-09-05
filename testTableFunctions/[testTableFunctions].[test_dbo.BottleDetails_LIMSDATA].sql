CREATE PROCEDURE testTableFunctions.[test_dbo.BottleDetails_LIMSDATA]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
	DECLARE @userId	VARCHAR(4);	SET @userId = '3';

	CREATE TABLE expected(Id INT, 
						UserId SMALLINT
						,[User] VARCHAR(20)
						,TraxId VARCHAR(30)
						,[Status] TINYINT 
						,SampleTypeId SMALLINT
						,SampleType VARCHAR(30)
						,Protocol VARCHAR(30)
						,SequenceId VARCHAR(36)
						,Analysis VARCHAR(20) 
						,[DateTime] VARCHAR(30) 
						,AUTO_DATA_COLUMN_1 VARCHAR(50) 
						,AUTO_DATA_COLUMN_2 VARCHAR(50) 
						,AUTO_DATA_COLUMN_3 VARCHAR(50) 
						,AUTO_DATA_COLUMN_4 VARCHAR(50) 
						,MANUAL_DATA_COLUMN_1 VARCHAR(50) 
						,MANUAL_DATA_COLUMN_2 VARCHAR(50))
	CREATE TABLE actual(Id INT, 
						UserId SMALLINT
						,[User] VARCHAR(20)
						,TraxId VARCHAR(30)
						,[Status] TINYINT 
						,SampleTypeId SMALLINT
						,SampleType VARCHAR(30)
						,Protocol VARCHAR(30)
						,SequenceId VARCHAR(36)
						,Analysis VARCHAR(20) 
						,[DateTime] VARCHAR(30) 
						,AUTO_DATA_COLUMN_1 VARCHAR(50) 
						,AUTO_DATA_COLUMN_2 VARCHAR(50) 
						,AUTO_DATA_COLUMN_3 VARCHAR(50) 
						,AUTO_DATA_COLUMN_4 VARCHAR(50) 
						,MANUAL_DATA_COLUMN_1 VARCHAR(50) 
						,MANUAL_DATA_COLUMN_2 VARCHAR(50))

	EXEC tSQLt.FakeTable 'dbo', 'BottleDetails';
	INSERT INTO [dbo].[BottleDetails] ([Id]
      ,[UserId]
      ,[User]
      ,[TraxId]
      ,[Status]
      ,[SampleTypeId]
      ,[SampleType]
      ,[ProtocolId]
      ,[SequenceId]
      ,[Analysis]
      ,[DateTime]) VALUES (1
	  ,'3'
	  ,'ESI\Testing'
	  ,'0101'
	  ,1
	  ,1
	  ,'Testing'
	  ,1
	  ,'imasequenceID'
	  ,'082923133332'
	  ,'08/29/2023 13:34:41')
	
	EXEC tSQLt.FakeTable 'dbo', 'LIMS_DATA';
	INSERT INTO [dbo].[LIMS_DATA] ([Id]
      ,[UserId]
      ,[User]
      ,[TraxID]
      ,[BottleDetails_Id]
      ,[AUTO_DATA_COLUMN_1]
      ,[AUTO_DATA_COLUMN_2]
      ,[AUTO_DATA_COLUMN_3]
      ,[AUTO_DATA_COLUMN_4]
      ,[MANUAL_DATA_COLUMN_1]
      ,[MANUAL_DATA_COLUMN_2]
      ,[TIMESTAMP]
      ,[STATUS_ID]) VALUES (1
	  ,'3'
	  ,'ESI\Testing'
	  ,'0101'
	  ,1
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'08/29/2023 13:34:41'
	  ,1)

	EXEC tSQLt.FakeTable 'dbo', 'Protocol';
	INSERT INTO [dbo].[Protocol] ([Id]
      ,[Name]
      ,[CalId]
      ,[Prefix]
      ,[TypeId]) VALUES (1
	  ,'TestingProto'
	  ,1
	  ,''
	  ,0);

	INSERT INTO expected (Id, 
						UserId
						,[User]
						,TraxId
						,[Status] 
						,SampleTypeId
						,SampleType
						,Protocol
						,SequenceId
						,Analysis 
						,[DateTime] 
						,AUTO_DATA_COLUMN_1 
						,AUTO_DATA_COLUMN_2 
						,AUTO_DATA_COLUMN_3 
						,AUTO_DATA_COLUMN_4 
						,MANUAL_DATA_COLUMN_1 
						,MANUAL_DATA_COLUMN_2) VALUES (1
						,'3'
						,'ESI\Testing'
						,'0101'
						,1
						,1
						,'Testing'
						,'TestingProto'
						,'imasequenceID'
						,'082923133332'
						,'08/29/2023 13:34:41'
						,''
						,''
						,''
						,''
						,''
						,'')

	INSERT INTO actual SELECT * FROM [dbo].[BottleDetails_LIMSDATA](@userId);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';