within Soltermica.ThermoFluidSystems.HeatExchangers;

model Plate
  extends Soltermica.BaseClasses.Icons.NameIcon;
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b_1(
    final medium = medium_1)
    annotation(
      Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a_2(
    final medium=medium_2)
    annotation(
      Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b_2(
    final medium=medium_2)
    annotation(
      Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a_1(
    final medium=medium_1)
    annotation(
      Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BaseClasses.ControlVolumes.CylindricalMultiElement cylindricalMultiElement1(
    final n=n,
    final volume=specs.V_1,
    final height=specs.L_int,
    final V_flowNominal = specs.V_flow_nom_1,
    final dpNominal = specs.dp_nom_1,
    final medium=medium_1,
    T0=T0)
    annotation(
      Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Soltermica.BaseClasses.ControlVolumes.CylindricalMultiElement cylindricalMultiElement2(
    final n=n,
    final volume=specs.V_2,
    final height=specs.L_int,
    final dpNominal=specs.dp_nom_2,
    final V_flowNominal=specs.V_flow_nom_2,
    final medium=medium_2,
    T0=T0)
    annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Soltermica.BaseClasses.HeatTransfer.OneDimensional oneDimensional[n](
    each U=specs.U_int,
    each A=(specs.S_int/n))
    annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.SIunits.Power totalHeatExchanged "Total heat exchanged for HEX";
//Model parameters
  parameter Integer n=1;
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium_1=Modelica.Thermal.FluidHeatFlow.Media.Medium();
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium_2=Modelica.Thermal.FluidHeatFlow.Media.Medium();
  parameter Soltermica.ThermoFluidSystems.HeatExchangers.Catalogue.TechnicalSpecifications specs=Soltermica.ThermoFluidSystems.HeatExchangers.Catalogue.TechnicalSpecifications();
  parameter Modelica.SIunits.Temperature T0(start=293.15);

equation
  connect(flowPort_b_2, cylindricalMultiElement2.flowPort_b) annotation(
    Line(points = {{100, 80}, {50, 80}, {50, 10}, {50, 10}, {50, 10}}, color = {255, 0, 0}));
  connect(flowPort_a_2, cylindricalMultiElement2.flowPort_a) annotation(
    Line(points = {{100, -80}, {50, -80}, {50, -10}, {50, -10}}, color = {255, 0, 0}));
  connect(flowPort_a_1, cylindricalMultiElement1.flowPort_a) annotation(
    Line(points = {{-100, 80}, {-50, 80}, {-50, 10}, {-50, 10}}, color = {255, 0, 0}));
  connect(flowPort_b_1, cylindricalMultiElement1.flowPort_b) annotation(
    Line(points = {{-100, -80}, {-50, -80}, {-50, -10}, {-50, -10}}, color = {255, 0, 0}));
//Heat ports connetion
  connect(cylindricalMultiElement1.innerPort, oneDimensional.port_a) annotation(
    Line(points = {{-40, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {191, 0, 0}));
//For counterflow connection, change order of heat port connection of one side control volume
for i in 1:n loop
  connect(oneDimensional[i].port_b, cylindricalMultiElement2.innerPort[n-i+1]) annotation(
    Line(points = {{10, 0}, {40, 0}, {40, 0}, {40, 0}}, color = {191, 0, 0}));
end for;
//Sum of the heat flow through the heat ports
  totalHeatExchanged=sum(oneDimensional[i].port_a.Q_flow for i in 1:n);
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 100}, {40, -100}}), Line(points = {{-40, 80}, {40, -80}}), Line(points = {{-40, -80}, {40, 80}}), Line(origin = {0, 60}, points = {{-38, 0}, {38, 0}}), Line(origin = {0, 20}, points = {{-38, 0}, {38, 0}}), Line(origin = {0, -20}, points = {{-38, 0}, {38, 0}}), Line(origin = {0, -60}, points = {{-38, 0}, {38, 0}}), Line(origin = {-70, 80}, points = {{-30, 0}, {30, 0}}), Line(origin = {70, 80}, points = {{-30, 0}, {30, 0}}), Line(origin = {-70, -80}, points = {{-30, 0}, {30, 0}}), Line(origin = {69, -80}, points = {{-29, 0}, {29, 0}})}, coordinateSystem(initialScale = 0.1)));
end Plate;
