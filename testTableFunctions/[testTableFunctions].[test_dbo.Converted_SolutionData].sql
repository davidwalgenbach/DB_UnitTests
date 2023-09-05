CREATE PROCEDURE testTableFunctions.[test_dbo.Converted_SolutionData]
AS
BEGIN
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;

	CREATE TABLE expected ([Id] SMALLINT
	,[Name] VARCHAR(50)
	,[Part] VARCHAR(50)
	,[Matrix] VARCHAR(50)
	,[Acid] VARCHAR(50)
	,[TraxID] VARCHAR(30)
	,[Units] VARCHAR(10)
	,[FastMethod] VARCHAR(30)
	,[Element] VARCHAR(2)
	,[Concentration] VARCHAR(24));

	CREATE TABLE actual ([Id] SMALLINT
	,[Name] VARCHAR(50)
	,[Part] VARCHAR(50)
	,[Matrix] VARCHAR(50)
	,[Acid] VARCHAR(50)
	,[TraxID] VARCHAR(30)
	,[Units] VARCHAR(10)
	,[FastMethod] VARCHAR(30)
	,[Element] VARCHAR(2)
	,[Concentration] VARCHAR(24));

	DECLARE @qcStdId TINYINT;	SET @qcStdId = 1;

	EXEC tSQLt.FakeTable 'dbo', 'SolutionDATA';
	INSERT INTO [dbo].[SolutionDATA] ([Id]
      ,[Name]
      ,[TypeId]
      ,[Type]
      ,[Description]
      ,[Part]
      ,[Matrix]
      ,[Acid]
      ,[TraxID]
      ,[Unit]
      ,[FastMethod]
      ,[H]
      ,[He]
      ,[Li]
      ,[Be]
      ,[B]
      ,[C]
      ,[N]
      ,[O]
      ,[F]
      ,[Ne]
      ,[Na]
      ,[Mg]
      ,[Al]
      ,[Si]
      ,[P]
      ,[S]
      ,[Cl]
      ,[K]
      ,[Ar]
      ,[Ca]
      ,[Sc]
      ,[Ti]
      ,[V]
      ,[Cr]
      ,[Mn]
      ,[Fe]
      ,[Co]
      ,[Ni]
      ,[Cu]
      ,[Zn]
      ,[Ga]
      ,[Ge]
      ,[As]
      ,[Se]
      ,[Br]
      ,[Kr]
      ,[Rb]
      ,[Sr]
      ,[Y]
      ,[Zr]
      ,[Nb]
      ,[Tc]
      ,[Mo]
      ,[Ru]
      ,[Rh]
      ,[Pd]
      ,[Ag]
      ,[Cd]
      ,[In]
      ,[Sn]
      ,[Sb]
      ,[Te]
      ,[I]
      ,[Xe]
      ,[Cs]
      ,[Ba]
      ,[La]
      ,[Ce]
      ,[Pr]
      ,[Pm]
      ,[Nd]
      ,[Sm]
      ,[Eu]
      ,[Gd]
      ,[Tb]
      ,[Dy]
      ,[Ho]
      ,[Er]
      ,[Tm]
      ,[Yb]
      ,[Lu]
      ,[Hf]
      ,[Ta]
      ,[W]
      ,[Re]
      ,[Os]
      ,[Ir]
      ,[Pt]
      ,[Au]
      ,[Hg]
      ,[Tl]
      ,[Pb]
      ,[Bi]
      ,[At]
      ,[Po]
      ,[Rn]
      ,[Fr]
      ,[Ra]
      ,[Ac]
      ,[Pa]
      ,[Th]
      ,[Np]
      ,[U]
      ,[Pu]
      ,[Am]
      ,[Cm]
      ,[Bk]
      ,[Cf]
      ,[Es]
      ,[Fm]
      ,[Md]
      ,[No]
      ,[Lr]) VALUES (1
	  ,'Testing_Sol'
	  ,0
	  ,'Calibration'
	  ,''
	  ,''
	  ,''
	  ,1
	  ,'0101'
	  ,'ppb'
	  ,'S5_VL_D1.fast'
	  ,''
	  ,''
	  ,'150'
	  ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,''
      ,'');

	INSERT INTO actual SELECT * FROM [dbo].[Converted_SolutionData](@qcStdId);

	INSERT INTO expected ([Id]
	,[Name]
	,[Part] 
	,[Matrix]
	,[Acid] 
	,[TraxID] 
	,[Units] 
	,[FastMethod] 
	,[Element] 
	,[Concentration]) VALUES (1
	,'Testing_Sol'
	,''
	,''
	,1
	,'0101'
	,'ppb'
	,'S5_VL_D1.fast'
	,'Li'
	,'150');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';
END;
GO

EXEC tSQLt.Run 'testTableFunctions';