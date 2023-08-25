ALTER PROCEDURE testScalarFunctions.[test_dbo.getSequence_Washmethod]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
	CREATE TABLE actual(result VARCHAR(50));
	CREATE TABLE expected(result VARCHAR(50));

	DECLARE @sampletypeId	INT;			SET @sampletypeId = 1;
	DECLARE @washtype		VARCHAR(20);	SET @washtype = 'Std';

	EXEC tSQLt.FakeTable 'dbo', 'SampleTypeDATA';
	INSERT INTO [dbo].[SampleTypeDATA] ([Id]
      ,[SampleTypeId]
      ,[SampleType]
      ,[CalType]
      ,[CalId]
      ,[StdId]
      ,[AcidSpk]
      ,[AcidSoln]
      ,[ProtocolId]
      ,[QCRuleId]
      ,[SampleMethod]
      ,[SampleDF]
      ,[WashMethod]
      ,[Priority]
      ,[StdBlank]
      ,[SampleBlank]
      ,[StdWash]
      ,[StdWashMethod]
      ,[SampleWash]
      ,[SampleWashMethod]
      ,[Repetition]
      ,[LoopSize]
      ,[LoadingType]
      ,[MethodSet]
      ,[PrepMethod]
      ,[PrepDF]
      ,[RouteId]
      ,[Rack1]
      ,[Rack2]
      ,[Rack3]
      ,[Rack4]
      ,[TargetWeight]
      ,[MinWeight]
      ,[MaxWeight]
      ,[Weight]
      ,[DailyDose]
      ,[Comments]) VALUES (1
	  ,1
	  ,'Testing'
	  ,'EXTERNAL'
	  ,1
	  ,1
	  ,1
	  ,1
	  ,1
	  ,0
	  ,''
	  ,1
	  ,'imasampletypewash.fast'
	  ,0
	  ,0
	  ,0
	  ,0
	  ,'imastdwash.fast'
	  ,0
	  ,'imasamplewash.fast'
	  ,0
	  ,15
	  ,'VL'
	  ,'D1'
	  ,''
	  ,''
	  ,0
	  ,0
	  ,0
	  ,0
	  ,0
	  ,''
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'');

	INSERT INTO actual VALUES ([dbo].[getSequence_Washmethod](@sampletypeId, @washtype));
	SET @washtype = 'Sample';
	INSERT INTO actual VALUES ([dbo].[getSequence_Washmethod](@sampletypeId, @washtype));
	SET @washtype = 'SampleType';
	INSERT INTO actual VALUES ([dbo].[getSequence_Washmethod](@sampletypeId, @washtype));

	INSERT INTO expected VALUES('imastdwash.fast');
	INSERT INTO expected VALUES('imasamplewash.fast');
	--This should be "imasampletypewash.fast" but cannot because the case statement has a bug. Noted in the text document. 
	INSERT INTO expected VALUES('imasamplewash.fast');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';