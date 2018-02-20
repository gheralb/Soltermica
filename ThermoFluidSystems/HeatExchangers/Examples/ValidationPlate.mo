within Soltermica.ThermoFluidSystems.HeatExchangers.Examples;

model ValidationPlate
  extends Modelica.Icons.Example;
  Soltermica.ThermoFluidSystems.HeatExchangers.Plate plateHEX(
    n = 12,
    medium_1 = Soltermica.Media.Water70PropyleneGlycol30_25(),
    medium_2 = Soltermica.Media.Water(),
    specs=Soltermica.ThermoFluidSystems.HeatExchangers.Catalogue.Fagor_IP_120(),
    T0 = 293.15)
    annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 348.15,
    medium = Soltermica.Media.Water70PropyleneGlycol30_25())
    annotation(
      Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 293.15,
    medium = Soltermica.Media.Water70PropyleneGlycol30_25())
    annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow1(
    T0 = 293.15,
    m = 0.1,
    medium = Soltermica.Media.Water70PropyleneGlycol30_25(),
    useVolumeFlowInput = true)
    annotation(
      Placement(visible = true, transformation(origin = {-50, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient3(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 293.15,
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {82, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient4(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 323.15,
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {48, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow2(
    T0 = 293.15,
    m = 0.1,
    medium = Soltermica.Media.Water(),
    useVolumeFlowInput = true)
    annotation(
      Placement(visible = true, transformation(origin = {36, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(
    amplitude=5590/3600000,
    rising=60,
    width=300,
    falling=60,
    period=600,
    startTime=10)
    annotation(
      Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(
    k=5327/3600000)
    annotation(
      Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const.y, volumeFlow2.volumeFlow) annotation(
    Line(points = {{2, 70}, {36, 70}, {36, -2}, {36, -2}}, color = {0, 0, 127}));
  connect(trapezoid1.y, volumeFlow1.volumeFlow) annotation(
    Line(points = {{-78, 70}, {-50, 70}, {-50, 18}, {-50, 18}}, color = {0, 0, 127}));
  connect(ambient3.flowPort, plateHEX.flowPort_b_2) annotation(
    Line(points = {{82, -40}, {82, -40}, {82, 8}, {10, 8}, {10, 8}}, color = {255, 0, 0}));
  connect(volumeFlow2.flowPort_b, plateHEX.flowPort_a_2) annotation(
    Line(points = {{26, -12}, {20, -12}, {20, -8}, {10, -8}, {10, -8}}, color = {255, 0, 0}));
  connect(ambient4.flowPort, volumeFlow2.flowPort_a) annotation(
    Line(points = {{48, -40}, {48, -40}, {48, -12}, {46, -12}, {46, -12}}, color = {255, 0, 0}));
  connect(ambient2.flowPort, plateHEX.flowPort_b_1) annotation(
    Line(points = {{-50, -40}, {-50, -8}, {-10, -8}}, color = {255, 0, 0}));
  connect(ambient1.flowPort, volumeFlow1.flowPort_a) annotation(  
  Line(points = {{-90, -40}, {-90, 8}, {-60, 8}}, color = {255, 0, 0}));
  connect(volumeFlow1.flowPort_b, plateHEX.flowPort_a_1) annotation(
    Line(points = {{-40, 8}, {-10, 8}, {-10, 8}, {-10, 8}}, color = {255, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end ValidationPlate;
