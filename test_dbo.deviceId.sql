--EXEC tSQLt.NewTestClass 'testScalarFunctions';

ALTER PROCEDURE testScalarFunctions.[test_dbo.deviceId]
AS
BEGIN
	DECLARE @userDevice VARCHAR(4); SET @userDevice = 1256;
	DECLARE @deviceId VARCHAR(2);

	SELECT @deviceId = [dbo].[deviceId](@userDevice);

	DECLARE @expected VARCHAR(2); SET @expected = 56;	--DeviceID is the last two digits of userDevice
	EXEC tSQLt.AssertEquals @expected, @deviceId;

END;
GO

EXEC tSQLt.Run 'testScalarFunctions'