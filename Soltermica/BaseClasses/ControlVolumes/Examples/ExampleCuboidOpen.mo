within Soltermica.BaseClasses.ControlVolumes.Examples;

model ExampleCuboidOpen
  extends Modelica.Icons.Example;
  CuboidOpen CuboidOpen1(
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow1(
    T0 = 293.15,
    constantVolumeFlow = 0,
    m = 0.001,
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow2(
    T0 = 293.15,
    m = 0.001,
    medium = Soltermica.Media.Water(),
    useVolumeFlowInput = true)
    annotation(
      Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 303.15,
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 293.15,
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {68, -48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Trapezoid trapezoid2(
    amplitude = 0.0003,
    falling = 3,
    period = 100,
    rising = 2,
    startTime = 1,
    width = 60)
    annotation(
      Placement(visible = true, transformation(origin = {-28, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(
    Q_flow = 1000)
    annotation(
      Placement(visible = true, transformation(origin = {-22, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(volumeFlow2.flowPort_b, ambient2.flowPort) annotation(
    Line(points = {{60, 0}, {68, 0}, {68, -38}}, color = {255, 0, 0}));
  connect(fixedHeatFlow1.port, CuboidOpen1.puertoInt) annotation(
    Line(points = {{-12, 46}, {0, 46}, {0, 10}, {0, 10}}, color = {191, 0, 0}));
  connect(trapezoid2.y, volumeFlow2.volumeFlow) annotation(
    Line(points = {{-16, 88}, {50, 88}, {50, 10}, {50, 10}}, color = {0, 0, 127}));
  connect(CuboidOpen1.flowPort_b, volumeFlow2.flowPort_a) annotation(
    Line(points = {{10, 0}, {40, 0}, {40, 0}, {40, 0}}, color = {255, 0, 0}));
  connect(volumeFlow1.flowPort_b, CuboidOpen1.flowPort_a) annotation(
    Line(points = {{-40, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {255, 0, 0}));
  connect(ambient1.flowPort, volumeFlow1.flowPort_a) annotation(
    Line(points = {{-70, -40}, {-71, -40}, {-71, 0}, {-60, 0}}, color = {255, 0, 0}));
  annotation(uses(Modelica(version = "3.2.2")));
end ExampleCuboidOpen;
