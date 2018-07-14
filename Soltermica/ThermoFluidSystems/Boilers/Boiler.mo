within Soltermica.ThermoFluidSystems.Boilers;

model Boiler
  extends Soltermica.BaseClasses.Icons.NameIcon;
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowPort_a(
    medium=medium)
    annotation(
      Placement(visible = true, transformation(origin = {-60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowPort_b(
    medium=medium)
    annotation(
      Placement(visible = true, transformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {62, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sensors.VolumeFlowSensor volumeFlowSensor(
    medium=medium)
    annotation(
      Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensor(
    medium=medium)
    annotation(
      Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BaseClasses.BoilerControl boilerControl(
    final medium=medium,
    final caudalMinACS=specs.V_flow_min,
    final rendimientoInstantaneo=specs.RendimientoInstantaneo,
    final GradoModulacionMin=specs.ModulacionMinima,
    final PotenciaNominal=specs.PotenciaNominal,
    final PCCombustible=specs.PCCombustible,
    final TempRegulacion=TempReg)
    annotation(
      Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sensors.EnthalpyFlowSensor enthalpyFlowSensorIn(
    final medium=medium)
    annotation(
      Placement(visible = true, transformation(origin = {-46, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sensors.EnthalpyFlowSensor enthalpyFlowSensorOut(
    final medium=medium)
    annotation(
      Placement(visible = true, transformation(origin = {46, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.BaseClasses.ControlVolumes.Cylindrical cylindrical(
    T0= T0,
    volume = specs.V_cald,
    V_flowNominal=specs.V_flow_nom,
    dpNominal= specs.dp_nom,
    medium = medium)
    annotation(
      Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(
    k2=-1)
    annotation(
      Placement(visible = true, transformation(origin = {-30, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
  Placement(visible = true, transformation(origin = {38, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Soltermica.BaseClasses.HeatTransfer.OneDimensionalInerciaMass oneDimensionalInerciaMass1(
    U_a=5000 "Estimated liquid convection coefficient",
    final A=specs.S_cald,
    final C=specs.CapacidadTermicaVacio,
    U_b=20 "Estimated coefficient of natural convection with the environment")
    annotation(
      Placement(visible = true, transformation(origin = {-20, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature1 annotation(
    Placement(visible = true, transformation(origin = {-56, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T_amb annotation(
    Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-88, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
//Model parameters
  parameter Soltermica.ThermoFluidSystems.Boilers.Catalogue.TechnicalSpecifications specs=Soltermica.Soltermica.ThermoFluidSystems.Boilers.Catalogue.TechnicalSpecifications() 
    "Technical specifications of the device";
 parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium=Modelica.Thermal.FluidHeatFlow.Media.Medium() 
    "Fluid properties";
  parameter Modelica.SIunits.Conversions.NonSIunits.Temperature_degC TempReg=40 
    "Boiler outlet setpoint temperature";
  parameter Modelica.SIunits.Temperature T0=293.15;
equation
  connect(T_amb, prescribedTemperature1.T) annotation(
    Line(points = {{-100, 70}, {-68, 70}, {-68, 70}, {-68, 70}}, color = {0, 0, 127}));
  connect(prescribedTemperature1.port, oneDimensionalInerciaMass1.port_b) annotation(
    Line(points = {{-46, 70}, {-30, 70}, {-30, 70}, {-30, 70}}, color = {191, 0, 0}));
  connect(cylindrical.innerPort, oneDimensionalInerciaMass1.port_a) annotation(
    Line(points = {{0, 40}, {0, 70}, {-10, 70}}, color = {191, 0, 0}));
  connect(enthalpyFlowSensorOut.flowPort_b, flowPort_b) annotation(
    Line(points = {{56, 30}, {60, 30}, {60, -100}}, color = {255, 0, 0}));
  connect(enthalpyFlowSensorOut.y, add.u1) annotation(
    Line(points = {{46, 19}, {46, 12}, {-24, 12}, {-24, 4}}, color = {0, 0, 127}));
  connect(cylindrical.flowPort_b, enthalpyFlowSensorOut.flowPort_a) annotation(
    Line(points = {{10, 30}, {36, 30}}, color = {255, 0, 0}));
  connect(prescribedHeatFlow1.port, cylindrical.outerPort) annotation(
    Line(points = {{38, 2}, {38, 2}, {38, 16}, {0, 16}, {0, 20}, {0, 20}}, color = {191, 0, 0}));
  connect(boilerControl.potenciaTeorica, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{22, -30}, {38, -30}, {38, -18}, {38, -18}}, color = {0, 0, 127}));
  connect(add.y, boilerControl.Pot_Real) annotation(
    Line(points = {{-30, -19}, {-30, -24}, {2, -24}}, color = {0, 0, 127}));
  connect(enthalpyFlowSensorIn.y, add.u2) annotation(
    Line(points = {{-46, 18}, {-46, 12}, {-36, 12}, {-36, 4}}, color = {0, 0, 127}));
  connect(enthalpyFlowSensorIn.flowPort_b, cylindrical.flowPort_a) annotation(
    Line(points = {{-36, 30}, {-10, 30}, {-10, 30}, {-10, 30}}, color = {255, 0, 0}));
  connect(volumeFlowSensor.flowPort_b, enthalpyFlowSensorIn.flowPort_a) annotation(
    Line(points = {{-70, -40}, {-70, -40}, {-70, 30}, {-56, 30}, {-56, 30}}, color = {255, 0, 0}));
  connect(temperatureSensor.y, boilerControl.T_in) annotation(
    Line(points = {{-18, -70}, {-12, -70}, {-12, -30}, {2, -30}, {2, -30}}, color = {0, 0, 127}));
  connect(volumeFlowSensor.y, boilerControl.V_flow_in) annotation(
    Line(points = {{-58, -50}, {-46, -50}, {-46, -36}, {2, -36}}, color = {0, 0, 127}));
  connect(flowPort_a, temperatureSensor.flowPort) annotation(
    Line(points = {{-60, -100}, {-60, -100}, {-60, -70}, {-40, -70}, {-40, -70}}, color = {255, 0, 0}));
  connect(flowPort_a, volumeFlowSensor.flowPort_a) annotation(
    Line(points = {{-60, -100}, {-60, -100}, {-60, -70}, {-70, -70}, {-70, -60}, {-70, -60}}, color = {255, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")), Icon(graphics = {Polygon(origin = {-20, -10}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-40, 70}, {40, 50}, {40, -70}, {-40, -50}, {-40, 70}}), Polygon(origin = {40, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{-20, -80}, {20, -60}, {20, 62}, {-20, 40}, {-20, -80}}), Polygon(origin = {0.02, 60}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-60.0174, -0.00273363}, {19.9826, -20.0027}, {59.9826, 1.99727}, {-20.0174, 19.9973}, {-60.0174, -0.00273363}}), Polygon(origin = {-20, -55.01}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{-20, -4.99384}, {20, -14.9938}, {20, 5.00616}, {-20, 15.0062}, {-20, -4.99384}})}));
end Boiler;
