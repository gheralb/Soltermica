within Soltermica.BoundaryConditions.SolarGeometry.Examples;

model ExampleSolarDeclination
  extends Modelica.Icons.Example;
  BaseClasses.Calendar calendar1 annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SolarDeclination solarDeclination1(opcModelo = 0)  annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SolarDeclination solarDeclination2(opcModelo = 1)  annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(solarDeclination2.numDia, calendar1.numDia) annotation(
    Line(points = {{42, -30}, {0.5, -30}, {0.5, 8}, {-39, 8}}, color = {255, 127, 0}));
  connect(calendar1.numDia, solarDeclination1.numDia) annotation(
    Line(points = {{-39, 8}, {-1, 8}, {-1, 30}, {42, 30}}, color = {255, 127, 0}));

end ExampleSolarDeclination;
