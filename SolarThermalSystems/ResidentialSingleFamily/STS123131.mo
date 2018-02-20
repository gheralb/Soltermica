within Soltermica.SolarThermalSystems.ResidentialSingleFamily;

model STS123131
  extends Soltermica.BaseClasses.Icons.SoltermicaExample;
  Soltermica.ThermoFluidSystems.Pumps.Circulator circulator(medium = Soltermica.Media.Water70PropyleneGlycol30_25(), specs = Soltermica.ThermoFluidSystems.Pumps.Catalogue.GRUNDFOS_UPS_25_120()) annotation(
    Placement(visible = true, transformation(origin = {-72, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.AbsolutePressure primaryReferencePressure(medium = Soltermica.Media.Water70PropyleneGlycol30_25(), p = 251300) annotation(
    Placement(visible = true, transformation(origin = {-52, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient supplyWater(constantAmbientPressure = 3.013e+10, useTemperatureInput = true, medium = Soltermica.Media.Water()) annotation(
    Placement(visible = true, transformation(origin = {66, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.Faucets.SingleLeverMixerFaucet singleLeverMixerFaucet(Kv_grifo = 0.0002, dp_grifo = 251300, medium = Soltermica.Media.Water()) annotation(
    Placement(visible = true, transformation(origin = {48, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoFluidSystems.Boilers.Boiler boiler(TempReg = 50, medium = Soltermica.Media.Water(), specs = Soltermica.ThermoFluidSystems.Boilers.Catalogue.BAXI_PLATINIUM_24_24F()) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient sink(constantAmbientPressure = 101300, constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20), medium = Soltermica.Media.Water()) annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable supplyWaterTemperature(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:\\Users\\gonzalo-hernandez\\Desktop\\SHELDON\\Soltermica\\TemporalData_Exp002\\temperaturasRed.mat", offset = {273.15}, smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, tableName = "Murcia", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {90, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable hotWaterDemandProfile(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:\\Users\\gonzalo-hernandez\\Desktop\\SHELDON\\Soltermica\\TemporalData_Exp002\\testProfileFaucet.txt", offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = "DTIE", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {88, 64}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant leverPositionSignal(k = 1) annotation(
    Placement(visible = true, transformation(origin = {52, 84}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant shadeFactor(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable ambientTemperature(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:\\Users\\gonzalo-hernandez\\Desktop\\SHELDON\\Soltermica\\TemporalData_Exp002\\TemperaturasSeca.mat", offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, tableName = "D3_TempSec", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-90, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant boilerAmbientTemperature(k = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-30, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarRadiation.IrradianceData irradianceData1(fileName = "C:\\Users\\gonzalo-hernandez\\Desktop\\SHELDON\\Soltermica\\TemporalData_Exp002\\EPW_Murcia.txt", husoHorario = 1, inclinacion = 45, latitudLugar = 38.003, longitudLugar = -1.169, orientacion = 0, tableName = "Murcia") annotation(
    Placement(visible = true, transformation(origin = {-90, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.SolarCollector.SolarCollector solarCollector1(medium = Soltermica.Media.Water70PropyleneGlycol30_25(), specs = Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.BAXI_MEDITERRANEO_200()) annotation(
    Placement(visible = true, transformation(origin = {-40, -12}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.Controllers.DifferentialThermostat differentialThermostat(DeltaT_off = 3, DeltaT_on = 10, waterStorageMaxTemperature = 333.15) annotation(
    Placement(visible = true, transformation(origin = {-24, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.HeatExchangers.PlateEffectiveness plateEffectiveness annotation(
    Placement(visible = true, transformation(origin = {-22, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.WaterStorage.HotWaterTank hotWaterTank annotation(
    Placement(visible = true, transformation(origin = {28, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.Pumps.Circulator circulator1(medium = Soltermica.Media.Water70PropyleneGlycol30_25(), specs = Soltermica.ThermoFluidSystems.Pumps.Catalogue.GRUNDFOS_UPS_25_120()) annotation(
    Placement(visible = true, transformation(origin = {6, -46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(hotWaterTank.temperatureProbe, differentialThermostat.WaterStorageProbe) annotation(
    Line(points = {{40, -12}, {42, -12}, {42, 12}, {-38, 12}, {-38, 24}, {-32, 24}, {-32, 24}}, color = {0, 0, 127}));
  connect(supplyWater.flowPort, hotWaterTank.flowPort_a2) annotation(
    Line(points = {{56, -46}, {28, -46}, {28, -30}, {28, -30}}, color = {255, 0, 0}));
  connect(hotWaterTank.flowPort_b2, boiler.flowPort_a) annotation(
    Line(points = {{28, -10}, {26, -10}, {26, 32}, {4, 32}, {4, 40}, {4, 40}}, color = {255, 0, 0}));
  connect(differentialThermostat.PumpOut, circulator1.u) annotation(
    Line(points = {{-12, 24}, {6, 24}, {6, -38}, {6, -38}}, color = {0, 0, 127}));
  connect(plateEffectiveness.flowPort_b_2, hotWaterTank.flowPort_a1) annotation(
    Line(points = {{-12, -36}, {-2, -36}, {-2, -20}, {18, -20}, {18, -20}}, color = {255, 0, 0}));
  connect(plateEffectiveness.flowPort_a_2, circulator1.flowPort_b) annotation(
    Line(points = {{-12, -52}, {-4, -52}, {-4, -46}}, color = {255, 0, 0}));
  connect(plateEffectiveness.flowPort_a_1, solarCollector1.flowPort_b1) annotation(
    Line(points = {{-32, -36}, {-36, -36}, {-36, -26}, {-16, -26}, {-16, 0}, {-26, 0}}, color = {255, 0, 0}));
  connect(circulator.flowPort_a, plateEffectiveness.flowPort_b_1) annotation(
    Line(points = {{-62, -50}, {-47, -50}, {-47, -52}, {-32, -52}}, color = {255, 0, 0}));
  connect(circulator1.flowPort_a, hotWaterTank.flowPort_b1) annotation(
    Line(points = {{16, -46}, {14, -46}, {14, -28}, {18, -28}, {18, -28}}, color = {255, 0, 0}));
  connect(boiler.flowPort_b, singleLeverMixerFaucet.hotWaterIn) annotation(
    Line(points = {{16, 40}, {43, 40}}, color = {255, 0, 0}));
  connect(singleLeverMixerFaucet.flowPort_b1, sink.flowPort) annotation(
    Line(points = {{58, 50}, {66, 50}, {66, 30}, {70, 30}}, color = {255, 0, 0}));
  connect(supplyWater.flowPort, singleLeverMixerFaucet.coldWaterIn) annotation(
    Line(points = {{56, -46}, {52, -46}, {52, 40}, {53, 40}}, color = {255, 0, 0}));
  connect(hotWaterDemandProfile.y[1], singleLeverMixerFaucet.waterFlow) annotation(
    Line(points = {{78, 64}, {28, 64}, {28, 54}, {40, 54}, {40, 55}}, color = {0, 0, 127}, thickness = 0.5));
  connect(leverPositionSignal.y, singleLeverMixerFaucet.waterTemperature) annotation(
    Line(points = {{42, 84}, {22, 84}, {22, 46}, {40, 46}, {40, 45}}, color = {0, 0, 127}));
  connect(supplyWaterTemperature.y[1], supplyWater.ambientTemperature) annotation(
    Line(points = {{80, -70}, {76, -70}, {76, -53}}, color = {0, 0, 127}, thickness = 0.5));
  connect(primaryReferencePressure.flowPort, circulator.flowPort_a) annotation(
    Line(points = {{-52, -60}, {-52, -50}, {-62, -50}}, color = {255, 0, 0}));
  connect(circulator.flowPort_b, solarCollector1.flowPort_a1) annotation(
    Line(points = {{-82, -50}, {-86, -50}, {-86, -25}, {-54, -25}}, color = {255, 0, 0}));
  connect(differentialThermostat.PumpOut, circulator.u) annotation(
    Line(points = {{-12, 24}, {-8, 24}, {-8, -32}, {-72, -32}, {-72, -42}}, color = {0, 0, 127}));
  connect(ambientTemperature.y[1], solarCollector1.ambientTemperatureSignal) annotation(
    Line(points = {{-79, 22}, {-76, 22}, {-76, -22}, {-52, -22}, {-52, -21}}, color = {0, 0, 127}, thickness = 0.5));
  connect(shadeFactor.y, solarCollector1.shadeFactor) annotation(
    Line(points = {{-79, 60}, {-70, 60}, {-70, -12}, {-52, -12}}, color = {0, 0, 127}));
  connect(irradianceData1.beamIrradianceTiltedSurface, solarCollector1.beamIrradiance) annotation(
    Line(points = {{-79, 97}, {-62, 97}, {-62, -3}, {-52, -3}}, color = {0, 0, 127}));
  connect(irradianceData1.diffuseIrradianceTiltedSurface, solarCollector1.diffuseIrradiance) annotation(
    Line(points = {{-79, 92}, {-66, 92}, {-66, -16}, {-52, -16}}, color = {0, 0, 127}));
  connect(irradianceData1.angleOfIncidenceSignal, solarCollector1.angleOfIncidence) annotation(
    Line(points = {{-79, 87}, {-74, 87}, {-74, -7}, {-52, -7}}, color = {0, 0, 127}));
  connect(solarCollector1.temperatureProbe, differentialThermostat.CollectorTemperatureProbe) annotation(
    Line(points = {{-24, -4}, {-18, -4}, {-18, 8}, {-44, 8}, {-44, 30}, {-32, 30}, {-32, 30}}, color = {0, 0, 127}));
  connect(boilerAmbientTemperature.y, boiler.T_amb) annotation(
    Line(points = {{-18, 84}, {-12, 84}, {-12, 56}, {2, 56}, {2, 58}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end STS123131;
