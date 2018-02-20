within Soltermica.SolarThermalSystems.ResidentialSingleFamily;

model STS122131
  extends Soltermica.BaseClasses.Icons.SoltermicaExample;
  Soltermica.ThermoFluidSystems.WaterStorage.HotWaterTankInternalHeatExchanger hotWaterTankInternalHeatExchanger(medium = Soltermica.Media.Water(), medium_HEX = Soltermica.Media.Water70PropyleneGlycol30_25(), n = 10, n_int = 4, specs = Soltermica.ThermoFluidSystems.WaterStorage.Catalogue.BAXI_FST_160()) annotation(
    Placement(visible = true, transformation(origin = {12, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.Pumps.Circulator circulator(medium = Soltermica.Media.Water70PropyleneGlycol30_25(), specs = Soltermica.ThermoFluidSystems.Pumps.Catalogue.GRUNDFOS_UPS_25_120()) annotation(
    Placement(visible = true, transformation(origin = {-26, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.AbsolutePressure primaryReferencePressure(medium = Soltermica.Media.Water70PropyleneGlycol30_25(), p = 251300) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient supplyWater(constantAmbientPressure = 3.013e+10, useTemperatureInput = true, medium = Soltermica.Media.Water()) annotation(
    Placement(visible = true, transformation(origin = {52, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoFluidSystems.Faucets.SingleLeverMixerFaucet singleLeverMixerFaucet(Kv_grifo = 0.0002, dp_grifo = 251300, medium = Soltermica.Media.Water()) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable ambientTemperature(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:\\Users\\gonzalo-hernandez\\Desktop\\SHELDON\\Soltermica\\TemporalData_Exp002\\TemperaturasSeca.mat", offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, tableName = "D3_TempSec", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant boilerAmbientTemperature(k = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-30, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BoundaryConditions.SolarRadiation.IrradianceData irradianceData1(fileName = "C:\\Users\\gonzalo-hernandez\\Desktop\\SHELDON\\Soltermica\\TemporalData_Exp002\\EPW_Murcia.txt", husoHorario = 1, inclinacion = 45, latitudLugar = 38.003, longitudLugar = -1.169, orientacion = 0, tableName = "Murcia") annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.SolarCollector.SolarCollector solarCollector1(medium = Soltermica.Media.Water70PropyleneGlycol30_25(), specs = Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.BAXI_MEDITERRANEO_200()) annotation(
    Placement(visible = true, transformation(origin = {-40, -12}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.Controllers.DifferentialThermostat differentialThermostat(DeltaT_off = 3, DeltaT_on = 10, waterStorageMaxTemperature = 333.15) annotation(
    Placement(visible = true, transformation(origin = {-24, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(solarCollector1.temperatureProbe, differentialThermostat.CollectorTemperatureProbe) annotation(
    Line(points = {{-24, -4}, {-18, -4}, {-18, 8}, {-44, 8}, {-44, 30}, {-32, 30}, {-32, 30}}, color = {0, 0, 127}));
  connect(hotWaterTankInternalHeatExchanger.temperatureSensorSignal, differentialThermostat.WaterStorageProbe) annotation(
    Line(points = {{24, -10}, {26, -10}, {26, 10}, {-40, 10}, {-40, 24}, {-32, 24}, {-32, 24}}, color = {0, 0, 127}));
  connect(differentialThermostat.PumpOut, circulator.u) annotation(
    Line(points = {{-12, 24}, {-8, 24}, {-8, -26}, {-26, -26}, {-26, -42}, {-26, -42}}, color = {0, 0, 127}));
  connect(irradianceData1.angleOfIncidenceSignal, solarCollector1.angleOfIncidence) annotation(
    Line(points = {{-78, 46}, {-74, 46}, {-74, -8}, {-52, -8}, {-52, -8}}, color = {0, 0, 127}));
  connect(irradianceData1.diffuseIrradianceTiltedSurface, solarCollector1.diffuseIrradiance) annotation(
    Line(points = {{-78, 50}, {-66, 50}, {-66, -16}, {-52, -16}, {-52, -16}}, color = {0, 0, 127}));
  connect(irradianceData1.beamIrradianceTiltedSurface, solarCollector1.beamIrradiance) annotation(
    Line(points = {{-78, 54}, {-62, 54}, {-62, -2}, {-52, -2}, {-52, -2}}, color = {0, 0, 127}));
  connect(shadeFactor.y, solarCollector1.shadeFactor) annotation(
    Line(points = {{-78, 0}, {-70, 0}, {-70, -12}, {-52, -12}, {-52, -12}}, color = {0, 0, 127}));
  connect(ambientTemperature.y[1], solarCollector1.ambientTemperatureSignal) annotation(
    Line(points = {{-78, -50}, {-72, -50}, {-72, -22}, {-52, -22}, {-52, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(circulator.flowPort_b, solarCollector1.flowPort_a1) annotation(
    Line(points = {{-36, -50}, {-62, -50}, {-62, -24}, {-54, -24}}, color = {255, 0, 0}));
  connect(boilerAmbientTemperature.y, boiler.T_amb) annotation(
    Line(points = {{-18, 84}, {-12, 84}, {-12, 56}, {2, 56}, {2, 58}}, color = {0, 0, 127}));
  connect(leverPositionSignal.y, singleLeverMixerFaucet.waterTemperature) annotation(
    Line(points = {{42, 84}, {22, 84}, {22, 46}, {42, 46}, {42, 44}}, color = {0, 0, 127}));
  connect(hotWaterDemandProfile.y[1], singleLeverMixerFaucet.waterFlow) annotation(
    Line(points = {{78, 64}, {28, 64}, {28, 54}, {42, 54}, {42, 56}}, color = {0, 0, 127}, thickness = 0.5));
  connect(supplyWater.flowPort, singleLeverMixerFaucet.coldWaterIn) annotation(
    Line(points = {{42, -58}, {34, -58}, {34, 6}, {54, 6}, {54, 40}, {56, 40}}, color = {255, 0, 0}));
  connect(singleLeverMixerFaucet.flowPort_b1, sink.flowPort) annotation(
    Line(points = {{60, 50}, {60, 50}, {60, 30}, {70, 30}, {70, 30}}, color = {255, 0, 0}));
  connect(boiler.flowPort_b, singleLeverMixerFaucet.hotWaterIn) annotation(
    Line(points = {{16, 40}, {16, 40}, {16, 30}, {44, 30}, {44, 40}, {46, 40}}, color = {255, 0, 0}));
  connect(hotWaterTankInternalHeatExchanger.flowPort_b, boiler.flowPort_a) annotation(
    Line(points = {{12, -8}, {10, -8}, {10, 24}, {4, 24}, {4, 40}, {4, 40}}, color = {255, 0, 0}));
  connect(supplyWaterTemperature.y[1], supplyWater.ambientTemperature) annotation(
    Line(points = {{80, -70}, {70, -70}, {70, -64}, {62, -64}, {62, -64}}, color = {0, 0, 127}, thickness = 0.5));
  connect(supplyWater.flowPort, hotWaterTankInternalHeatExchanger.flowPort_a) annotation(
    Line(points = {{42, -58}, {12, -58}, {12, -28}, {12, -28}}, color = {255, 0, 0}));
  connect(primaryReferencePressure.flowPort, circulator.flowPort_a) annotation(
    Line(points = {{-10, -60}, {-10, -60}, {-10, -50}, {-16, -50}, {-16, -50}}, color = {255, 0, 0}));
  connect(circulator.flowPort_a, hotWaterTankInternalHeatExchanger.flowPort_b_HEX) annotation(
    Line(points = {{-16, -50}, {-8, -50}, {-8, -26}, {2, -26}, {2, -26}}, color = {255, 0, 0}));
  connect(solarCollector1.flowPort_b1, hotWaterTankInternalHeatExchanger.flowPort_a_HEX) annotation(
    Line(points = {{-26, 0}, {-14, 0}, {-14, -18}, {2, -18}, {2, -18}}, color = {255, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end STS122131;
