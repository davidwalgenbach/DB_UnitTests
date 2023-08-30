CREATE PROCEDURE testTableFunctions.[test_dbo.BottleDetails_LIMSDATA_bytraxId]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE expected(ReqType VARCHAR(15), Line VARCHAR(10), Material VARCHAR(15), SamplingPoint VARCHAR(15), AIMSNote VARCHAR(50), LABNote VARCHAR(50));
	CREATE TABLE actual(ReqType VARCHAR(15), Line VARCHAR(10), Material VARCHAR(15), SamplingPoint VARCHAR(15), AIMSNote VARCHAR(50), LABNote VARCHAR(50));

	DECLARE @traxId	VARCHAR(20);	SET @traxId = '0101';

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
	  ,'AD1'
	  ,'AD2'
	  ,'AD3'
	  ,'AD4'
	  ,'MD1'
	  ,'MD2'
	  ,'08/29/2023 13:34:41'
	  ,1)

	INSERT INTO expected (ReqType
							,Line
							,Material
							,SamplingPoint
							,AIMSNote
							,LABNote) VALUES ('AD1'
								,'AD2'
								,'AD3'
								,'AD4'
								,'MD1'
								,'MD2');

	INSERT INTO actual SELECT * FROM [dbo].[BottleDetails_LIMSDATA_bytraxId](@traxId);

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';