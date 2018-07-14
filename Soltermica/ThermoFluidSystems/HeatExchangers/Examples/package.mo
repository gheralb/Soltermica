within Soltermica.ThermoFluidSystems.HeatExchangers;

package Examples
  extends Modelica.Icons.ExamplesPackage;

  model ValidationPlateEffectiveness
    extends Modelica.Icons.Example;
    Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(constantAmbientPressure = 101300, constantAmbientTemperature = 348.15, medium = Soltermica.Media.Water70PropyleneGlycol30_25()) annotation(
      Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(constantAmbientPressure = 101300, constantAmbientTemperature = 293.15, medium = Soltermica.Media.Water70PropyleneGlycol30_25()) annotation(
      Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow1(T0 = 293.15, m = 0.1, medium = Soltermica.Media.Water70PropyleneGlycol30_25(), useVolumeFlowInput = true) annotation(
      Placement(visible = true, transformation(origin = {-50, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient3(constantAmbientPressure = 101300, constantAmbientTemperature = 293.15, medium = Soltermica.Media.Water()) annotation(
      Placement(visible = true, transformation(origin = {82, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient4(constantAmbientPressure = 101300, constantAmbientTemperature = 323.15, medium = Soltermica.Media.Water()) annotation(
      Placement(visible = true, transformation(origin = {48, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow2(T0 = 293.15, m = 0.1, medium = Soltermica.Media.Water(), useVolumeFlowInput = true) annotation(
      Placement(visible = true, transformation(origin = {36, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 100 / 3600000, falling = 60, period = 600, rising = 60, startTime = 10, width = 300) annotation(
      Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 100 / 3600000) annotation(
      Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Soltermica.ThermoFluidSystems.HeatExchangers.PlateEffectiveness plateEffectiveness(
      medium1 = Soltermica.Media.Water70PropyleneGlycol30_25(),
      medium2 = Soltermica.Media.Water(),
      specs = Soltermica.ThermoFluidSystems.HeatExchangers.Catalogue.Fagor_IP_120(),
      T0 = 293.15,
      fixedEffectiveness=true,
      heatExchangeEffectivenessFixed=0.6)
      annotation(
      Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(volumeFlow2.flowPort_b, plateEffectiveness.flowPort_a_2) annotation(
      Line(points = {{26, -22}, {12, -22}, {12, -18}, {0, -18}, {0, -18}}, color = {255, 0, 0}));
    connect(ambient4.flowPort, volumeFlow2.flowPort_a) annotation(
      Line(points = {{48, -40}, {48, -22}, {46, -22}}, color = {255, 0, 0}));
    connect(const.y, volumeFlow2.volumeFlow) annotation(
      Line(points = {{2, 70}, {36, 70}, {36, -12}}, color = {0, 0, 127}));
    connect(plateEffectiveness.flowPort_b_2, ambient3.flowPort) annotation(
      Line(points = {{0, -2}, {82, -2}, {82, -40}, {82, -40}}, color = {255, 0, 0}));
    connect(ambient2.flowPort, plateEffectiveness.flowPort_b_1) annotation(
      Line(points = {{-50, -40}, {-50, -40}, {-50, -18}, {-20, -18}, {-20, -18}}, color = {255, 0, 0}));
    connect(volumeFlow1.flowPort_b, plateEffectiveness.flowPort_a_1) annotation(
      Line(points = {{-40, 8}, {-32, 8}, {-32, -2}, {-20, -2}, {-20, -2}}, color = {255, 0, 0}));
    connect(trapezoid1.y, volumeFlow1.volumeFlow) annotation(
      Line(points = {{-78, 70}, {-50, 70}, {-50, 18}, {-50, 18}}, color = {0, 0, 127}));
    connect(ambient1.flowPort, volumeFlow1.flowPort_a) annotation(
      Line(points = {{-90, -40}, {-90, 8}, {-60, 8}}, color = {255, 0, 0}));
    annotation(
      uses(Modelica(version = "3.2.2")));
  end ValidationPlateEffectiveness;






end Examples;
