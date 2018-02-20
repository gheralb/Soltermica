within Soltermica.BaseClasses.ControlVolumes.Examples;

model ExampleCylindrical
  extends Modelica.Icons.Example;
  //  extends Modelica.Icons.UnderConstruction;
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(constantAmbientPressure = 0, constantAmbientTemperature = 293.15, medium = medium) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(constantAmbientPressure = 0, constantAmbientTemperature = 293.15, medium = medium) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow(T0 = 293.15, constantVolumeFlow = 2.02e-4, m = 0.1, useVolumeFlowInput = true, medium = medium) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Model parameters
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Soltermica.Media.Water();
  Soltermica.BaseClasses.ControlVolumes.Cylindrical cylindrical(T0 = 323.15, height = 10, volume = 0.005,medium = medium) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BaseClasses.ControlVolumes.CylindricalMultiElement cylindricalMultiElement(medium = medium, T0 = 323.15, h_g = 0, height = 10, n = 5, volume = 0.005) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 20, height = 2.02e-4, startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, volumeFlow.volumeFlow) annotation(
    Line(points = {{-58, 50}, {-40, 50}, {-40, 10}, {-40, 10}}, color = {0, 0, 127}));
  connect(volumeFlow.flowPort_b, cylindrical.flowPort_a) annotation(
    Line(points = {{-30, 0}, {-20, 0}, {-20, -50}, {-10, -50}, {-10, -50}, {-10, -50}}, color = {255, 0, 0}));
  connect(volumeFlow.flowPort_b, cylindricalMultiElement.flowPort_a) annotation(
    Line(points = {{-30, 0}, {-20, 0}, {-20, 50}, {-10, 50}, {-10, 50}}, color = {255, 0, 0}));
  connect(ambient1.flowPort, volumeFlow.flowPort_a) annotation(
    Line(points = {{-60, 0}, {-50, 0}}, color = {255, 0, 0}));
  connect(cylindrical.flowPort_b, ambient2.flowPort) annotation(
    Line(points = {{12, -50}, {35, -50}, {35, 0}, {60, 0}}, color = {255, 0, 0}));
  connect(cylindricalMultiElement.flowPort_b, ambient2.flowPort) annotation(
    Line(points = {{10, 50}, {36, 50}, {36, 0}, {60, 0}, {60, 0}}, color = {255, 0, 0}));
end ExampleCylindrical;
