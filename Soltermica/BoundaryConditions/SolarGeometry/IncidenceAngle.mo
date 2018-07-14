within Soltermica.BoundaryConditions.SolarGeometry;

model IncidenceAngle
//Inputs and outputs
  Modelica.Blocks.Interfaces.RealInput acimutSolar annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput anguloZenital annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput anguloIncidencia annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
//Parameters relating to the area of incidence
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg inclinacion(displayUnit="deg")=0;
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg orientacion(displayUnit="deg")=0;
equation
  Modelica.Math.cos(anguloIncidencia)=Modelica.Math.cos(anguloZenital)*Modelica.Math.cos(Modelica.SIunits.Conversions.from_deg(inclinacion))
    +Modelica.Math.sin(anguloZenital)*Modelica.Math.sin(Modelica.SIunits.Conversions.from_deg(inclinacion))*Modelica.Math.cos(acimutSolar-Modelica.SIunits.Conversions.from_deg(orientacion));
end IncidenceAngle;
