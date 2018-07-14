within Soltermica.ThermoFluidSystems.WaterStorage.Examples;

model ValidationHotWaterTank
  extends Modelica.Icons.Example;
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient Sink(
    constantAmbientPressure = 101300,
    constantAmbientTemperature = 293.15,
    medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient WaterSource(
    constantAmbientPressure = 101300,
    constantAmbientTemperature =293.15,
    medium = medium)
    annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow1(
    T0 = 293.15,
    m = 0.1,
    useVolumeFlowInput = true,
    medium= medium)
    annotation(
    Placement(visible = true, transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HotWaterTank hotWaterTank1(
    nSeg = 1,
    final medium = medium,
    specs =  Soltermica.ThermoFluidSystems.WaterStorage.Catalogue.IDROGAS_CV200SR(),
    T0 = 293.15)
    annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow2(
    T0 = 293.15,
    m = 0.1,
    medium = medium,
    useVolumeFlowInput = true)
    annotation(
    Placement(visible = true, transformation(origin = {34, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(
    amplitude = 0.0001,
    falling = 10,
    offset = 0,
    period = 86400,
    rising = 10,
    startTime = 10,
    width = 1000)
    annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid2(
    amplitude = 0.0002,
    rising = 10,
    falling = 10,
    offset = 0,
    period = 86400,
    width = 600,
    startTime = 1000)
    annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Components.HeatedPipe heatedPipe(
    T0 = 293.15,
    V_flowLaminar = 0.0005,
    V_flowNominal = 0.001,
    dpLaminar = 50,
    dpNominal = 100,
    h_g = 0,
    m = 0.1,
    medium=medium)
    annotation(
    Placement(visible = true, transformation(origin = {-36, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-52, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid3(
    amplitude = 3000,
    falling = 10,
    rising = 10,
    width = 3600)
    annotation(
    Placement(visible = true, transformation(origin = {-84, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium = Modelica.Thermal.FluidHeatFlow.Media.Water();
equation
  connect(trapezoid3.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-72, -56}, {-68, -56}, {-68, -54}, {-62, -54}, {-62, -54}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow.port, heatedPipe.heatPort) annotation(
    Line(points = {{-42, -54}, {-36, -54}, {-36, -38}, {-36, -38}}, color = {191, 0, 0}));
  connect(heatedPipe.flowPort_a, volumeFlow1.flowPort_a) annotation(
    Line(points = {{-46, -28}, {-62, -28}, {-62, 0}, {-46, 0}, {-46, 0}}, color = {255, 0, 0}));
  connect(heatedPipe.flowPort_b, hotWaterTank1.flowPort_b1) annotation(
    Line(points = {{-26, -28}, {-20, -28}, {-20, -8}, {-10, -8}, {-10, -8}}, color = {255, 0, 0}));
  connect(trapezoid2.y, volumeFlow2.volumeFlow) annotation(
    Line(points = {{48, 0}, {34, 0}, {34, -40}, {34, -40}}, color = {0, 0, 127}));
  connect(hotWaterTank1.flowPort_b2, Sink.flowPort) annotation(
    Line(points = {{0, 10}, {0, 10}, {0, 50}, {60, 50}, {60, 50}}, color = {255, 0, 0}));
  connect(volumeFlow2.flowPort_b, hotWaterTank1.flowPort_a2) annotation(
    Line(points = {{24, -50}, {0, -50}, {0, -10}, {0, -10}}, color = {255, 0, 0}));
  connect(volumeFlow2.flowPort_a, WaterSource.flowPort) annotation(
    Line(points = {{44, -50}, {60, -50}, {60, -50}, {60, -50}}, color = {255, 0, 0}));
  connect(volumeFlow1.flowPort_b, hotWaterTank1.flowPort_a1) annotation(
    Line(points = {{-26, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {255, 0, 0}));
  connect(trapezoid1.y, volumeFlow1.volumeFlow) annotation(
    Line(points = {{-58, 50}, {-36, 50}, {-36, 10}, {-36, 10}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Documentation(info = "<html><head></head><body><h4><u>Información</u></h4><p>Modelo parcial que implementa el fenómeno de caída de presión en sistemas hidráulicos. La caída de presión debida a la fricción (también conocida como périda de carga) sería proporcional al cuadrado del caudal volumétrico. Para obtener el coeficiente de la ecuación cuadrática se partirá de un punto ya conocido como puede ser la caída de presión y caudal volumétrico nominal. En general, en los equipos hidráulicos los valores nominales son aquellos para los que está pensado que trabajará el equipo. De esta manera los fabricantes darán estos valores (ensayos, etc.) y el error al suponer la ecuación cuadrática será menor.</p></body></html>", __OpenModelica_infoHeader = "<html><head></head><body></body></html>"));
end ValidationHotWaterTank;
