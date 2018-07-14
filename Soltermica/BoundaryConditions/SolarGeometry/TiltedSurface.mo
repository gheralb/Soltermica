within Soltermica.BoundaryConditions.SolarGeometry;

model TiltedSurface
  Modelica.Blocks.Interfaces.RealInput incidendeAngle annotation(
    Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput directNormalIrradianceSignal annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput diffuseIrradianceSignal annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput globalHorizontalIrradianceSignal annotation(
    Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput R_b "Ratio of beam radiation on tilted surface to that on horizontal surface" annotation(
    Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  Modelica.Blocks.Interfaces.RealOutput beamIrradianceTiltedSurfaceFromDNI annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput diffuseIrradianceTiltedSurface annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {112, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput beamIrradianceTiltedSurface annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  //Model parameters
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg slope;
equation
//Diffuse irradiance correction for tilted surface Isotropic sky (Liu-Jordan)
  diffuseIrradianceTiltedSurface = diffuseIrradianceSignal * ((1 + Modelica.Math.cos(Modelica.SIunits.Conversions.from_deg(slope))) / 2);
//Beam irradiance correction for tilted surface from global and diffuse irradiance on horizontal plane
  beamIrradianceTiltedSurface =R_b*(globalHorizontalIrradianceSignal-diffuseIrradianceSignal);
//Beam irradiance correction for tilted surface from DNI
  beamIrradianceTiltedSurfaceFromDNI = max(0, directNormalIrradianceSignal * Modelica.Math.cos(incidendeAngle)) annotation(
    uses(Modelica(version = "3.2.2")));
/*
  aux_zen=Modelica.Math.cos(zenitalAngle);
  aux_inc=Modelica.Math.cos(incidendeAngle);
  if noEvent(zenitalAngle<maximumZenitalAngle or zenitalAngle>0.01) then
    aux_rb=(Modelica.Math.cos(incidendeAngle)/Modelica.Math.cos(zenitalAngle));
  else
    aux_rb=0;
  end if;
  beamIrradianceTiltedSurface= directNormalIrradianceSignal*max(0,aux_rb);*/
end TiltedSurface;
