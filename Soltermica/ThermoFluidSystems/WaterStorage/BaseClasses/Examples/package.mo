within Soltermica.ThermoFluidSystems.WaterStorage.BaseClasses;

package Examples
  extends Modelica.Icons.ExamplesPackage;



  model ExampleOrderedWaterStratification2
    extends Modelica.Icons.Example;
    Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow(T0 = 293.15, constantVolumeFlow = 0.001, m = 0.1, useVolumeFlowInput = true, medium = medium) annotation(
      Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Soltermica.ThermoFluidSystems.WaterStorage.BaseClasses.OrderedWaterStratification orderedWaterStratification(nSeg = nSeg, medium = medium) annotation(
      Placement(visible = true, transformation(origin = {18, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid(
      amplitude = 0.0001388,
      falling = 10,
      offset = 0,
      period = 10000,
      rising = 10,
      startTime = 10,
      width = 3600)
      annotation(
        Placement(visible = true, transformation(origin = {-70, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constantPressure(k = 101300) annotation(
      Placement(visible = true, transformation(origin = {68, -52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    //Parameters of the model
    parameter Integer nSeg =1;
    parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Water();
    parameter Modelica.SIunits.Temperature TempDistribution[nSeg] = {303.15};
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature[nSeg] annotation(
      Placement(visible = true, transformation(origin = {68, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Components.HeatedPipe heatedPipe(T0 = 293.15, V_flowLaminar = 0.0005, V_flowNominal = 0.001, dpLaminar = 50, dpNominal = 100, h_g = 0, m = 0.1,medium=medium)  annotation(
      Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 100, falling = 10, offset = 0, period = 10000, rising = 10, startTime = 10, width = 3600) annotation(
      Placement(visible = true, transformation(origin = {-78, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
      Placement(visible = true, transformation(origin = {-40, -60}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  equation
    connect(trapezoid1.y, prescribedHeatFlow.Q_flow) annotation(
      Line(points = {{-66, -80}, {-40, -80}, {-40, -70}, {-40, -70}}, color = {0, 0, 127}));
    connect(prescribedHeatFlow.port, heatedPipe.heatPort) annotation(
      Line(points = {{-40, -50}, {-40, -40}}, color = {191, 0, 0}));
    connect(constantPressure.y, orderedWaterStratification.referencePressure) annotation(
      Line(points = {{56, -52}, {18, -52}, {18, -14}}, color = {0, 0, 127}));
    connect(orderedWaterStratification.heatPort, fixedTemperature.port) annotation(
      Line(points = {{28, -6}, {43, -6}, {43, 0}, {58, 0}}, color = {191, 0, 0}, thickness = 0.5));
    connect(volumeFlow.flowPort_b, orderedWaterStratification.flowPort_a) annotation(
      Line(points = {{-30, 0}, {-14, 0}, {-14, -1}, {8, -1}}, color = {255, 0, 0}));
    connect(heatedPipe.flowPort_b, orderedWaterStratification.flowPort_b) annotation(
      Line(points = {{-30, -30}, {-10, -30}, {-10, -11}, {8, -11}}, color = {255, 0, 0}));
    connect(trapezoid.y, volumeFlow.volumeFlow) annotation(
      Line(points = {{-58, 48}, {-40, 48}, {-40, 10}}, color = {0, 0, 127}));
    connect(heatedPipe.flowPort_a, volumeFlow.flowPort_a) annotation(
      Line(points = {{-50, -30}, {-68, -30}, {-68, 0}, {-50, 0}}, color = {255, 0, 0}));
    annotation(
      uses(Modelica(version = "3.2.2")));
  end ExampleOrderedWaterStratification2;












end Examples;
