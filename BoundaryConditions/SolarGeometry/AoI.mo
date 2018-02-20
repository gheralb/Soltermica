within Soltermica.BoundaryConditions.SolarGeometry;

model AoI
  BaseClasses.Calendar calendar1(
    husoHorario=husoHorario)
    annotation(
      Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarGeometry.IncidenceAngle incidenceAngle1(
    inclinacion=inclinacion,
    orientacion=orientacion)
    annotation(
      Placement(visible = true, transformation(origin = {52, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarGeometry.SolarPosition solarPosition1(
    longitudLugar=longitudLugar,
    latitudLugar=latitudLugar,
    husoHorario=husoHorario)
    annotation(
      Placement(visible = true, transformation(origin = {-32, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput AoI annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarGeometry.BeamRatioTiltedSurface beamRatioTiltedSurface annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput R_b annotation(
    Placement(visible = true, transformation(origin = {110, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
//Model parameters
  parameter Real husoHorario=0;
  parameter Real longitudLugar=0;
  parameter Real latitudLugar=0;
  parameter Real inclinacion=0;
  parameter Real orientacion=0;
equation
  connect(beamRatioTiltedSurface.geometricRatio, R_b) annotation(
    Line(points = {{62, -30}, {74, -30}, {74, -52}, {110, -52}, {110, -52}}, color = {0, 0, 127}));
  connect(solarPosition1.anguloZenital, beamRatioTiltedSurface.zenitAngle) annotation(
    Line(points = {{-20, 30}, {0, 30}, {0, -36}, {42, -36}, {42, -34}}, color = {0, 0, 127}));
  connect(incidenceAngle1.anguloIncidencia, beamRatioTiltedSurface.angleOfIncidence) annotation(
    Line(points = {{64, 28}, {78, 28}, {78, -6}, {24, -6}, {24, -24}, {42, -24}, {42, -24}}, color = {0, 0, 127}));
  connect(incidenceAngle1.anguloIncidencia, AoI) annotation(
    Line(points = {{63, 28}, {88.5, 28}, {88.5, 50}, {110, 50}}, color = {0, 0, 127}));
  connect(solarPosition1.anguloZenital, incidenceAngle1.anguloZenital) annotation(
    Line(points = {{-21, 30}, {10, 30}, {10, 22}, {28, 22}, {28, 18.5}, {44, 18.5}, {44, 23}}, color = {0, 0, 127}));
  connect(incidenceAngle1.acimutSolar, solarPosition1.acimutSolar) annotation(
    Line(points = {{44, 33}, {17.5, 33}, {17.5, 35}, {-21, 35}}, color = {0, 0, 127}));
  connect(calendar1.numDia, solarPosition1.numDia) annotation(
    Line(points = {{-78, 8}, {-51, 8}, {-51, 26}, {-40, 26}}, color = {255, 127, 0}));
  connect(calendar1.tiempoUTC, solarPosition1.tiempoUTC) annotation(
    Line(points = {{-78, 4}, {-54, 4}, {-54, 36}, {-40, 36}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")), Icon(graphics = {Text(extent = {{-80, 80}, {80, -80}}, textString = "AoI")}),
    Documentation);
end AoI;
