within Soltermica.BoundaryConditions.SolarGeometry;

model ZenitAngle
  "Calculate in zenital angle from the solar elevation"
  Modelica.Blocks.Interfaces.RealInput elevSol(
    final quantity="Angle",
    final unit="rad",
    displayUnit="deg") "Solar elevation or solar height"
    annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angZen(
    final quantity="Angle",
    final unit="rad",
    displayUnit="deg") "Zenital angle"
    annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  angZen=(Modelica.Constants.pi/2) - elevSol;  
annotation(
    Documentation(info = "<html><head></head><body><br><h4><u>Información</u></h4><p>El ángulo zenital es el complementario de la elevación solar.</p><div><br></div></body></html>"));end ZenitAngle;
