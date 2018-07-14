within Soltermica.BoundaryConditions.SolarRadiation;

model IrradianceData
  extends Soltermica.BaseClasses.Icons.BoundaryConditions;

  Modelica.Blocks.Sources.CombiTimeTable globalHorizontalIrradiance(
    columns = {2},
    extrapolation = extrapolation,
    fileName = fileName,
    offset = {0},
    smoothness = smoothness,
    tableName = tableName,
    tableOnFile = true)
    annotation(
      Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable directNormalIrradiance(
    columns = {3} "Column 3=DNI)",
    extrapolation = extrapolation,
    fileName = fileName,
    offset = {0},
    smoothness = smoothness,
    tableName = tableName,
    tableOnFile = true)
    annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable diffuseIrradiance(
    columns = {4} "Columna 4=DIF)",
    extrapolation = extrapolation,
    fileName = fileName,
    offset = {0},
    smoothness = smoothness,
    tableName = tableName,
    tableOnFile = true)
    annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarGeometry.TiltedSurface tiltedSurface(slope = inclinacion) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BoundaryConditions.SolarGeometry.AoI aoI1(husoHorario = husoHorario, longitudLugar = longitudLugar, latitudLugar = latitudLugar, inclinacion = inclinacion, orientacion = orientacion) annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Model parameter
  parameter String fileName;
  parameter String tableName;
  parameter Modelica.Blocks.Types.Smoothness smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative;
  parameter Modelica.Blocks.Types.Extrapolation extrapolation = Modelica.Blocks.Types.Extrapolation.LastTwoPoints;
  parameter Real husoHorario = 0;
  parameter Real longitudLugar = 0;
  parameter Real latitudLugar = 0;
  parameter Real inclinacion = 0;
  parameter Real orientacion = 0;
  Modelica.Blocks.Interfaces.RealOutput beamIrradianceTiltedSurface annotation(
    Placement(visible = true, transformation(origin = {110, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput diffuseIrradianceTiltedSurface annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angleOfIncidenceSignal annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(beamIrradianceTiltedSurface, tiltedSurface.beamIrradianceTiltedSurfaceFromDNI) annotation(
    Line(points = {{110, 48}, {68, 48}, {68, 16}, {42, 16}, {42, 16}}, color = {0, 0, 127}));
  connect(angleOfIncidenceSignal, aoI1.AoI) annotation(
    Line(points = {{110, -50}, {52, -50}, {52, 76}, {-38, 76}}, color = {0, 0, 127}));
  connect(diffuseIrradianceTiltedSurface, tiltedSurface.diffuseIrradianceTiltedSurface) annotation(
    Line(points = {{110, 0}, {70, 0}, {70, 6}, {42, 6}}, color = {0, 0, 127}));
  connect(aoI1.R_b, tiltedSurface.R_b) annotation(
    Line(points = {{-38, 64}, {-8, 64}, {-8, 14}, {22, 14}, {22, 14}}, color = {0, 0, 127}));
  connect(aoI1.AoI, tiltedSurface.incidendeAngle) annotation(
    Line(points = {{-38, 76}, {0, 76}, {0, 18}, {22, 18}, {22, 18}}, color = {0, 0, 127}));
  connect(globalHorizontalIrradiance.y[1], tiltedSurface.globalHorizontalIrradianceSignal) annotation(
    Line(points = {{-38, 10}, {22, 10}, {22, 10}, {22, 10}}, color = {0, 0, 127}, thickness = 0.5));
  connect(directNormalIrradiance.y[1], tiltedSurface.directNormalIrradianceSignal) annotation(
    Line(points = {{-38, -30}, {8, -30}, {8, 6}, {22, 6}, {22, 6}}, color = {0, 0, 127}, thickness = 0.5));
  connect(diffuseIrradiance.y[1], tiltedSurface.diffuseIrradianceSignal) annotation(
    Line(points = {{-38, -70}, {12, -70}, {12, 2}, {22, 2}, {22, 2}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    uses(Modelica(version = "3.2.1")),
    Icon,
    Documentation(info = "<html><head></head><body>Prueba 1</body></html>", revisions = "<html><head></head><body>Prueba 2</body></html>", __OpenModelica_infoHeader = "<html><head></head><body><h2>Prueba 3</h2></body></html>"));
end IrradianceData;
