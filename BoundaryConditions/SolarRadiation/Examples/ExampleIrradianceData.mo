within Soltermica.BoundaryConditions.SolarRadiation.Examples;

model ExampleIrradianceData
  extends Modelica.Icons.Example;
  Soltermica.BoundaryConditions.SolarRadiation.IrradianceData irradianceData1(fileName = "C:\\Users\\gonzalo-hernandez\\Desktop\\SHELDON\\Soltermica\\BoundaryConditions\\EPW_Murcia.txt", husoHorario = 1, inclinacion = 45, latitudLugar = 38.003, longitudLugar = -1.169, orientacion = 0, tableName = "Murcia") annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integratorBeamIrradiance annotation(
    Placement(visible = true, transformation(origin = {48, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integratorDiffuseIrradiance annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(irradianceData1.diffuseIrradianceTiltedSurface, integratorDiffuseIrradiance.u) annotation(
    Line(points = {{12, 0}, {20, 0}, {20, -10}, {38, -10}, {38, -10}}, color = {0, 0, 127}));
  connect(irradianceData1.beamIrradianceTiltedSurface, integratorBeamIrradiance.u) annotation(
    Line(points = {{12, 6}, {20, 6}, {20, 36}, {36, 36}, {36, 36}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end ExampleIrradianceData;
