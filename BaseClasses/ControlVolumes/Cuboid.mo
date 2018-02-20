within Soltermica.BaseClasses.ControlVolumes;

model Cuboid
  extends Modelica.Thermal.FluidHeatFlow.Interfaces.Partials.TwoPort(
    m=volume*medium.rho,
    final tapT=0);
  extends Soltermica.BaseClasses.ControlVolumes.FrictionLoss(
    V_flowNominal=1,
    dpNominal=1);
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a innerPort 
    "Heat port for internal heat exchange" annotation(
      Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b outerPort 
    "Heat port for external heat exchange (Ambient, etc.)" annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.SIunits.HeatFlowRate Q_flow_int;
  Modelica.SIunits.HeatFlowRate Q_flow_ext;
//Model paremeters
  parameter Modelica.SIunits.Length length=1 "Length of vontrol volume";
  parameter Modelica.SIunits.Length width=1 "Width of vontrol volume";
  parameter Modelica.SIunits.Length height=1 "Height of vontrol volume";
  parameter Modelica.SIunits.Volume volume=length*width*height "Total volume of control volume";
  parameter Modelica.SIunits.Length h_g(start=0)=0
    "Geodetic height (height difference from flowPort_a to flowPort_b)";
equation
// coupling with FrictionModel
  volumeFlow = V_flow;
  dp = pressureDrop + medium.rho*Modelica.Constants.g_n*h_g;
//Energy exchange with medium
  Q_flow_int=innerPort.Q_flow + Q_friction;
  T=innerPort.T;
  Q_flow_ext=outerPort.Q_flow;
  T=outerPort.T;
//Net heat flow in the control volume
  Q_flow = Q_flow_int + Q_flow_ext;
  annotation(
    Icon(graphics = {Rectangle(origin = {0, -20}, fillColor = {0, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Sphere, extent = {{-60, -40}, {60, 80}}), Rectangle(pattern = LinePattern.Dot, extent = {{-80, 80}, {80, -80}})}, coordinateSystem(initialScale = 0.1)));
end Cuboid;
