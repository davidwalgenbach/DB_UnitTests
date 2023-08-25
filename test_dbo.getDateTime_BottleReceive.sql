ALTER PROCEDURE testScalarFunctions.[test_dbo.getDateTime_BottleReceive]
AS
BEGIN
	DECLARE @actual VARCHAR(20);
	DECLARE @expected VARCHAR(20);	SET @expected = '08/23/2023 07:34:21';
	DECLARE @traxId VARCHAR(20);	SET @traxId = 'ESIQA0003';
	DECLARE @datetime VARCHAR(20);	SET @DateTime = '08/23/2023 08:58:41';

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
	  ,'02'
	  ,'ESI\Testing'
	  ,'ESIQA0003'
	  ,1
	  ,1
	  ,'Testing'
	  ,1
	  ,'5DD48726-21F0-457F-A082-7BF640E357AD'
	  ,'082323105412'
	  ,'08/23/2023 07:34:21');

	SET @actual = dbo.getDateTime_BottleReceive(@traxId, @datetime);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';