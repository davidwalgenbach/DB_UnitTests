USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getQCStdName]    Script Date: 8/29/2023 10:23:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getQCStdName]
AS
BEGIN
	DECLARE @actual VARCHAR(50);
	DECLARE @expected VARCHAR(50);	SET @expected = 'Testing_Sol';
	DECLARE @qcStdId	TINYINT;	SET @qcStdId = 1;

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
	  ,2
	  ,'QC'
	  ,''
	  ,''
	  ,''
	  ,1
	  ,'0101'
	  ,'ppb'
	  ,''
	  ,''
	  ,''
	  ,'300' -- Li
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

	SET @actual = [dbo].[getQCStdName](@qcStdId);

	EXEC tSQLt.AssertEquals @expected, @actual;
END;
