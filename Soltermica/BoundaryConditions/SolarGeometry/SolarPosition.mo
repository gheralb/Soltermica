within Soltermica.BoundaryConditions.SolarGeometry;

model SolarPosition
  Modelica.Blocks.Interfaces.RealInput tiempoUTC annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.IntegerInput numDia annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput acimutSolar annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput elevacionSolar annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput anguloZenital annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Soltermica.BoundaryConditions.SolarGeometry.SolarAzimuth acimutSolar1(final latitudLugar = latitudLugar)  annotation(
    Placement(visible = true, transformation(origin = {70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarGeometry.SolarElevation elevacionSolar1(final latitudLugar = latitudLugar)  annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarGeometry.SolarDeclination DeclinacionSolar1 annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarGeometry.ZenitAngle anguloZenital1 annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));  
  Soltermica.BoundaryConditions.SolarGeometry.HourAngle anguloHorario1 annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.BaseClasses.SolarTime tiempoSolar1(longitudLugar = longitudLugar)  annotation(
  Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BaseClasses.EquationOfTime EcuacionTiempo1 annotation(
    Placement(visible = true, transformation(origin = {-60,-70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg longitudLugar(displayUnit="deg")=0;
  //Length in decimals degrees format. EAST positive and WEST negative.
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg latitudLugar(displayUnit="deg")=0;
  //Latitude in decimal degrees format. NORTH positive and SUR negative.
  parameter Real husoHorario = 0 "Time zone of the place";
  //e.g.: UTC+1=1, UTC-1=-1
equation
  connect(anguloZenital1.angZen, anguloZenital) annotation(
    Line(points = {{82, 0}, {104, 0}, {104, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(tiempoUTC, tiempoSolar1.tiempoUTC) annotation(
    Line(points = {{-100, 50}, {-60, 50}, {-60, -44}, {-18, -44}}, color = {0, 0, 127}));
  connect(elevacionSolar1.elevSol, elevacionSolar) annotation(
  Line(points = {{82, -50}, {104, -50}, {104, -50}, {110, -50}}, color = {0, 0, 127}));
  connect(acimutSolar1.acimSol, acimutSolar) annotation(
  Line(points = {{82, 60}, {92, 60}, {92, 50}, {110, 50}}, color = {0, 0, 127}));
  connect(numDia, EcuacionTiempo1.numDia) annotation(
  Line(points = {{-100, -50}, {-76, -50}, {-76, -70}, {-68, -70}}, color = {255, 127, 0}));
  connect(DeclinacionSolar1.numDia, numDia) annotation(
  Line(points = {{-18, 70}, {-34, 70}, {-34, -50}, {-100, -50}}, color = {255, 127, 0}));
  connect(EcuacionTiempo1.E, tiempoSolar1.EdT) annotation(
  Line(points = {{-49, -70}, {-38.5, -70}, {-38.5, -56}, {-18, -56}}, color = {0, 0, 127}));
  connect(tiempoSolar1.tiempoSolar, anguloHorario1.tiempoSolar) annotation(
  Line(points = {{1, -50}, {9.5, -50}, {9.5, -10}, {-30, -10}, {-30, 31}, {-18, 31}, {-18, 30}}, color = {0, 0, 127}));
  connect(anguloHorario1.AngHor, elevacionSolar1.angHor) annotation(
  Line(points = {{1, 30}, {20, 30}, {20, -55}, {62, -55}, {62, -56}}, color = {0, 0, 127}));
  connect(DeclinacionSolar1.angDecl, elevacionSolar1.declSol) annotation(
  Line(points = {{1, 70}, {30, 70}, {30, -44}, {62, -44}}, color = {0, 0, 127}));
  connect(elevacionSolar1.elevSol, anguloZenital1.elevSol) annotation(
  Line(points = {{81, -50}, {89.5, -50}, {89.5, -28}, {40, -28}, {40, 0}, {62, 0}}, color = {0, 0, 127}));
  connect(DeclinacionSolar1.angDecl, acimutSolar1.declSol) annotation(
  Line(points = {{1, 70}, {48, 70}, {48, 66}, {62, 66}}, color = {0, 0, 127}));
  connect(anguloHorario1.AngHor, acimutSolar1.angHor) annotation(
  Line(points = {{1, 30}, {20, 30}, {20, 54}, {62, 54}}, color = {0, 0, 127}));
  connect(anguloZenital1.angZen, acimutSolar1.angZen) annotation(
  Line(points = {{81, 0}, {88.5, 0}, {88.5, 30}, {48, 30}, {48, 60}, {62, 60}}, color = {0, 0, 127}));
end SolarPosition;
