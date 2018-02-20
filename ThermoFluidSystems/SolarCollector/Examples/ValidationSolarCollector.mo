within Soltermica.ThermoFluidSystems.SolarCollector.Examples;

model ValidationSolarCollector
  extends Modelica.Icons.Example;
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient source(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 343.15,
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient sink(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 293.15,
    medium = Soltermica.Media.Water())
  annotation(
    Placement(visible = true, transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow(
    T0 = 293.15,
    m = 0.1,
    medium = Soltermica.Media.Water(),
    useVolumeFlowInput = true)
    annotation(
      Placement(visible = true, transformation(origin = {-46, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant shadeFactor(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp beamIrradiance(
    duration = 500,
    height = 1000,
    startTime = 300)
    annotation(
      Placement(visible = true, transformation(origin = {-90, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp angleOfIncidence(
    duration = 100,
    height = -90,
    offset = 90,
    startTime = 100)
    annotation(
      Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sensors.EnthalpyFlowSensor enthalpyFlowSensorIn(
    T(start = 293.15),
    medium = Soltermica.Media.Water())
  annotation(
    Placement(visible = true, transformation(origin = {-46, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Sensors.EnthalpyFlowSensor enthalpyFlowSensorOut(
    T(start = 293.15),
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {60, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add outputPower(
    k1 = +1,
    k2 = -1)
    annotation(
      Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant ambientTemperature(k = 303.15) annotation(
    Placement(visible = true, transformation(origin = {-90, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp volumeFlowTest(
    duration = 100,
    height = 0.0000405, offset = 0.00000001)
    annotation(
      Placement(visible = true, transformation(origin = {-90, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.SolarCollector.SolarCollector solarCollector(
    medium = Soltermica.Media.Water(),
    specs = Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.BAXIROCA_PS_2_0()) 
    annotation(
      Placement(visible = true, transformation(origin = {0, 36}, extent = {{-38, -38}, {38, 38}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp diffuseIrradiance(
    duration = 14400,
    height = 0,
    offset = 0,
    startTime = 100)
    annotation(
      Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(beamIrradiance.y, solarCollector.beamIrradiance) annotation(
    Line(points = {{-79, 84}, {-56, 84}, {-56, 60.5}, {-32, 60.5}, {-32, 61}}, color = {0, 0, 127}));
  connect(shadeFactor.y, solarCollector.shadeFactor) annotation(
    Line(points = {{-79, 20}, {-70.5, 20}, {-70.5, 36}, {-32, 36}}, color = {0, 0, 127}));
  connect(volumeFlowTest.y, volumeFlow.volumeFlow) annotation(
    Line(points = {{-79, -76}, {-69.5, -76}, {-69.5, -56}, {-56, -56}, {-56, -56}}, color = {0, 0, 127}));
  connect(ambientTemperature.y, solarCollector.ambientTemperatureSignal) annotation(
    Line(points = {{-79, -42}, {-60.5, -42}, {-60.5, 12}, {-32, 12}}, color = {0, 0, 127}));
  connect(angleOfIncidence.y, solarCollector.angleOfIncidence) annotation(
    Line(points = {{-79, 50}, {-32, 50}, {-32, 49}}, color = {0, 0, 127}));
  connect(diffuseIrradiance.y, solarCollector.diffuseIrradiance) annotation(
    Line(points = {{-79, -10}, {-66.5, -10}, {-66.5, 24}, {-32, 24}}, color = {0, 0, 127}));
  connect(enthalpyFlowSensorIn.flowPort_b, solarCollector.flowPort_a1) annotation(
    Line(points = {{-46, -12}, {-46, 0.5}, {-38, 0.5}, {-38, 2}}, color = {255, 0, 0}));
  connect(source.flowPort, volumeFlow.flowPort_a) annotation(
    Line(points = {{80, -70}, {-46, -70}, {-46, -66}}, color = {255, 0, 0}));
  connect(volumeFlow.flowPort_b, enthalpyFlowSensorIn.flowPort_a) annotation(
    Line(points = {{-46, -46}, {-46, -32}}, color = {255, 0, 0}));
  connect(solarCollector.flowPort_b1, enthalpyFlowSensorOut.flowPort_a) annotation(
    Line(points = {{37, 70}, {50, 70}}, color = {255, 0, 0}));
  connect(enthalpyFlowSensorIn.y, outputPower.u2) annotation(
    Line(points = {{-35, -22}, {34, -22}, {34, -6}, {78, -6}}, color = {0, 0, 127}));
  connect(enthalpyFlowSensorOut.flowPort_b, sink.flowPort) annotation(
    Line(points = {{70, 70}, {80, 70}}, color = {255, 0, 0}));
  connect(enthalpyFlowSensorOut.y, outputPower.u1) annotation(
    Line(points = {{60, 59}, {60, 6}, {78, 6}}, color = {0, 0, 127}));
annotation(
  uses(Modelica(version = "3.2.2")));
end ValidationSolarCollector;
