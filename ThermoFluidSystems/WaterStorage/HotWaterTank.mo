within Soltermica.ThermoFluidSystems.WaterStorage;

model HotWaterTank
  //  extends Modelica.Icons.UnderConstruction;
  extends Soltermica.BaseClasses.Icons.NameIcon;
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a1(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b1(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b2(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a2(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BaseClasses.ControlVolumes.CylindricalMultiElement cylindricalMultiElement(final n = n, final medium = medium, final volume = specs.volumen, final height = specs.altura, final dpNominal = specs.dp_nom, final V_flowNominal = specs.V_flow_nom, final T0 = T0) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  //    final V_flowLaminar=specs.V_flow_nom/2,
  //    final dpLaminar=specs.dp_nom/2,
  Soltermica.ThermoFluidSystems.WaterStorage.BaseClasses.OrderedWaterStratification orderedWaterStratification(final nSeg = n, final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput temperatureProbe annotation(
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor internalThermalConductor[n - 1](each G = 1 / internalThermalResistance) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Model parameters
  parameter Integer n(start = 2, min = 2) "Numero de segmentos que se divide el volumen de control";
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium() "Fluido contenido en el deposito";
  parameter Soltermica.ThermoFluidSystems.WaterStorage.Catalogue.TechnicalSpecifications specs = Soltermica.ThermoFluidSystems.WaterStorage.Catalogue.TechnicalSpecifications() "Especificaciones del equipo";
  parameter Modelica.SIunits.Temperature T0 = 293.15 "Temperatura inicial de todo el deposito";
  parameter Modelica.SIunits.ThermalResistance internalThermalResistance = specs.altura / n / (specs.volumen / specs.altura * medium.lamda);
  Modelica.Thermal.FluidHeatFlow.Sensors.PressureSensor pressureSensor(
    final medium=medium)
    annotation(
    Placement(visible = true, transformation(origin = {-36, -82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(pressureSensor.y, orderedWaterStratification.referencePressure) annotation(
    Line(points = {{-47, -82}, {-52, -82}, {-52, -48}, {-50, -48}}, color = {0, 0, 127}));
  connect(flowPort_a2, pressureSensor.flowPort) annotation(
    Line(points = {{0, -100}, {2, -100}, {2, -82}, {-26, -82}}, color = {255, 0, 0}));
  connect(flowPort_a1, orderedWaterStratification.flowPort_a) annotation(
    Line(points = {{-100, 0}, {-74, 0}, {-74, -34}, {-58, -34}, {-58, -34}}, color = {255, 0, 0}));
  connect(flowPort_b1, orderedWaterStratification.flowPort_b) annotation(
    Line(points = {{-100, -80}, {-76, -80}, {-76, -46}, {-58, -46}, {-58, -46}}, color = {255, 0, 0}));
  connect(orderedWaterStratification.heatPort, cylindricalMultiElement.innerPort) annotation(
    Line(points = {{-38, -40}, {-20, -40}, {-20, 0}, {-10, 0}, {-10, 0}}, color = {191, 0, 0}, thickness = 0.5));
  connect(cylindricalMultiElement.innerPort[n-1], temperatureSensor.port) annotation(
    Line(points = {{-10, 0}, {-20, 0}, {-20, 70}, {60, 70}, {60, 70}}, color = {191, 0, 0}, thickness = 0.5));
  connect(temperatureSensor.T, temperatureProbe) annotation(
    Line(points = {{80, 70}, {104, 70}, {104, 70}, {110, 70}}, color = {0, 0, 127}));
  connect(flowPort_a2, cylindricalMultiElement.flowPort_b) annotation(
    Line(points = {{0, -100}, {0, -10}}, color = {255, 0, 0}));
  connect(flowPort_b2, cylindricalMultiElement.flowPort_a) annotation(
    Line(points = {{0, 100}, {0, 10}}, color = {255, 0, 0}));
//Heat conduction between fluid segments
  for i in 1:n - 1 loop
    connect(cylindricalMultiElement.innerPort[i], internalThermalConductor[i].port_a) annotation(
      Line(points = {{-60, 30}, {-68, 30}, {-68, 0}, {-10, 0}, {-10, 0}}, color = {191, 0, 0}, thickness = 0.5));
    connect(cylindricalMultiElement.innerPort[i + 1], internalThermalConductor[i].port_b) annotation(
      Line(points = {{-40, 30}, {-30, 30}, {-30, 0}, {-10, 0}, {-10, 0}}, color = {191, 0, 0}, thickness = 0.5));
  end for;
  annotation(
    Icon(graphics = {Rectangle(origin = {0, -1}, fillColor = {85, 170, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-80, 101}, {80, -99}})}),
    uses(Modelica(version = "3.2.2")),
    Documentation(info = "<html><head></head><body><h4><u>Información</u></h4>Modelo de depósito de almacenamiento de agua caliente (ACS, inercia , etc.). Se ha tratado de modelar el fenómeno de estratificación de la temperatura ya que se considera un aspecto fundamental para el funcionamiento y análisis de las instalaciones solares térmicas. Así pues se ha evitado modelos de mezcla total que conllevarían a imprecisiones considerables.<div><br><div><span style=\"font-size: 12px;\">Está basado en el modelo propuesto en el capítulo 4 apartado 8.4 (Stratification in storage tanks) del libro Solar Engineering of Thermal Process (Diffie y Beckman). Partiendo de un modelo multinodal en el que cada nodo corresponde a un volumen de control se plantea un calentamiento ordenado de los diferentes nodos en base a su distribución de temperaturas. De esta manera se considera que el flujo de fluido a cierta temperatura se situa en la capa térmica que le corresponde.</span></div><div><span style=\"font-size: 12px;\"><br></span></div><div>El modelo está compuesto por un volumen de control cilíndrico que puede subdividirse en subcomponentes en base al parametro n. Se considera que almenos deben existir dos nodos como mínimo. Cada subvolumen de control esta conectado al modelo que controla el flujo de calor que proviene del circuito primario. Este submodelo controla la distribución de calor de entrada en base a las distintas temperaturas de los volúmenes de control.</div></div><div>(Incluir esquema explicativo)</div><h4>Observaciones</h4><div>El volumen de control está conectado de forma inversa para que el número identificativo de cada subvolumen corresponda con el modelo. Así que el número 1 será el segmento más alto y n el más bajo.</div><div><br></div><div><br></div><div><br></div><div><br></div></body></html>"));
end HotWaterTank;
