within Soltermica.ThermoFluidSystems.ExpansionVessel;

model ExpansionVessel
  extends Soltermica.BaseClasses.Icons.ExpansionVessel;
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a(
    final medium=medium)
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
  Modelica.SIunits.Mass m;
  Modelica.SIunits.Energy H;
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium=Modelica.Thermal.FluidHeatFlow.Media.Medium()
    annotation(choicesAllMatching=true);
  parameter Modelica.SIunits.Pressure p_start(start=101300);
  parameter Modelica.SIunits.Temperature T_start(start=293.15);
  parameter Modelica.SIunits.Volume V_start(start=1);

initial equation 
  m=V_start*medium.rho;
  H=m*medium.cp*T_start;
equation 
  der(m) = flowPort_a.m_flow;
  der(H) = flowPort_a.m_flow * smooth(0, if flowPort_a.m_flow > 0.0 then flowPort_a.h else flowPort_a.h);
  flowPort_a.p = p_start;
  m * flowPort_a.h = H;
end ExpansionVessel;
