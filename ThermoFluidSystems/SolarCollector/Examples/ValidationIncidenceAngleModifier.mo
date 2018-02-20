within Soltermica.ThermoFluidSystems.SolarCollector.Examples;

model ValidationIncidenceAngleModifier
  extends Modelica.Icons.Example;
  Soltermica.ThermoFluidSystems.SolarCollector.BaseClasses.IncidenceAngleModifier incidenceAngleModifier1(K_50 = 0.91)  annotation(Placement(visible = true, transformation(origin = {2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BoundaryConditions.SolarGeometry.AoI aoI1(husoHorario = 1, inclinacion = 45, latitudLugar = 38.003, longitudLugar = -1.169, orientacion = 0)  annotation(Placement(visible = true, transformation(origin = {-52, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(aoI1.AoI, incidenceAngleModifier1.angleOfIncidence) annotation(Line(points = {{-40, 2}, {-6, 2}}, color = {0, 0, 127}));

end ValidationIncidenceAngleModifier;