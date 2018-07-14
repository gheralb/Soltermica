within Soltermica.ThermoFluidSystems.Faucets.Examples;

model ValidationSingleLeverMixerFaucet
  extends Modelica.Icons.Example;
  SingleLeverMixerFaucet singleLeverMixerFaucet1(
    Kv_grifo = 0.0002,
    dp_grifo = 300000,
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient hotWaterSource(
    constantAmbientPressure = 401300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(60),
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient coldWaterSource(
    constantAmbientPressure = 401300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(10),
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient sink(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20),
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {90, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable HotWaterConsumptionProfile(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:\\Users\\gonzalo-hernandez\\Desktop\\SHELDON\\Soltermica\\TemporalData_Exp002\\testProfileFaucet.txt", offset = {0}, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = "DTIE", tableOnFile = true, timeScale = 1.0)
  annotation(
    Placement(visible = true, transformation(origin = {-72, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp rampTemperature(duration = 10, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sensors.VolumeFlowSensor volumeFlowSensor(
   medium=Soltermica.Media.Water())
   annotation(
    Placement(visible = true, transformation(origin = {52, -12}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensor(
    medium=Soltermica.Media.Water())
    annotation(
    Placement(visible = true, transformation(origin = {88, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(visible = true, transformation(origin = {48, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(HotWaterConsumptionProfile.y[1], singleLeverMixerFaucet1.waterFlow) annotation(
    Line(points = {{-61, 32}, {-40, 32}, {-40, 8}, {-8, 8}}, color = {0, 0, 127}, thickness = 0.5));
  connect(hotWaterSource.flowPort, singleLeverMixerFaucet1.hotWaterIn) annotation(
    Line(points = {{40, -70}, {-4, -70}, {-4, -8}}, color = {255, 0, 0}));
  connect(volumeFlowSensor.y, integrator.u) annotation(
    Line(points = {{52, 0}, {52, 0}, {52, 30}, {24, 30}, {24, 52}, {36, 52}, {36, 52}}, color = {0, 0, 127}));
  connect(singleLeverMixerFaucet1.flowPort_b1, temperatureSensor.flowPort) annotation(
    Line(points = {{10, 2}, {68, 2}, {68, 30}, {78, 30}, {78, 30}}, color = {255, 0, 0}));
  connect(volumeFlowSensor.flowPort_b, sink.flowPort) annotation(
    Line(points = {{62, -12}, {80, -12}}, color = {255, 0, 0}));
  connect(singleLeverMixerFaucet1.flowPort_b1, volumeFlowSensor.flowPort_a) annotation(
    Line(points = {{10, 2}, {14, 2}, {14, -12}, {42, -12}}, color = {255, 0, 0}));
  connect(rampTemperature.y, singleLeverMixerFaucet1.waterTemperature) annotation(
    Line(points = {{-58, -30}, {-38, -30}, {-38, -4}, {-8, -4}, {-8, -4}}, color = {0, 0, 127}));
  connect(coldWaterSource.flowPort, singleLeverMixerFaucet1.coldWaterIn) annotation(
    Line(points = {{40, -40}, {6, -40}, {6, -8}}, color = {255, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end ValidationSingleLeverMixerFaucet;
