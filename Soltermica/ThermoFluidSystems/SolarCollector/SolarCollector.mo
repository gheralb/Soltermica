within Soltermica.ThermoFluidSystems.SolarCollector;

model SolarCollector
  extends Soltermica.BaseClasses.Icons.SolarCollector;
  extends Soltermica.BaseClasses.Icons.NameIcon;
  Modelica.Blocks.Interfaces.RealInput beamIrradiance annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-84, 66}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput angleOfIncidence "In degrees" annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-84, 34}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a1(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {98, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b1(final medium = medium) annotation(
    Placement(visible = true, transformation(origin = {-100, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.SolarCollector.BaseClasses.SolarGain solarGain(final specs = specs) annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.SolarCollector.BaseClasses.HeatLoss heatLoss(final specs = specs) annotation(
    Placement(visible = true, transformation(origin = {-44, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.SolarCollector.BaseClasses.IncidenceAngleModifier incidenceAngleModifier(K_50 = specs.IAM_50) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-12, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatFlowGain annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatFlowLoss annotation(
    Placement(visible = true, transformation(origin = {-14, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(final C = specs.CapacidadTermicaVacio) annotation(
    Placement(visible = true, transformation(origin = {37, -19}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput shadeFactor annotation(
    Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-84, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ambientTemperatureSignal annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-84, -64}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Soltermica.BaseClasses.ControlVolumes.Cylindrical cylindrical(
  T0= T0,
  V_flowNominal = specs.V_flow_nom,
  dpNominal = specs.dp_nom,
  volume = specs.V_col,
  medium=medium)
  annotation(
    Placement(visible = true, transformation(origin = {14, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-20, -72}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium() "Fluid properties";
  parameter Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.TechnicalSpecifications specs = Soltermica.ThermoFluidSystems.SolarCollector.Catalogue.TechnicalSpecifications();
  parameter Modelica.SIunits.Temperature T0 = 293.15 "Initial temperature of the collector";
  Modelica.Blocks.Interfaces.RealOutput temperatureProbe annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput diffuseIrradiance annotation(
    Placement(visible = true, transformation(origin = {-100, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-84, -32}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
  connect(heatFlowLoss.port, heatCapacitor.port) annotation(
    Line(points = {{-4, -30}, {37, -30}}, color = {191, 0, 0}));
  connect(heatFlowGain.port, heatCapacitor.port) annotation(
    Line(points = {{60, 20}, {60.5, 20}, {60.5, -30}, {37, -30}}, color = {191, 0, 0}));
  connect(cylindrical.innerPort, heatCapacitor.port) annotation(
    Line(points = {{14, -44}, {15.5, -44}, {15.5, -30}, {37, -30}}, color = {191, 0, 0}));
  connect(flowPort_a1, cylindrical.flowPort_a) annotation(
    Line(points = {{98, 80}, {80, 80}, {80, -54}, {24, -54}}, color = {255, 0, 0}));
  connect(solarGain.solarGain, heatFlowGain.Q_flow) annotation(
    Line(points = {{42, 70}, {60, 70}, {60, 40}}, color = {0, 0, 127}));
  connect(product.y, solarGain.netBeamIrradiance) annotation(
    Line(points = {{-1, 74}, {11, 74}, {11, 76}, {22, 76}}, color = {0, 0, 127}));
  connect(beamIrradiance, product.u1) annotation(
    Line(points = {{-100, 80}, {-24, 80}}, color = {0, 0, 127}));
  connect(incidenceAngleModifier.IAM, product.u2) annotation(
    Line(points = {{-39, 50}, {-30, 50}, {-30, 68}, {-24, 68}}, color = {0, 0, 127}));
  connect(angleOfIncidence, incidenceAngleModifier.angleOfIncidence) annotation(
    Line(points = {{-100, 50}, {-58, 50}}, color = {0, 0, 127}));
  connect(diffuseIrradiance, solarGain.diffuseIrradiance) annotation(
    Line(points = {{-100, -10}, {14, -10}, {14, 64}, {22, 64}}, color = {0, 0, 127}));
  connect(shadeFactor, solarGain.shadeFactor) annotation(
    Line(points = {{-100, 20}, {8, 20}, {8, 70}, {22, 70}}, color = {0, 0, 127}));
  connect(cylindrical.flowPort_b, flowPort_b1) annotation(
    Line(points = {{4, -54}, {-48, -54}, {-48, -86}, {-100, -86}}, color = {255, 0, 0}));
  connect(temperatureSensor.port, cylindrical.outerPort) annotation(
    Line(points = {{-10, -72}, {14, -72}, {14, -64}}, color = {191, 0, 0}));
  connect(temperatureProbe, temperatureSensor.T) annotation(
    Line(points = {{110, 50}, {96, 50}, {96, -90}, {-62, -90}, {-62, -72}, {-30, -72}, {-30, -72}, {-30, -72}}, color = {0, 0, 127}));
  connect(temperatureSensor.T, heatLoss.solarCollectorTemperature) annotation(
    Line(points = {{-30, -72}, {-62, -72}, {-62, -36}, {-52, -36}}, color = {0, 0, 127}));
  connect(ambientTemperatureSignal, heatLoss.ambientTemperatureSignal) annotation(
    Line(points = {{-100, -50}, {-80, -50}, {-80, -52}, {-70, -52}, {-70, -24}, {-52, -24}}, color = {0, 0, 127}));
  connect(heatLoss.heatLoss, heatFlowLoss.Q_flow) annotation(
    Line(points = {{-32, -30}, {-24, -30}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(initialScale = 0.1)),
    uses(Modelica(version = "3.2.1")),
    Diagram);
end SolarCollector;
