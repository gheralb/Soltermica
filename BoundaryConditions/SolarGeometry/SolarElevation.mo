within Soltermica.BoundaryConditions.SolarGeometry;

model SolarElevation
  Modelica.Blocks.Interfaces.RealInput declSol annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput angHor annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput elevSol annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg latitudLugar "Decimal degrees. West lengths negatives";
equation
  elevSol =  Modelica.Math.asin(Modelica.Math.cos(Modelica.SIunits.Conversions.from_deg(latitudLugar))*Modelica.Math.cos(declSol)*
    Modelica.Math.cos(angHor) + Modelica.Math.sin(Modelica.SIunits.Conversions.from_deg(latitudLugar))*Modelica.Math.sin(declSol));
end SolarElevation;
