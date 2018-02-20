within Soltermica.BoundaryConditions.BaseClasses;

model SolarTime 
  Modelica.Blocks.Interfaces.RealInput tiempoUTC annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput EdT annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  Real tiempoSolarMG "Solar time on the Greenwich meridian - reference UTC";
  
  Modelica.Blocks.Interfaces.RealOutput tiempoSolar annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg longitudLugar(displayUnit="deg")=0;//Length in decimals degrees format. THIS positive and WEST negative
protected
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg longitudMG(displayUnit="deg")=0;//Greenwich Meridian length 
equation
  tiempoSolarMG=tiempoUTC+EdT;
  //tiempoSolar=tiempoSolarMG+((longitudMG-longitudLugar)/(360/24))*3600;
  tiempoSolar=tiempoSolarMG+((longitudLugar)/(360/24))*3600;
end SolarTime;
