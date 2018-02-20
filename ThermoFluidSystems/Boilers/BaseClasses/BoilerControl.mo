within Soltermica.ThermoFluidSystems.Boilers.BaseClasses;

model BoilerControl
  Modelica.Blocks.Interfaces.RealInput T_in
    annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput potenciaTeorica
    annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput V_flow_in
    annotation(
      Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Pot_Real
  annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Real encendido 
    "Variable que determina si existe el caudal minima para que la caldera se encienda";
  Real gastoInstantaneoCombustible "Gasto de combustible";
//Parametros para el control. Se tienen que definir en las especificaciones
  parameter Real caudalMinACS=1;
  parameter Real rendimientoInstantaneo=1;
  parameter Real GradoModulacionMin=1;
  parameter Real PotenciaNominal=1;
  parameter Real PCCombustible=1;
  parameter Real TempRegulacion=1;
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium=Modelica.Thermal.FluidHeatFlow.Media.Medium();
  
equation 
//encendido=noEvent(if (V_flow_in>caudalMinACS) then 1 else 0);
encendido = smooth(0, if V_flow_in>caudalMinACS then 1.0 else 0);
//Energia aportada al fluido
potenciaTeorica=noEvent(
  if T_in<273.15+20 then PotenciaNominal*encendido
  elseif (T_in>=273.15+TempRegulacion-30 and T_in<273.15+TempRegulacion-15) then PotenciaNominal*(((1-GradoModulacionMin)*2/3)+GradoModulacionMin)*encendido
  elseif (T_in>=273.15+TempRegulacion-15 and T_in<273.15+TempRegulacion) then PotenciaNominal*(((1-GradoModulacionMin)*1/3)+GradoModulacionMin)*encendido
  else 
    0);
//Gasto combustible
gastoInstantaneoCombustible=(potenciaTeorica/(rendimientoInstantaneo*PCCombustible));
end BoilerControl;
