within Soltermica.ThermoFluidSystems.Faucets;

model TwinLeverMixerFaucet
  Modelica.Blocks.Interfaces.RealInput coldLever annotation(
    Placement(visible = true, transformation(origin = {100, -50}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {80, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput hotLever annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a hotWaterIn(
    final medium = medium)
    annotation(
      Placement(visible = true, transformation(origin = {-50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a coldWaterIn(
    final medium = medium)
    annotation(
      Placement(visible = true, transformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b(
    final medium = medium)
    annotation(
      Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve valveHot(
    Kv1 = Kv_grifo,
    LinearCharacteristic = true,
    T0 = T0,
    dp0 = dp_grifo,
    frictionLoss = 0,
    kv0 = 0.00001,
    medium = medium,
    rho0 = rho_referencia,
    y1 = 1)
    annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve valveCold(
    Kv1 = Kv_grifo,
    LinearCharacteristic = true,
    T0 = T0,
    dp0 = dp_grifo,
    frictionLoss = 0,
    kv0 = 0.00001,
    medium = medium,
    rho0 = rho_referencia,
    y1 = 1)
    annotation(
      Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Sensors.VolumeFlowSensor volumeFlowSensor(medium = medium) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensor(medium = medium)  annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Model parameters
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium() "Fluido de trabajo";
  parameter Modelica.SIunits.Pressure dp_grifo = 1 "Caida de presion nominal";
  parameter Real Kv_grifo = 1 "Coeficiente de caudal de la valvula. Caudal para una determinada caida de presion nominal";
  parameter Modelica.SIunits.Density rho_referencia = 995.6 "Densidad de referencia para el calculo de caudal";
  parameter Modelica.SIunits.Temperature T0 = 293.15;
equation
  connect(coldLever, valveCold.y) annotation(
    Line(points = {{100, -50}, {59, -50}}, color = {0, 0, 127}));
  connect(coldWaterIn, valveCold.flowPort_a) annotation(
    Line(points = {{50, -100}, {50, -60}}, color = {255, 0, 0}));
  connect(valveCold.flowPort_b, volumeFlowSensor.flowPort_a) annotation(
    Line(points = {{50, -40}, {50, -30}, {0, -30}, {0, 0}, {40, 0}}, color = {255, 0, 0}));
  connect(hotLever, valveHot.y) annotation(
    Line(points = {{-100, -50}, {-60, -50}, {-60, -50}, {-58, -50}}, color = {0, 0, 127}));
  connect(hotWaterIn, valveHot.flowPort_a) annotation(
    Line(points = {{-50, -100}, {-50, -60}}, color = {255, 0, 0}));
  connect(valveHot.flowPort_b, volumeFlowSensor.flowPort_a) annotation(
    Line(points = {{-50, -40}, {-51, -40}, {-51, 0}, {40, 0}}, color = {255, 0, 0}));
  connect(volumeFlowSensor.flowPort_b, flowPort_b) annotation(
    Line(points = {{60, 0}, {100, 0}, {100, 0}, {100, 0}}, color = {255, 0, 0}));
  connect(temperatureSensor.flowPort, volumeFlowSensor.flowPort_a) annotation(
    Line(points = {{40, 30}, {28, 30}, {28, 0}, {40, 0}}, color = {255, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")), Icon(graphics = {Line(origin = {-46, -79}, points = {{-6, -19}, {26, 19}}, color = {255, 0, 0}), Line(origin = {35, -80}, points = {{15, -20}, {-15, 20}}, color = {0, 0, 255}), Polygon(origin = {37.01, -15}, fillColor = {100, 100, 100}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-67.0097, -44.9999}, {-9.00971, -44.9999}, {10.9903, -14.9999}, {-13.0097, 25.0001}, {34.9903, 53.0001}, {40.9903, 45.0001}, {62.9903, 53.0001}, {44.9903, 75.0001}, {-39.0097, 55.0001}, {-67.0097, 25.0001}, {-87.0097, -14.9999}, {-67.0097, -44.9999}}), Ellipse(origin = {-50, -38}, lineColor = {255, 255, 255}, fillColor = {255, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-10, -22}, {10, 38}}, endAngle = 360), Ellipse(origin = {50, -29}, fillColor = {0, 0, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-10, -31}, {10, 29}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
end TwinLeverMixerFaucet;
