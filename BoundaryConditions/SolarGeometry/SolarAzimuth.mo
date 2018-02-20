within Soltermica.BoundaryConditions.SolarGeometry;

model SolarAzimuth
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg latitudLugar "Decimal degrees. West lengths negatives";
  Modelica.Blocks.Interfaces.RealInput declSol (
    final quantity="Angle",
    final unit="rad",
    displayUnit="deg") "Declinacion solar"
    annotation(
      Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput angZen(
    final quantity="Angle",
    final unit="rad",
    displayUnit="deg") "Zenital angle"
    annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput angHor (
    final quantity="Angle",
    final unit="rad",
    displayUnit="deg") "Hour angle"
    annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput acimSol (
    final quantity="Angle",
    final unit="rad",
    displayUnit="deg") "Solar azimuth"  
    annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Real aux;
equation
algorithm
  //The acos function has a domain of [-1,1]
  aux:=min(1.0,(max(-1.0,((Modelica.Math.sin(Modelica.SIunits.Conversions.from_deg(latitudLugar))*Modelica.Math.cos(angZen) - Modelica.Math.sin(declSol))/(Modelica.Math.cos(Modelica.SIunits.Conversions.from_deg(latitudLugar))*Modelica.Math.sin(angZen))))));
  if noEvent(Modelica.Math.sin(angHor)<0) then
    acimSol:=-Modelica.Math.acos(aux);
  else
    acimSol:=Modelica.Math.acos(aux);
  end if;
  
end SolarAzimuth;
