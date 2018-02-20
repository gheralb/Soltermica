within Soltermica.ThermoFluidSystems.Controllers.Examples;

model ValidationDifferentialThermostat
  extends Modelica.Icons.Example;
  Soltermica.ThermoFluidSystems.Controllers.DifferentialThermostat differentialThermostat(DeltaT_off = 2, DeltaT_on = 4, wterStorageTemperature = 333.15)  annotation(
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 10, freqHz = 0.1, offset = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {-62, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 290)  annotation(
    Placement(visible = true, transformation(origin = {-62, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const.y, differentialThermostat.WaterStorageProbe) annotation(
    Line(points = {{-50, -22}, {-42, -22}, {-42, -2}, {-10, -2}, {-10, -2}, {-8, -2}}, color = {0, 0, 127}));
  connect(sine.y, differentialThermostat.CollectorTemperatureProbe) annotation(
    Line(points = {{-50, 14}, {-34, 14}, {-34, 4}, {-8, 4}, {-8, 4}}, color = {0, 0, 127}));

end ValidationDifferentialThermostat;
