within Soltermica.BaseClasses.ControlVolumes;

model CylindricalMultiElement "Cylindrical control volumen with spatial discretization"
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a(
    final medium = medium)
    annotation(
  Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100,0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b(
    final medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100,0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a innerPort[n]
    annotation(
      Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b outerPort[n]
    annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BaseClasses.ControlVolumes.Cylindrical controlVolume[n](
    each volume = volume/n,
    each height = height/n,
    each h_g=h_g/n,
//    each V_flowLaminar=V_flowLaminar,
//    each dpLaminar=dpLaminar/n,
    each V_flowNominal=V_flowNominal,
    each dpNominal=dpNominal/n,
    each medium = medium,
    each T0 = T0);
//Model parameters
  parameter Integer n(start=2, min = 1) "Number of control volumes that the model will be divided";
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium() "Fluid of the control volumes. It is the same for all control volumes";
  parameter Modelica.SIunits.Volume volume = 1 "Total volume of the group of control volumes";
  parameter Modelica.SIunits.Length height = 1 "Height of cylinder";
  parameter Modelica.SIunits.Length h_g=0;
//  parameter Modelica.SIunits.VolumeFlowRate V_flowLaminar=0.001;
//  parameter Modelica.SIunits.Pressure dpLaminar=0.001;
  parameter Modelica.SIunits.VolumeFlowRate V_flowNominal=1;
  parameter Modelica.SIunits.Pressure dpNominal=1;
//  parameter Real dp_nom = 1 "Nominal pressure drop for fluid circulation across cylinder shape";
//  parameter Real V_flow_nom = 1 "Nominal volume flow across the cylinder shape";
  parameter Modelica.SIunits.Temperature T0(start=293.15) "Initial temperature of all control volumes";
equation
//Connection extreme ports with model fluid ports
  connect(flowPort_a, controlVolume[1].flowPort_a) annotation(Line);
  connect(flowPort_b, controlVolume[n].flowPort_b) annotation(Line);
//Serial connection between control volumes(unidimensional discretization)
  for i in 1:n-1 loop
    connect(controlVolume[i].flowPort_b, controlVolume[i + 1].flowPort_a);
  end for;
//Connection heat ports
  for i in 1:n loop
    connect(controlVolume[i].innerPort, innerPort[i]);
    connect(controlVolume[i].outerPort, outerPort[i]);
  end for;
annotation(
Icon(graphics = {Rectangle(origin = {-60, 10}, fillColor = {0, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-10, 60}, {20, -80}}), Rectangle(origin = {-4, 10}, fillColor = {0, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 60}, {20, -80}}), Rectangle(origin = {60, 10}, fillColor = {0, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-20, 60}, {10, -80}}), Rectangle(origin = {-55, -3}, pattern = LinePattern.Dot, extent = {{-25, 83}, {25, -77}}), Rectangle(origin = {1, -3}, pattern = LinePattern.Dot, extent = {{-25, 83}, {25, -77}}), Rectangle(origin = {55, -3}, pattern = LinePattern.Dot, extent = {{-25, 83}, {25, -77}})}),
    Documentation(info = "<html><head></head><body><h4><u>Información</u></h4><div>Modelo de volumen de control que se puede dividir en un número determinado de elementos. Los elementos estarán conetacdos entre sí mediante los puertos de fluidos es serie (uno detrás de otro).</div><div>Cabe destacar que el volumen, la altura y la pérdida de carga/caída de presión están divididas entre el número de segmentos.</div><div>(incluir esquema de la subdivisón del cilindro).</div><div><br></div></body></html>"));
end CylindricalMultiElement;
