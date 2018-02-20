within Soltermica.BoundaryConditions.SolarGeometry;

model BeamRatioTiltedSurface
  "Under construction"
  extends Modelica.Icons.UnderConstruction;
  Modelica.Blocks.Interfaces.RealInput angleOfIncidence annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput zenitAngle annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput geometricRatio annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  geometricRatio=max(0,Modelica.Math.cos(angleOfIncidence)/Modelica.Math.cos(zenitAngle));
end BeamRatioTiltedSurface;
