within Soltermica.ThermoFluidSystems.WaterStorage.BaseClasses.Examples;

model ExampleOrderedWaterStratification
  extends Modelica.Icons.Example;
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow1(
    T0 = 293.15,
    constantVolumeFlow = 0.001,
    m = 0.1,
    useVolumeFlowInput = true,
    medium=medium)
    annotation(
    Placement(visible = true, transformation(origin = {-38, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(
    constantAmbientPressure = 100000,
    constantAmbientTemperature = 293.15,
    medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {-78, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(
    constantAmbientPressure = 100000,
    constantAmbientTemperature = 293.15,
    medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {-80, -36}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.WaterStorage.BaseClasses.OrderedWaterStratification orderedWaterStratification1(
   nSeg=nSeg,
   medium=medium)
   annotation(
    Placement(visible = true, transformation(origin = {18, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature[nSeg](
    T = TempDistribution)
    annotation(
    Placement(visible = true, transformation(origin = {68, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(
  amplitude = 0.0001388,
  falling = 10,
  offset = 0,
  period = 10000,
  rising = 10,
  startTime = 10,
  width = 3600)
  annotation(
    Placement(visible = true, transformation(origin = {-70, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
//Parameters of the model
  parameter Integer nSeg=3;
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Water();
  parameter Modelica.SIunits.Temperature TempDistribution[nSeg]={303.15,303.15,303.15};
equation
  connect(trapezoid1.y, volumeFlow1.volumeFlow) annotation(
    Line(points = {{-58, 48}, {-38, 48}, {-38, 16}, {-38, 16}}, color = {0, 0, 127}));
  connect(volumeFlow1.flowPort_b, orderedWaterStratification1.flowPort_a) annotation(
    Line(points = {{-28, 6}, {-14, 6}, {-14, 5}, {8, 5}}, color = {255, 0, 0}));
  connect(ambient1.flowPort, volumeFlow1.flowPort_a) annotation(
    Line(points = {{-68, 6}, {-48, 6}}, color = {255, 0, 0}));
  connect(ambient2.flowPort, orderedWaterStratification1.flowPort_b) annotation(
    Line(points = {{-70, -36}, {-8, -36}, {-8, -6}, {8, -6}, {8, -5}}, color = {255, 0, 0}));
  connect(orderedWaterStratification1.heatPort, fixedTemperature.port) annotation(
    Line(points = {{28, 0}, {58, 0}}, color = {191, 0, 0}, thickness = 0.5));
  annotation(
    uses(Modelica(version = "3.2.2")));
end ExampleOrderedWaterStratification;
