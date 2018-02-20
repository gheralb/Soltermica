within Soltermica.ThermoFluidSystems.HeatExchangers.Catalogue;

record TechnicalSpecifications
  "Clase record donde se incluyen las especificaciones de los intercambiadores de placas"
  extends Soltermica.BaseClasses.Icons.Catalogue; 
  parameter Modelica.SIunits.Power P_nom=1
    "Potencia nominal";
  parameter Modelica.SIunits.VolumeFlowRate V_flow_nom_1=1 
    "Caudal volumetrico nominal en el primario";
  parameter Modelica.SIunits.Pressure dp_nom_1=1 
    "Caida de presion nominal en el primario";
  parameter Modelica.SIunits.VolumeFlowRate V_flow_nom_2=1 
    "Caudal volumetrico nominal en el secundario";
  parameter Modelica.SIunits.Pressure dp_nom_2=1 
    "Caida de presion nominal en el secundario";
  parameter Real U_int=1 
    "Coeficiente global de trasferencia de calor (en condiciones nominales)";
  parameter Modelica.SIunits.Volume V_1=1 "Volumen primario";
  parameter Modelica.SIunits.Volume V_2=1 "Volumen secundario";
  parameter Modelica.SIunits.Area S_int=1 "Superficie de intercambio";
  parameter Modelica.SIunits.Length L_int=1 
    "Longitud del intercambiador en el eje principal de intercambio";
  parameter Integer n_placas=1 "Numero de placas";
end TechnicalSpecifications;
