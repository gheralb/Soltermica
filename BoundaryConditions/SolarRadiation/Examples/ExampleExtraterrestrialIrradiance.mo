within Soltermica.BoundaryConditions.SolarRadiation.Examples;

model ExampleExtraterrestrialIrradiance
  extends Modelica.Icons.Example;
  ExtraterrestrialIrradiance extraterrestrialIrradiance1 annotation(Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ExtraterrestrialIrradiance extraterrestrialIrradiance2 annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BaseClasses.Calendar calendar1 annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SolarGeometry.EarthOrbit earthOrbit1 annotation(Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(extraterrestrialIrradiance2.numDia, calendar1.numDia) annotation(Line(points = {{42, 0}, {11.5, 0}, {11.5, 8}, {-39, 8}}, color = {255, 127, 0}));
  connect(calendar1.numDia, extraterrestrialIrradiance1.numDia) annotation(Line(points = {{-38, 8}, {42, 8}, {42, 50}, {42, 50}}, color = {255, 127, 0}));
end ExampleExtraterrestrialIrradiance;