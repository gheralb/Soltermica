within Soltermica.ThermoFluidSystems.Boilers.Examples;

model ValidationBoiler
  extends Modelica.Icons.Example;
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(constantAmbientPressure = 101300, constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20), medium = Soltermica.Media.Water()) annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(constantAmbientPressure = 101300, constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20), medium = Soltermica.Media.Water()) annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow1(T0 = Modelica.SIunits.Conversions.from_degC(20), m = 0.1, medium = Soltermica.Media.Water(), useVolumeFlowInput = true) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.Boilers.Boiler boiler1(medium = Soltermica.Media.Water(), specs = Soltermica.ThermoFluidSystems.Boilers.Catalogue.BAXI_PLATINIUM_24_24F()) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 0.0002, falling = 10, offset = 0.0000001, period = 3600, rising = 10, startTime = 10, width = 360) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(trapezoid1.y, volumeFlow1.volumeFlow) annotation(
    Line(points = {{-58, -10}, {-30, -10}, {-30, -40}, {-30, -40}}, color = {0, 0, 127}));
  connect(const.y, boiler1.T_amb) annotation(
    Line(points = {{-58, 50}, {-30, 50}, {-30, 16}, {2, 16}, {2, 18}}, color = {0, 0, 127}));
  connect(boiler1.flowPort_b, ambient2.flowPort) annotation(
    Line(points = {{16, 0}, {16, 0}, {16, -50}, {60, -50}, {60, -50}}, color = {255, 0, 0}));
  connect(volumeFlow1.flowPort_b, boiler1.flowPort_a) annotation(
    Line(points = {{-20, -50}, {4, -50}, {4, 0}, {4, 0}}, color = {255, 0, 0}));
  connect(ambient1.flowPort, volumeFlow1.flowPort_a) annotation(
    Line(points = {{-60, -50}, {-40, -50}, {-40, -50}, {-40, -50}}, color = {255, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end ValidationBoiler;
