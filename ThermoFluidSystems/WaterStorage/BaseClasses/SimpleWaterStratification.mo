within Soltermica.ThermoFluidSystems.WaterStorage.BaseClasses;

model SimpleWaterStratification
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b heatPort[nSeg] annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.SIunits.HeatFlowRate Q_temperatureInversion[nSeg-1];
  Modelica.SIunits.TemperatureDifference dT[nSeg-1];
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium=Modelica.Thermal.FluidHeatFlow.Media.Medium();
  parameter Integer nSeg=3 "Number of segments into which the volume has been divided";
  parameter Modelica.SIunits.Volume volume=1;
  parameter Modelica.SIunits.Length height=1;
  parameter Modelica.SIunits.Time timeConstant=1 
    "Constant of time that governs the temperature inversion phenomenon";
equation
//Heat flow in each segment due to the temperature inversion phenomenon
  for i in 1:nSeg-1 loop
    dT[i]= heatPort[i].T-heatPort[i+1].T;
    Q_temperatureInversion[i]=noEvent(smooth(0,if dT[i]>0 then ((volume/nSeg)*medium.rho*medium.cp*(((heatPort[i].T+heatPort[i+1].T)/2)-heatPort[i+1].T))/timeConstant else 0));
/*    Q_temperatureInversion[i]=noEvent(smooth(1,if dT[i]>0 then (((volume/nSeg)*medium.rho*medium.cp*dT[i]^2)/timeConstant) else 0));//Equation in Buildings*/
  end for;
//Net heat flow in each element
  heatPort[1].Q_flow=Q_temperatureInversion[1];
  for i in 2:nSeg-1 loop
    heatPort[i].Q_flow=Q_temperatureInversion[i]-Q_temperatureInversion[i-1];
  end for;
  heatPort[nSeg].Q_flow=-Q_temperatureInversion[nSeg-1];
annotation(
  Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-2, 39}, fillColor = {255, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-78, 41}, {82, -39}}), Rectangle(origin = {-2, -41}, fillColor = {0, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-78, 41}, {82, -39}})}));
end SimpleWaterStratification;
