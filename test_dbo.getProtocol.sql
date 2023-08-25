CREATE PROCEDURE testScalarFunctions.[test_dbo.getProtocol]
AS
BEGIN
	DECLARE @actual VARCHAR(50);
	DECLARE @expected VARCHAR(50);	SET @expected = 'Testing_Proto';
	DECLARE @protocolId	INT;			SET @protocolId = 1;

	EXEC tSQLt.FakeTable 'dbo', 'Protocol';
	INSERT INTO [dbo].[Protocol] ([Id]
      ,[Name]
      ,[CalId]
      ,[Prefix]
      ,[TypeId]) VALUES (1
	  ,'Testing_Proto'
	  ,1
	  ,''
	  ,0);

	SET @actual = [dbo].[getProtocol](@protocolId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
GO

EXEC tSQLt.Run 'testScalarFunctions';