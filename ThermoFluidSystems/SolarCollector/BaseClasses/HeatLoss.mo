within Soltermica.ThermoFluidSystems.SolarCollector.BaseClasses;

block HeatLoss
  extends Modelica.Blocks.Icons.Block;
  Modelica.Blocks.Interfaces.RealInput ambientTemperatureSignal
    annotation(Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput solarCollectorTemperature 
    "Factor de 1 a 0 que representa el porcentaje de perdidas por sombras arrojadas al captador"
    annotation(Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heatLoss
    "ganancia de calor debidas a la radiacion incidente"
    annotation(Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));     
  parameter Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.TechnicalSpecifications specs =
    Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.TechnicalSpecifications ()
    "Especificaciones propias del captador solar";
  
equation 
  //Perdidas ambiente. Revisar esta ecuación permitir que el captador coja energía del ambiente
  heatLoss=noEvent(if solarCollectorTemperature>ambientTemperatureSignal then -specs.A_apertura*(specs.Coef_perdidas_1*(solarCollectorTemperature -ambientTemperatureSignal)+specs.Coef_perdidas_2*(solarCollectorTemperature -ambientTemperatureSignal)^2) else 0);
annotation(Icon(graphics = {Text(origin = {-2, 1}, extent = {{-78, 81}, {78, -81}}, textString = "Qloss")}));end HeatLoss;