within Soltermica.BaseClasses.ControlVolumes;

model CuboidOpen
  Modelica.SIunits.Volume volume(start = V0) "Volume initial level";
  Modelica.SIunits.Length level "Level of volume";
  Modelica.SIunits.Temperature T(start = T0) "Volume temperature";
  Modelica.SIunits.SpecificEnthalpy h(start = h0) = medium.cp * T "Specific enthalpy of the volume";
  Modelica.SIunits.Enthalpy H(start = H0) = h * volume * medium.rho "Enthalpy of the volume";
  Modelica.SIunits.HeatFlowRate Q_flow_int "Internal heat exchanger";
  Modelica.SIunits.HeatFlowRate Q_flow_ext "External heat exchanger (Ambient, etc.)";
//Ports
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a(
    medium = medium)
    annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b(
    medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a puertoInt               
    annotation(
      Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b puertoExt     
    annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
//Model parameters
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium();
  //parameter Modelica.SIunits.Volume maximumVolume=1"Maximum volume of the system, aunque en este modelo se considera volume infinito";
  parameter Modelica.SIunits.Area openSurface = 1 "Superficie de la lamina de agua. Se considera rectangular";
  parameter Modelica.SIunits.Temperature T0 = 293.15;
  parameter Modelica.SIunits.SpecificEnthalpy h0 = medium.cp * T0;
  parameter Modelica.SIunits.Enthalpy H0 = h0 * V0 * medium.rho;
  parameter Modelica.SIunits.Pressure surfacePressure = 101300 "Pressure on the open surface of the volume";
  parameter Modelica.SIunits.Volume V0 = 1 "volume inicial del sistema";
//  parameter Modelica.SIunits.Length level0 =1 "Initial level of volume";
//  replaceable record shape //La idea es que la forma del modelo se pueda definir mediante un record y sea un modelo flexible en ese sentido. De momento no tengo claro como hacerlo
equation
//Mass balance
  der(volume) = (flowPort_a.m_flow + flowPort_b.m_flow) / medium.rho;
//Energy balance
//der(T)=((flowPort_a.H_flow/flowPort_a.m_flow)+h)/medium.cp;
  der(H) = flowPort_a.H_flow + flowPort_b.H_flow + Q_flow_int + Q_flow_ext;
//System level
  level = volume / openSurface;
//Hydrostatic pressure
  flowPort_a.p = surfacePressure + level * medium.rho * Modelica.Constants.g_n;
  flowPort_b.p = surfacePressure + level * medium.rho * Modelica.Constants.g_n;
//Others equations
  flowPort_a.H_flow = semiLinear(flowPort_a.m_flow, flowPort_a.h, h);
  flowPort_b.H_flow = semiLinear(flowPort_b.m_flow, flowPort_b.h, h);
//Heat ports definitions
  puertoInt.Q_flow = Q_flow_int;
  puertoInt.T = T;
  puertoExt.Q_flow = Q_flow_ext;
  puertoExt.T = T;
  annotation(
    Icon(graphics = {Rectangle(origin = {0, -20}, fillColor = {0, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-60, -40}, {60, 40}}), Rectangle(origin = {1, 40}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-61, 20}, {59, -20}}), Rectangle(pattern = LinePattern.Dot, extent = {{-80, 80}, {80, -80}})}),
    Documentation(info = "<html><head></head><body><h4><u>Información</u></h4><div>Este modelo corresponde a un volumen de control de un fluido líquido que se considera abierto al ambiente (presión atmosférica). Se ha planteado como un volumen de control con una forma de (cuboid) con lo que dispone de largo, ancho y alto. Al plantearse como un depósito se ha considerado que su altura puede variar (nivel) y de esta forma también varía su volumen que sería una variable.</div><div>Los conectores de fluido disponen de la presión estática correspondiente a la columena de agua por encima su cota. De momento no se ha definido el parámetro de la cota de las entradas/salidas de fluido así que por defecto la presión hidrostática corresponde a la presión en el fondo del depósito. De momento tampoco se han tenido en cuenta las pérdidas de carga puntuales que se producen en la entrada y salida del depósito.</div><div>El volumen de control se considera totalmente mezclado, con lo que la temperatura es uniforme en todo el volumen.</div></body></html>"));
end CuboidOpen;
