within Soltermica.ThermoFluidSystems.SolarCollector.BaseClasses;

block SolarGain
  extends Modelica.Blocks.Icons.Block;
  Modelica.Blocks.Interfaces.RealInput netBeamIrradiance
    annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput shadeFactor 
    "Factor de 1 a 0 que representa el porcentaje de perdidas por sombras arrojadas al captador"
    annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput diffuseIrradiance annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput solarGain
    "ganancia de calor debidas a la radiacion incidente"
    annotation(Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));     
  parameter Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.TechnicalSpecifications specs =
    Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.TechnicalSpecifications ()
    "Especificaciones propias del captador solar";
equation 
  //Ganancia solar
  solarGain=specs.A_apertura*specs.Rend_optico*((1-shadeFactor)*netBeamIrradiance+diffuseIrradiance*specs.IAMDiffuse);
annotation(Icon(graphics = {Text(origin = {-2, 0}, extent = {{-78, 80}, {78, -80}}, textString = "Qgain")}), uses(Modelica(version = "3.2.1")));end SolarGain;