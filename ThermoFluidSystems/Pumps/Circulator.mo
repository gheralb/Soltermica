within Soltermica.ThermoFluidSystems.Pumps;

model Circulator
  extends Soltermica.BaseClasses.Icons.Pumps;
  extends Soltermica.BaseClasses.Icons.NameIconLow;
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a(
    final medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b(
    final medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow(
    T0 = T0,
    m = specs.V_circ * medium.rho,
    final medium = medium,
    useVolumeFlowInput = true)
    annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(
    k=specs.V_flow_nom)
    annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.SIunits.Power electricalPowerConsumption;
//Model parameters
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium();
  parameter Soltermica.ThermoFluidSystems.Pumps.Catalogue.TechnicalSpecifications specs = Soltermica.ThermoFluidSystems.Pumps.Catalogue.TechnicalSpecifications();
  parameter Modelica.SIunits.Temperature T0 = 293.15;
equation
  electricalPowerConsumption=specs.Pot_elec_nom*u;
  connect(gain.y, volumeFlow.volumeFlow) annotation(
    Line(points = {{0, 38}, {0, 10}}, color = {0, 0, 127}));
  connect(flowPort_a, volumeFlow.flowPort_a) annotation(
    Line(points = {{-100, 0}, {-10, 0}}, color = {255, 0, 0}));
  connect(volumeFlow.flowPort_b, flowPort_b) annotation(
    Line(points = {{10, 0}, {100, 0}}, color = {255, 0, 0}));
  connect(u, gain.u) annotation(
    Line(points = {{0, 100}, {0, 100}, {0, 62}, {0, 62}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.1")));
end Circulator;
