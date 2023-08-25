CREATE PROCEDURE testScalarFunctions.[test_dbo.getSampleMethod]
AS
BEGIN
	DECLARE @actual			VARCHAR(40);
	DECLARE @expected		VARCHAR(40);	SET @expected = 'S5_VL_D1.fast';
	DECLARE @sampletypeId	INT;			SET @sampletypeId = 3;

	EXEC tSQLt.FakeTable 'dbo', 'DiscoverDATA';
	INSERT INTO [dbo].[DiscoverDATA] ([Id]
      ,[UserDevice]
      ,[User]
      ,[DateTime]
      ,[BottleDetails_Id]
      ,[Status]
      ,[Description]
      ,[BarCode]
      ,[Match]
      ,[Rack]
      ,[Vial]
      ,[ProtocolId]
      ,[CalType]
      ,[Standard]
      ,[StdId]
      ,[SampleType]
      ,[SampleTypeId]
      ,[Priority]
      ,[CalId]
      ,[Calibration]
      ,[FastMethod]
      ,[FastDF]
      ,[SequenceWash]
      ,[SampleTypeWash]
      ,[Blank]
      ,[Wash]
      ,[Repetition]
      ,[StdBlank]
      ,[StdWash]
      ,[RackType]
      ,[RackVials]
      ,[Destination]
      ,[Inverted]
      ,[RackAlias]
      ,[PrepRoute]
      ,[PrepMethod]
      ,[PrepDF]) VALUES(1
	  ,'0303'
	  ,'ESI\Testing'
	  ,'08/24/2023 13:11:34'
	  ,0
	  ,0
	  ,''
	  ,'0101'
	  ,3
	  ,'1'
	  ,'1'
	  ,1
	  ,'EXTERNAL'
	  ,0
	  ,0
	  ,'Testing'
	  ,3
	  ,0
	  ,1
	  ,'Testing_Cal'
	  ,'S5_VL_D1.fast'
	  ,1
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,'TXR_31_62_F'
	  ,13
	  ,0
	  ,0
	  ,''
	  ,0
	  ,''
	  ,'');

	EXEC tSQLt.FakeTable 'dbo', 'SampleType';
	INSERT INTO [dbo].[SampleType] ([Id]
      ,[Name]
      ,[TypeId]
      ,[EnableNano]
      ,[EnablePrepMass]) VALUES (3
	  ,'Testing'
	  ,0
	  ,0
	  ,0);

	SET @actual = [dbo].[getSampleMethod](@sampletypeId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';