within Soltermica.ThermoFluidSystems.Faucets.Examples;

model ValidationTwinLeverMixerFaucet
  extends Modelica.Icons.Example;
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient hotWaterSource(
    constantAmbientPressure = 401300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(55),
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
        Placement(visible = true, transformation(origin = {50, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(
    rising=3,
    falling=3,
    startTime=10,
    period=1000,
    amplitude=1,
    width=120)
    annotation(
      Placement(visible = true, transformation(origin = {50, -4}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid2(
    period=1000,
    amplitude=1,
    rising=5,
    width=60,
    falling=5,
    startTime=40)
    annotation(
      Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TwinLeverMixerFaucet twinLeverMixerFaucet(
    Kv_grifo = 0.0001,
    dp_grifo = 200000,
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {-4, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(trapezoid2.y, twinLeverMixerFaucet.hotLever) annotation(
    Line(points = {{-40, 0}, {-12, 0}, {-12, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(twinLeverMixerFaucet.coldLever, trapezoid1.y) annotation(
    Line(points = {{4, 0}, {22, 0}, {22, -4}, {40, -4}, {40, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(sink.flowPort, twinLeverMixerFaucet.flowPort_b) annotation(
    Line(points = {{40, 28}, {6, 28}, {6, 4}}, color = {255, 0, 0}));
  connect(coldWaterSource.flowPort, twinLeverMixerFaucet.coldWaterIn) annotation(
    Line(points = {{40, -40}, {0, -40}, {0, -6}, {1, -6}}, color = {255, 0, 0}));
  connect(hotWaterSource.flowPort, twinLeverMixerFaucet.hotWaterIn) annotation(
    Line(points = {{40, -70}, {-9, -70}, {-9, -6}}, color = {255, 0, 0}));
end ValidationTwinLeverMixerFaucet;
