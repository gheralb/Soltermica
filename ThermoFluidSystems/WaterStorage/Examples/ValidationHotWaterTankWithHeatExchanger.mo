within Soltermica.ThermoFluidSystems.WaterStorage.Examples;

model ValidationHotWaterTankWithHeatExchanger
  extends Modelica.Icons.Example;
  Soltermica.ThermoFluidSystems.WaterStorage.HotWaterTankInternalHeatExchanger hotWaterTankInternalHeatExchanger(
    final medium = Soltermica.Media.Water(),
    specs = Soltermica.ThermoFluidSystems.WaterStorage.Catalogue.LAPESA_CV_80_M1S(),
    T0 = 293.15,
    n = 3,
    n_int = 2,
    final medium_HEX = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient Sink(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20),
    medium = Soltermica.Media.Water()) annotation(
      Placement(visible = true, transformation(origin = {66, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient WaterSource(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20),
    medium = Soltermica.Media.Water()) annotation(
      Placement(visible = true, transformation(origin = {50, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient retorno(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(20), medium = Soltermica.Media.Water()) annotation(
      Placement(visible = true, transformation(origin = {-70, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ida(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = Modelica.SIunits.Conversions.from_degC(80),
    medium = Soltermica.Media.Water())
    annotation(
      Placement(visible = true, transformation(origin = {-70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow1(
    T0 = Modelica.SIunits.Conversions.from_degC(20),
    m = 0.1, medium = Soltermica.Media.Water(),
    useVolumeFlowInput = true)
    annotation(
      Placement(visible = true, transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(
    rising = 10,
    falling = 10,
    startTime = 10,
    offset = 0,
    amplitude = 0.0001388,
    width = 3600,
    period = 10000)
    annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow2(
    T0 = 293.15,
    m = 0.001,
    medium = Soltermica.Media.Water(),
    useVolumeFlowInput = true)
    annotation(
    Placement(visible = true, transformation(origin = {24, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid2(
    amplitude = 0.0002,
    falling = 10,
    offset = 0.0000001,
    period = 3600,
    rising = 10,
    startTime = 1000,
    width = 1200)
    annotation(
    Placement(visible = true, transformation(origin = {-16, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(hotWaterTankInternalHeatExchanger.flowPort_b, volumeFlow2.flowPort_a) annotation(
    Line(points = {{-2, 10}, {2, 10}, {2, 46}, {14, 46}}, color = {255, 0, 0}));
  connect(volumeFlow1.flowPort_b, hotWaterTankInternalHeatExchanger.flowPort_a_HEX) annotation(
    Line(points = {{-26, 0}, {-12, 0}}, color = {255, 0, 0}));
  connect(hotWaterTankInternalHeatExchanger.flowPort_a, WaterSource.flowPort) annotation(
    Line(points = {{-2, -10}, {-2, -48}, {40, -48}}, color = {255, 0, 0}));
  connect(hotWaterTankInternalHeatExchanger.flowPort_b_HEX, retorno.flowPort) annotation(
    Line(points = {{-12, -8}, {-19, -8}, {-19, -50}, {-60, -50}}, color = {255, 0, 0}));
  connect(trapezoid2.y, volumeFlow2.volumeFlow) annotation(
    Line(points = {{-4, 72}, {22, 72}, {22, 56}, {24, 56}, {24, 56}}, color = {0, 0, 127}));
  connect(volumeFlow2.flowPort_b, Sink.flowPort) annotation(
    Line(points = {{34, 46}, {56, 46}}, color = {255, 0, 0}));
  connect(ida.flowPort, volumeFlow1.flowPort_a) annotation(
    Line(points = {{-60, 0}, {-60, 5}, {-46, 5}, {-46, 0}}, color = {255, 0, 0}));
  connect(trapezoid1.y, volumeFlow1.volumeFlow) annotation(
    Line(points = {{-58, 50}, {-36, 50}, {-36, 10}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end ValidationHotWaterTankWithHeatExchanger;
