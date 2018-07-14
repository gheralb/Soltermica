within Soltermica.ThermoFluidSystems.WaterStorage;

model HotWaterTankInternalHeatExchanger
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a_HEX(final medium = medium_HEX) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b_HEX(final medium = medium_HEX) annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BaseClasses.ControlVolumes.CylindricalMultiElement cylindricalMultiElement(final n = n, final medium = medium, final volume = specs.volumen, final height = specs.altura, final dpNominal = specs.dp_nom, final V_flowNominal = specs.V_flow_nom, final T0 = T0) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Soltermica.BaseClasses.ControlVolumes.CylindricalMultiElement cylindricalMultiElement_HEX(final n = n_int, final volume = specs.volumen_int, final height = specs.S_int ^ 2 / (4 * Modelica.Constants.pi * specs.volumen_int), final dpNominal = specs.dp_nom_int, final V_flowNominal = specs.V_flow_nom_int, final T0 = T0, final medium = medium_HEX) annotation(
    Placement(visible = true, transformation(origin = {-72, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Soltermica.BaseClasses.HeatTransfer.OneDimensional heatTransfer[n_int](each final A = specs.S_int / n_int, each final U = specs.U_int) annotation(
    Placement(visible = true, transformation(origin = {-40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput temperatureSensorSignal annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Model paremeters
  Modelica.SIunits.HeatFlowRate totalHeatExchanged;
  parameter Integer n(min = 3) = 3 "Number of control volumes of the tank. Minimum 3";
  parameter Integer n_int(min = 2) = 2 "Number of control volumes of the heat exchanger. Minimum 2 and always lower than n";
  //  parameter Integer n_aux = div(n, n_int)+1 "Index of the segment where the heat exchanger input will be connected. Commonly in the middle part of the tank";
  parameter Integer n_aux = n_int "Index of the segment where the heat exchanger input will be connected. Commonly in the middle part of the tank";
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium() "Tank medium";
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium_HEX = Modelica.Thermal.FluidHeatFlow.Media.Medium() "HEX medium";
  parameter Soltermica.ThermoFluidSystems.WaterStorage.Catalogue.TechnicalSpecifications specs = Soltermica.ThermoFluidSystems.WaterStorage.Catalogue.TechnicalSpecifications();
  parameter Modelica.SIunits.ThermalResistance internalThermalResistance = specs.altura / n / (specs.volumen / specs.altura * medium.lamda);
  parameter Modelica.SIunits.Temperature T0 = 293.15 "Initial temperature of the tank and the heat exchanger";
  BaseClasses.SimpleWaterStratification simpleWaterStratification(medium = medium, nSeg = n, volume = specs.volumen, height = specs.altura, timeConstant = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor internalThermalConductor[n - 1](each G = 1 / internalThermalResistance) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
/*  connect(simpleWaterStratification.heatPort, cylindricalMultiElement.innerPort) annotation(
    Line(points = {{-40, 70}, {-22, 70}, {-22, 0}, {-10, 0}, {-10, 0}}, color = {191, 0, 0}, thickness = 0.5));*/
  for i in 1:n loop
    connect(simpleWaterStratification.heatPort[i], cylindricalMultiElement.innerPort[i]);
  end for;
  connect(flowPort_b_HEX, cylindricalMultiElement_HEX.flowPort_b) annotation(
    Line(points = {{-100, -80}, {-72, -80}, {-72, -50}, {-72, -50}}, color = {255, 0, 0}));
  connect(flowPort_a_HEX, cylindricalMultiElement_HEX.flowPort_a) annotation(
    Line(points = {{-100, 0}, {-72, 0}, {-72, -30}, {-72, -30}}, color = {255, 0, 0}));
  connect(cylindricalMultiElement_HEX.outerPort, heatTransfer.port_a) annotation(
    Line(points = {{-62, -40}, {-57, -40}, {-57, -10}, {-50, -10}}, color = {191, 0, 0}, thickness = 0.5));
  for i in 1:n_int loop
    connect(heatTransfer[i].port_b, cylindricalMultiElement.innerPort[n_int + 1 - i]);
  end for;
  connect(flowPort_a, cylindricalMultiElement.flowPort_a) annotation(
    Line(points = {{0, -100}, {0, -10}}, color = {255, 0, 0}));
  connect(flowPort_b, cylindricalMultiElement.flowPort_b) annotation(
    Line(points = {{0, 100}, {0, 10}}, color = {255, 0, 0}));
  connect(cylindricalMultiElement.outerPort[n], temperatureSensor.port) annotation(
    Line(points = {{10, 0}, {48, 0}, {48, 50}, {60, 50}}, color = {191, 0, 0}, thickness = 0.5));
  connect(temperatureSensor.T, temperatureSensorSignal) annotation(
    Line(points = {{80, 50}, {102, 50}, {102, 50}, {110, 50}}, color = {0, 0, 127}));
//Heat conduction between fluid segments
  for i in 1:n - 1 loop
    connect(cylindricalMultiElement.innerPort[i], internalThermalConductor[i].port_a);
    connect(cylindricalMultiElement.innerPort[i + 1], internalThermalConductor[i].port_b);
  end for;
  totalHeatExchanged = sum(heatTransfer[i].port_a.Q_flow for i in 1:n_int);
  annotation(
    Icon(graphics = {Rectangle(origin = {0, -1}, fillColor = {85, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-80, 101}, {80, -99}}), Line(origin = {-23.41, -41.01}, points = {{-76.5898, 41.0066}, {83.4102, 41.0066}, {-36.5898, 21.0066}, {83.4102, 1.00662}, {-36.5898, -18.9934}, {83.4102, -38.9934}, {-76.5898, -38.9934}}, color = {255, 0, 0})}, coordinateSystem(initialScale = 0.1)),
    uses(Modelica(version = "3.2.2")),
  Documentation(info = "<html><head></head><body><h4><u>Información</u></h4><div>Este modelo del depósito de agua caliente con intercambiador interno (interacumulador) corresponde a un modelo segmentado del acumulador y del intercambiador. Los volúmenes de control de ambos elementos se interconectan en base a un criterio determinado mediante una modelo de transferencia de calor (unidimensional, cilíndrico, etc.). De esta forma se tranfiere energía desde el intercambidor al interior del depósito sin mezcla de caudales.</div><div>Luego se producen dos fenómenos adicionales de transferencia de calor entre segmentos del depósito acumuador. Por un lado se produce conducción de calor entre las capas de agua anexas. Por otro lado se produce una inversión de temperatura desde la capas inferiores más calientes hasta las superiores.</div><h4>Observaciones</h4><div>El orden de los segmentos se ha respetado teniendo en cuenta las entradas y salida de agua, así que están cambiadas las conexiones. Por otro lado el modelo de inversión de temperatura con un intercambiador en la parte baja para genera un modelo parecido al de mezcla total.</div></body></html>"));
end HotWaterTankInternalHeatExchanger;
