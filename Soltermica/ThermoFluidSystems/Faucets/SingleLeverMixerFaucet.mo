within Soltermica.ThermoFluidSystems.Faucets;

model SingleLeverMixerFaucet
  extends Soltermica.BaseClasses.Icons.NameIcon;
  Soltermica.ThermoFluidSystems.Faucets.BaseClasses.MixControl mixControl
    annotation(
    Placement(visible = true, transformation(origin = {-32, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput waterFlow
    annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput waterTemperature
  annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a hotWaterIn(final medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {-50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a coldWaterIn(final medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b1(final medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve valveHot(
    Kv1 = Kv_grifo,
    LinearCharacteristic = true,
    T0 = T0,
    dp0 = dp_grifo,
    frictionLoss = 0,
    kv0 = 0.00001,
    rho0 = rho_referencia,
    y1 = 1,
    medium=medium)
    annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin = {50, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Sensors.VolumeFlowSensor volumeFlowSensor1(medium = medium) 
    annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensor1(medium = medium) 
    annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Model parameters
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Medium();
  parameter Modelica.SIunits.Pressure dp_grifo = 1;
  parameter Real Kv_grifo = 1;
  parameter Modelica.SIunits.Density rho_referencia = 995.6 "Reference density for volume flow calculation";
  parameter Modelica.SIunits.Temperature T0 = 293.15;
equation
  connect(mixControl.coldSignal, valveCold.y) annotation(
    Line(points = {{-20, 26}, {14, 26}, {14, -52}, {42, -52}, {42, -52}}, color = {0, 0, 127}));
  connect(waterTemperature, mixControl.temperatureSignal) annotation(
    Line(points = {{-100, -50}, {-66, -50}, {-66, 26}, {-40, 26}, {-40, 26}}, color = {0, 0, 127}));
  connect(waterFlow, mixControl.volumeFlowSignal) annotation(
    Line(points = {{-100, 50}, {-68, 50}, {-68, 36}, {-40, 36}, {-40, 36}}, color = {0, 0, 127}));
  connect(mixControl.hotSignal, valveHot.y) annotation(
    Line(points = {{-21, 35}, {-8, 35}, {-8, -24}, {-30, -24}, {-30, -40}}, color = {0, 0, 127}));
  connect(volumeFlowSensor1.flowPort_b, flowPort_b1) annotation(
    Line(points = {{60, 0}, {100, 0}, {100, 0}, {100, 0}}, color = {255, 0, 0}));
  connect(temperatureSensor1.flowPort, volumeFlowSensor1.flowPort_a) annotation(
    Line(points = {{40, 30}, {28, 30}, {28, 0}, {40, 0}}, color = {255, 0, 0}));
  connect(valveCold.flowPort_b, volumeFlowSensor1.flowPort_a) annotation(
    Line(points = {{50, -42}, {50, -42}, {50, -30}, {0, -30}, {0, 0}, {40, 0}, {40, 0}}, color = {255, 0, 0}));
  connect(coldWaterIn, valveCold.flowPort_a) annotation(
    Line(points = {{50, -100}, {50, -100}, {50, -62}, {50, -62}}, color = {255, 0, 0}));
  connect(valveHot.flowPort_b, volumeFlowSensor1.flowPort_a) annotation(
    Line(points = {{-20, -50}, {0, -50}, {0, 0}, {40, 0}, {40, 0}}, color = {255, 0, 0}));
  connect(hotWaterIn, valveHot.flowPort_a) annotation(
    Line(points = {{-50, -100}, {-50, -100}, {-50, -50}, {-40, -50}, {-40, -50}, {-40, -50}}, color = {255, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Icon(graphics = {Polygon(origin = {20, -23}, fillColor = {100, 100, 100}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-80, -37}, {22, -37}, {-2, 23}, {60, 43}, {60, 33}, {80, 33}, {80, 57}, {-18, 57}, {-80, 43}, {-80, -37}}), Polygon(origin = {2, 59}, fillColor = {100, 100, 100}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-62, -32.9991}, {-2, -18.9991}, {-10, 3.00094}, {62, 25.0009}, {62, 33.0009}, {-62, 3.00094}, {-62, -32.9991}}), Line(origin = {-46, -79}, points = {{-6, -19}, {6, 19}}, color = {255, 0, 0}), Line(origin = {35, -80}, points = {{15, -20}, {-15, 20}}, color = {0, 0, 255})}, coordinateSystem(initialScale = 0.1)));
end SingleLeverMixerFaucet;
