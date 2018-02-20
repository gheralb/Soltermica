within Soltermica.ThermoFluidSystems.Pumps.Examples;

model ValidationCirculator
  extends Modelica.Icons.Example;
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20),
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20),
    medium = Soltermica.Media.Water())
    annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve valve1(
    Kv1 = 0.0002,
    T0 = Modelica.SIunits.Conversions.from_degC(20),
    dp0 = 151300,
    frictionLoss = 0,
    kv0 = 0.00001,
    medium = Soltermica.Media.Water(),
    rho0 = 995.6,
    y1 = 1)
    annotation(
      Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(
    rising=0.01,
    width=120,
    falling=0.01,
    period=3600,
    startTime=10)
    annotation(
      Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid2(
    amplitude=0.5,
    rising=2,
    width=10,
    falling=2,
    period=3600,
    startTime=60)
    annotation(
      Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Circulator circulator(
    medium = Soltermica.Media.Water(),
    specs=Soltermica.ThermoFluidSystems.Pumps.Catalogue.GRUNDFOS_UPS_25_120())
    annotation(
      Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.ExpansionVessel.ExpansionVessel expansionVessel(
    T_start = 293.15,
    V_start = 0.001, 
    p_start = 200000,
    medium = Soltermica.Media.Water())
    annotation(
    Placement(visible = true, transformation(origin = {-52, -52}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(expansionVessel.flowPort_a, circulator.flowPort_a) annotation(
    Line(points = {{-52, -42}, {-52, -42}, {-52, 0}, {-40, 0}, {-40, 0}}, color = {255, 0, 0}));
  connect(ambient1.flowPort, circulator.flowPort_a) annotation(
  Line(points = {{-70, 0}, {-40, 0}}, color = {255, 0, 0}));
  connect(circulator.flowPort_b, valve1.flowPort_a) annotation(
  Line(points = {{-20, 0}, {20, 0}, {20, 0}, {20, 0}}, color = {255, 0, 0}));
  connect(trapezoid1.y, circulator.u) annotation(
  Line(points = {{-38, 50}, {-30, 50}, {-30, 8}, {-30, 8}}, color = {0, 0, 127}));
  connect(trapezoid2.y, valve1.y) annotation(
  Line(points = {{21, 50}, {30, 50}, {30, 10}}, color = {0, 0, 127}));
  connect(valve1.flowPort_b, ambient2.flowPort) annotation(
    Line(points = {{40, 0}, {70, 0}, {70, 0}, {70, 0}}, color = {255, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end ValidationCirculator;
