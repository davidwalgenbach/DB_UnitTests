CREATE PROCEDURE testScalarFunctions.[test_dbo.getFastMethod]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE actual(FastMethod VARCHAR(50));
	CREATE TABLE expected(FastMethod VARCHAR(50));
	DECLARE @deviceId TINYINT;	SET @deviceId = 1;
	DECLARE @ret1	VARCHAR(50);	SET @ret1 = '5secondtimer.fast';
	DECLARE @ret2	VARCHAR(50);	SET @ret2 = 'S5_VL_D1.fast';

	EXEC tSQLt.FakeTable 'dbo', '5secondtimer'
	INSERT INTO [dbo].[5secondtimer] ([DeviceId]
      ,[5secondtimer]) VALUES (1
	  ,0);
	INSERT INTO [dbo].[5secondtimer] ([DeviceId]
      ,[5secondtimer]) VALUES (2
	  ,1);

	--No 5secondtimer
	INSERT INTO actual VALUES([dbo].[getFastMethod](@deviceId, @ret1, @ret2));

	--5secondtimer
	SET @deviceId = 2;
	INSERT INTO actual VALUES([dbo].[getFastMethod](@deviceId, @ret1, @ret2));

	INSERT INTO expected VALUES('5secondtimer.fast');
	INSERT INTO expected VALUES('S5_VL_D1.fast');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';