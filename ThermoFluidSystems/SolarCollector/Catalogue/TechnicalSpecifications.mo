within Soltermica.ThermoFluidSystems.SolarCollector.Catalogue;

record TechnicalSpecifications
  extends Soltermica.BaseClasses.Icons.Catalogue;
  parameter Modelica.SIunits.Volume V_col=1;
  parameter Modelica.SIunits.VolumeFlowRate V_flow_nom=1;
//Tengo que aclarar estas unidades
  parameter Modelica.SIunits.Pressure dp_nom=1;
  parameter Modelica.SIunits.Area A_apertura=1;
  parameter Modelica.SIunits.HeatCapacity CapacidadTermicaVacio=1;
  parameter Real Rend_optico=1;
  parameter Real Coef_perdidas_1=1;
  parameter Real Coef_perdidas_2=1;
  parameter Real IAM_50=1;
  parameter Real IAMDiffuse=1;
end TechnicalSpecifications;