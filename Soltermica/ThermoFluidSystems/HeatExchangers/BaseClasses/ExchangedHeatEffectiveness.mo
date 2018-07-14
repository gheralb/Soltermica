within Soltermica.ThermoFluidSystems.HeatExchangers.BaseClasses;

model ExchangedHeatEffectiveness
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a1 annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a2 annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput temperatureIn1 annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput massFlow1 annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput temperatureIn2 annotation(
    Placement(visible = true, transformation(origin = {100, 50}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {80, 50}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput massFlow2 annotation(
    Placement(visible = true, transformation(origin = {100, -50}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {80, -50}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));

  parameter Boolean fixedEffectiveness=true;

  Modelica.SIunits.ThermalConductance C1_flow
    "Heat capacity flow rate medium 1";
  Modelica.SIunits.ThermalConductance C2_flow
    "Heat capacity flow rate medium 2";
  Modelica.SIunits.ThermalConductance CMin_flow(min=0)
    "Minimum heat capacity flow rate";
  Modelica.SIunits.ThermalConductance CMax_flow(min=0);
//  Real C_r(max=1) "Heat capacity ratio";
  Modelica.SIunits.HeatFlowRate QMax_flow
    "Maximum heat flow rate into medium 1";
  Real heatExchangeEffectiveness (min=0, max=1);
  Real NTU "Number of transfer units";

  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium1=Modelica.Thermal.FluidHeatFlow.Media.Medium();
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium2=Modelica.Thermal.FluidHeatFlow.Media.Medium();
  parameter Modelica.SIunits.Area heatExchangeArea "Heat exchange area";
  parameter Real U "Overall heat transfer coeffient";
  parameter Real heatExchangeEffectivenessFixed if fixedEffectiveness;
  
equation
  C1_flow=massFlow1*medium1.cp;
  C2_flow=massFlow2*medium2.cp;
  
  CMin_flow = min(max(C1_flow,0),max(C2_flow,0));
  CMax_flow = max({C1_flow,C2_flow,0});
  
//  C_r=noEvent(if abs(CMax_flow)>0 then CMin_flow/CMax_flow else 0);
  
//  NTU=noEvent(if abs(CMin_flow)>0 then U*heatExchangeArea/CMin_flow else 0);
  NTU=smooth(0,if abs(CMin_flow)<0 then U*heatExchangeArea/CMin_flow else 0);

  if not fixedEffectiveness then
/*    heatExchangeEffectiveness=noEvent(if abs(C_r)>0 then (1-Modelica.Math.exp(-NTU*(1-C_r)))/(1-C_r*Modelica.Math.exp(-NTU*(1-C_r))) else 0);*/
    heatExchangeEffectiveness=heatExchangeEffectivenessFixed;
  else
    heatExchangeEffectiveness=heatExchangeEffectivenessFixed;
  end if;
  
//  QMax_flow = noEvent(if abs(CMin_flow)>0 then CMin_flow*(temperatureIn1 - temperatureIn2) else 0);
  QMax_flow = smooth(0, if abs(CMin_flow)>0 then CMin_flow*(temperatureIn1 - temperatureIn2) else 0);
  
  port_a1.Q_flow=QMax_flow*heatExchangeEffectiveness;
  port_a2.Q_flow=-port_a1.Q_flow;
annotation(
    Icon(graphics = {Text(origin = {-7, 13}, extent = {{-93, 87}, {107, -113}}, textString = "E", fontName = "Arial")}));end ExchangedHeatEffectiveness;
