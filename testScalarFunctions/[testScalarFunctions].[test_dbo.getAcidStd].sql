USE [PLASMATRAX_CurrentDev]
GO
/****** Object:  StoredProcedure [testScalarFunctions].[test_dbo.getAcidStd]    Script Date: 8/29/2023 10:15:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [testScalarFunctions].[test_dbo.getAcidStd]
AS
BEGIN
	DECLARE @sampletypeId TINYINT; SET @sampletypeId = 1;
	DECLARE @actual VARCHAR(3);
	DECLARE @stdid TINYINT;

	EXEC tSQLt.FakeTable 'dbo', 'SampleTypeDATA'
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
	  ,3
	  ,'5'
	  ,'1'
	  ,1
	  ,0
	  ,''
	  ,1
	  ,''
	  ,0
	  ,0
	  ,0
	  ,0
	  ,'S5_Wash_3mL_1x_1min.fast'
	  ,0
	  ,'S5_Wash_3mL_1x_1min.fast'
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
	EXEC tSQLt.FakeTable 'dbo', 'SolutionDATA'
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
      ,[Lr]) VALUES(3
	  ,'Testing_Sol'
	  ,0
	  ,'Calibration'
	  ,''
	  ,''
	  ,''
	  ,'25'
	  ,''
	  ,'ppb'
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
	  ,''
	  ,''
	  ,''
	  ,''
	  ,'')

	  SELECT @actual = [dbo].[getAcidStd](@sampletypeId)
	  DECLARE @expected VARCHAR(3);	SET @expected = '25';
	  EXEC tSQLt.AssertEquals @expected, @actual;
END;
