ALTER PROCEDURE testScalarFunctions.[test_dbo.getNumberOfPoints]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(MaxPoints INT);
	CREATE TABLE expected(MaxPoints INT);
	DECLARE @calId INT;	SET @calId = 1;
	DECLARE @analysis VARCHAR(12);	SET @analysis = '082323111632';
	DECLARE @sequenceId VARCHAR(36);	SET @sequenceId = '95E1F506-D0DF-42C5-9975-ABB9CBB426F9';

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_VERSIONS';
	INSERT INTO [dbo].[SEQUENCE_VERSIONS] ([Id]
      ,[UserDevice]
      ,[Analysis]
      ,[SequenceId]
      ,[VersionId]
      ,[DateTime]) VALUES (1
	  ,'0303'
	  ,'082323111632'
	  ,'95E1F506-D0DF-42C5-9975-ABB9CBB426F9'
	  ,'52B21DC6-A35A-499C-BD7C-2337DB5693A1'
	  ,'08/23/2023 11:15:09');
	
	EXEC tSQLt.FakeTable 'dbo', 'CalDATA';
	--Insert Group 0 Row
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
	  ,1
	  ,'ppb'
	  ,'150'
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
	--Insert Std1 and Std2 row (Group 1)
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
      ,[Std-9]) VALUES (2
	  ,1
	  ,1
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,'ppb'
	  ,'150'
	  ,''
	  ,'5'
	  ,'10'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');
	--Insert Std3 and Std4 row(Group 2)
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
      ,[Std-9]) VALUES (3
	  ,1
	  ,1
	  ,2
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,2
	  ,'ppb'
	  ,'300'
	  ,''
	  ,''
	  ,''
	  ,'30'
	  ,'60'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual VALUES ([dbo].[getNumberOfPoints](@calId, '', ''));

	EXEC tSQLt.FakeTable 'dbo', 'SEQUENCE_CalDATA';
	--Insert Std0 row(Group 0)
	INSERT INTO [dbo].[SEQUENCE_CalDATA] ([Id]
      ,[VersionId]
      ,[CalId]
      ,[Calibration]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[GroupId]
      ,[StdId]
      ,[Stock]
      ,[Unit]
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
	  ,'52B21DC6-A35A-499C-BD7C-2337DB5693A1'
	  ,1
	  ,'Testing'
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,0
	  ,1
	  ,'150'
	  ,'ppb'
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
	--Insert Std1, Std2 and Std3 row(Group 1)
	INSERT INTO [dbo].[SEQUENCE_CalDATA] ([Id]
      ,[VersionId]
      ,[CalId]
      ,[Calibration]
      ,[ProtocolId]
      ,[Analyte]
      ,[Mass]
      ,[Mode]
      ,[LineFit]
      ,[InterceptFitType]
      ,[Forcing]
      ,[InternalStd]
      ,[GroupId]
      ,[StdId]
      ,[Stock]
      ,[Unit]
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
	  ,'52B21DC6-A35A-499C-BD7C-2337DB5693A1'
	  ,1
	  ,'Testing'
	  ,1
	  ,'Li'
	  ,'7'
	  ,'Hot'
	  ,'None'
	  ,'None'
	  ,'None'
	  ,''
	  ,1
	  ,1
	  ,'150'
	  ,'ppb'
	  ,''
	  ,'5'
	  ,'30'
	  ,'75'
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual VALUES ([dbo].[getNumberOfPoints](@calId, @analysis, @sequenceId));

	INSERT INTO expected VALUES ('4');
	INSERT INTO expected VALUES ('3');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';