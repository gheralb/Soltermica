within Soltermica.ThermoFluidSystems.SolarCollector.BaseClasses;

block IncidenceAngleModifier
  extends Modelica.Blocks.Icons.Block;
  //Inputs and Outputs
  Modelica.Blocks.Interfaces.RealInput angleOfIncidence
    annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput IAM annotation(Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Parameters
  parameter Real K_50"Modificador del ángulo de incidencia para 50º";
protected
  parameter Real b_0=(1-K_50)/(((1/Modelica.Math.cos(Modelica.SIunits.Conversions.from_deg(50)))-1));
  parameter Real maximumIncidenceAngle=Modelica.SIunits.Conversions.from_deg(89.99);
  Real aux"Variable auxiliar";
equation
  if noEvent(angleOfIncidence<maximumIncidenceAngle) then 
      aux=1-b_0*((1/Modelica.Math.cos(angleOfIncidence))-1);
  else
    aux=0;
  end if;
  if noEvent(aux<0) then
    IAM=0;
  else
    IAM=aux;
  end if;
annotation(Icon(graphics = {Text(origin = {2, 4}, extent = {{-80, 76}, {76, -82}}, textString = "IAM")}));end IncidenceAngleModifier;