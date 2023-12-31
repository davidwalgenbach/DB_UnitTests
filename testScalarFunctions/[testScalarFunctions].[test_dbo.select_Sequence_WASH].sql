USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.select_Sequence_WASH]    Script Date: 8/29/2023 10:32:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.select_Sequence_WASH]
AS
BEGIN
	DECLARE @actual	TINYINT;
	DECLARE @expected TINYINT;	SET @expected = 5;
	DECLARE @traxId	VARCHAR(20);	SET @traxId = '0101';

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
      ,[PrepDF]) VALUES (1
	  ,'0303'
	  ,'ESI\Testing'
	  ,'08/28/2023 10:07:34'
	  ,0
	  ,1
	  ,'0101'
	  ,'0101'
	  ,3
	  ,'1'
	  ,'1'
	  ,1
	  ,'EXTERNAL'
	  ,0
	  ,0
	  ,'Testing'
	  ,1
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
	  ,5
	  ,''
	  ,13
	  ,0
	  ,0
	  ,''
	  ,''
	  ,''
	  ,'');

	SET @actual = [dbo].[select_Sequence_WASH](@traxId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
