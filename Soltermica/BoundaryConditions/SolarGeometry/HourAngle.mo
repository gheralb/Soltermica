within Soltermica.BoundaryConditions.SolarGeometry;

model HourAngle
  Modelica.Blocks.Interfaces.RealInput tiempoSolar annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput AngHor(
    final quantity="Angle",
    final unit="rad",
    displayUnit="deg")
    annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  AngHor=Modelica.SIunits.Conversions.from_deg(((tiempoSolar/3600)-12)*(360/24));
  annotation(
    Documentation(info = "<html><head></head><body>Determine the Hourly Angle of the sun (in radians) from the Local Solar Time.<h4><u>Información</u></h4><div>...</div><div><br></div></body></html>"));
end HourAngle;
