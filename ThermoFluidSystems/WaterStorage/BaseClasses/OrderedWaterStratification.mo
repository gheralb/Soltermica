within Soltermica.ThermoFluidSystems.WaterStorage.BaseClasses;

model OrderedWaterStratification "Model that controls the stratification of water"
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort[nSeg] annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.SIunits.Temperature T_port_a "Temperature at flowPort_a";
  Modelica.SIunits.Temperature T_port_b "Temperature at flowPort_b";
  Modelica.SIunits.Temperature T_aSeg;
  Modelica.SIunits.Temperature T_bSeg;
  Modelica.SIunits.SpecificEnthalpy h_aSeg;
  Modelica.SIunits.SpecificEnthalpy h_bSeg;
  Modelica.SIunits.HeatFlowRate Q_outFlow "heat flow that will be extracted inlet stream";
//  Modelica.SIunits.Temperature T_ref(displayUnit = "degC") "Temperature of reference";
  //Variables y parameters for pressure drop
//  Modelica.SIunits.Pressure dp;
//  Modelica.SIunits.Pressure frictionLoss;
//  Modelica.SIunits.VolumeFlowRate V_flow_a "Volume flow a";
//  Modelica.SIunits.VolumeFlowRate V_flow_b "Volume flow b";
  parameter Integer nSeg(min = 2, start = 2) "Numer of segment of control volume";
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium() "Medium in the water storage";
  Modelica.Blocks.Interfaces.RealInput referencePressure 
  annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
protected
//  parameter Modelica.SIunits.Area AreaOrifice = Modelica.Constants.pi * (0.025 / 2) ^ 2;
//  parameter Real K_value_a = 1;
//  parameter Real K_value_b = 0.5;
  parameter Integer nAux = div(nSeg, 2) "Parametro auxiliar";
  parameter Modelica.SIunits.Length h_g(start = 0) "Geodetic height (height difference from flowPort_a to flowPort_b)";
equation
//
  T_port_a = flowPort_a.h / medium.cp;
  T_aSeg=heatPort[nAux].T;
  h_aSeg=medium.cp*T_aSeg;
  flowPort_a.p=referencePressure+medium.rho * Modelica.Constants.g_n * h_g;
  flowPort_a.H_flow = semiLinear(flowPort_a.m_flow,flowPort_a.h,h_aSeg);
//
  T_port_b = flowPort_b.h / medium.cp;
  T_bSeg=heatPort[nSeg].T;
  h_bSeg=medium.cp*T_bSeg;
  flowPort_b.p=referencePressure;
  flowPort_b.H_flow = semiLinear(flowPort_b.m_flow,flowPort_b.h,h_bSeg);
/*//Temperture definition
  T_ref = heatPort[nSeg].T;
  T_port_a = flowPort_a.h / medium.cp;
  T_b = T_ref;
//Specific enthalpy
  flowPort_b.h = medium.cp * T_b;
//Volume flow
  V_flow_a = flowPort_a.m_flow / medium.rho;
  V_flow_b = flowPort_b.m_flow / medium.rho;
//Pressure drop
  frictionLoss = (K_value_a + K_value_b) * (0.5 * medium.rho * V_flow_a ^ 2) / AreaOrifice ^ 2;
  dp = flowPort_a.p - flowPort_b.p;
//  flowPort_b.p=referencePressure;
  dp = frictionLoss + medium.rho * Modelica.Constants.g_n * h_g;
//Mass balance
  flowPort_a.m_flow + flowPort_b.m_flow = 0;
//Energy balance
  flowPort_a.H_flow + flowPort_b.H_flow = Q_outFlow;
//Enthalpy flow rate definition
  flowPort_a.H_flow = flowPort_a.m_flow * flowPort_a.h;*/
//Energy balance
  flowPort_a.H_flow + flowPort_b.H_flow = Q_outFlow;
//Rate of heat flow to the different nodes. There should only be one flow of heat to a node. The distribution is made by temperature.
  heatPort[1].Q_flow = noEvent(if T_port_a > heatPort[1].T then -Q_outFlow else 0);
  for i in 2:nSeg loop
    heatPort[i].Q_flow = noEvent(if T_port_a > heatPort[i].T and  T_port_a < heatPort[i - 1].T then -Q_outFlow else 0);
  end for;
  annotation(
    uses(Modelica(version = "3.2.2")),
    Icon(graphics = {Rectangle(origin = {1, 60}, fillColor = {255, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-81, 20}, {79, -40}}), Rectangle(origin = {1, 0}, fillColor = {255, 85, 0}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-81, 20}, {79, -20}}), Rectangle(origin = {1, -40}, fillColor = {85, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-81, 20}, {79, -40}})}, coordinateSystem(initialScale = 0.1)),
    Documentation(info = "<html><head></head><body>Modelo que controla la estratificación de temperatura del agua a medida que entra el calor por una de las entradas al deposíto. Está basado en el modelo propuesto en el capítulo 4 apartado 8.4 (Stratification in storage tanks) del libro Solar Engineering of Thermal Process (Diffie y Beckman). Partiendo de un modelo multinodal en el que cada nodo corresponde a un volumen de control se plantea un calentamiento ordenado de los diferentes nodos en base a la distribución de temperaturas. De esta manera se considera que el flujo de fluido a cierta temperatura se sutua en la capa térmica que le corresponde.<div><h4>Pérdida de carga en las entradas/salidas del primario</h4></div><div>Se ha considerado que la pérdida de carga puntual que se produce a la entrada y a la salida del flujo primario en el depósito se determina mediante lla definición de un coeficiente de pérdida de carga puntual y el planteamiento de la siguiente ecuación:</div><div>DeltaP_entrada/salida=(K_entrada+K_salida)*Densidad_fluido*0.5*velocidad_fluido^2</div><div>La determinación de la velocidad del fluido se realiza a partir del caudal volumétrico y suponiendo unos diámetros de los orificios de entrada y salida. Estos son iguales y están fijados, aunque más adelante se puede plantear que puedan definirse.</div></body></html>"));
end OrderedWaterStratification;
