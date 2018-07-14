within Soltermica.BoundaryConditions.SolarGeometry.Examples;

model ExampleSolarPosition
  extends Modelica.Icons.Example;
  BaseClasses.Calendar calendar1 annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SolarPosition solarPosition1 annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(calendar1.tiempoUTC, solarPosition1.tiempoUTC) annotation(
    Line(points = {{-38, 4}, {1, 4}, {1, 6}, {42, 6}}, color = {0, 0, 127}));
  connect(calendar1.numDia, solarPosition1.numDia) annotation(
    Line(points = {{-38, 8}, {1, 8}, {1, -4}, {42, -4}}, color = {255, 127, 0}));
end ExampleSolarPosition;
