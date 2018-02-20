within Soltermica.ThermoFluidSystems.WaterStorage.Catalogue;

record TechnicalSpecifications
  "Clase record donde se incluyen las especificaciones de los depositos de acumulacion de agua caliente" 
  extends Soltermica.BaseClasses.Icons.Catalogue;
  parameter Modelica.SIunits.VolumeFlowRate V_flow_nom=1 
    "Caudal volumetrico para condiciones nominales de funcionamiento";
  parameter Modelica.SIunits.Pressure dp_nom=1 
    "Caida de presion para condiciones nominales de funcionamiento";
  parameter Modelica.SIunits.Volume volumen=1 
    "Volumen de acumulacion del deposito";
  parameter Modelica.SIunits.Length altura=1 
    "Altura del deposito de acumulacon";
//Interacumuladores
  parameter Modelica.SIunits.Volume volumen_int=1 "volumen del intercambiador";
  parameter Modelica.SIunits.Area S_int=1 "Superficie efectiva de intercambio";
  parameter Real U_int=1 "Coeficiente global de intercambio de calor";
  parameter Modelica.SIunits.VolumeFlowRate V_flow_nom_int=1 
    "Caudal volumetrico para condiciones nominales de funcionamiento en el intercambiador";
  parameter Modelica.SIunits.Pressure dp_nom_int=1 
    "Caida de presion para condiciones nominales de funcionamiento en el intercambiador";
end TechnicalSpecifications;