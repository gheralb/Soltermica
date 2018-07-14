within Soltermica.ThermoFluidSystems.Pumps.Catalogue;

record TechnicalSpecifications
  extends Soltermica.BaseClasses.Icons.Catalogue;
  parameter Modelica.SIunits.Volume V_circ=1 
    "Volume of fluid that contains the circulator";
  parameter Modelica.SIunits.VolumeFlowRate V_flow_nom=1 
    "Volumen flow driven by the circulator in nominal conditions";
  parameter Modelica.SIunits.Pressure dp_nom=1 
    "Increased pressure produced between the suction and discharge of the circulator in nominal conditions";
  parameter Modelica.SIunits.Power Pot_elec_nom=1 
    "Electric power consumption by the circulator in nominal conditions";
end TechnicalSpecifications;
