within Soltermica.BoundaryConditions.SolarGeometry.Examples;

model ExampleAngleOfIncidence
  extends Modelica.Icons.Example;
  Soltermica.BoundaryConditions.SolarGeometry.AoI aoI1(
    husoHorario=1,
    longitudLugar=-1.169,
    latitudLugar=38.003,
    inclinacion=45,
    orientacion=0)
    annotation(
      Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

end ExampleAngleOfIncidence;
