within Soltermica.ThermoFluidSystems.Controllers;

model SwimmingPoolSolarController
  Modelica.Blocks.Interfaces.RealInput swimmingPoolSolarController annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PumpOut annotation(Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid1(
    amplitude=1,
    rising=0.1,
    offset=0)
    annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.OnOffController onOffController1(
    bandwidth=DeltaTemperature)
    annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(
    k=setTemperature)
    annotation(Placement(visible = true, transformation(origin = {-50, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
//Model parameters
  parameter Modelica.SIunits.Temperature setTemperature=293.15;
  parameter Modelica.SIunits.TemperatureDifference DeltaTemperature;
equation
  connect(const.y, onOffController1.reference) annotation(Line(points = {{-38, 48}, {-28, 48}, {-28, 6}, {-12, 6}, {-12, 6}}, color = {0, 0, 127}));
  connect(onOffController1.y, triggeredTrapezoid1.u) annotation(Line(points = {{12, 0}, {58, 0}, {58, 0}, {58, 0}}, color = {255, 0, 255}));
  connect(swimmingPoolSolarController, onOffController1.u) annotation(Line(points = {{-100, 0}, {-71, 0}, {-71, -6}, {-12, -6}}, color = {0, 0, 127}));
  connect(triggeredTrapezoid1.y, PumpOut) annotation(Line(points = {{82, 0}, {104, 0}, {104, 0}, {110, 0}}, color = {0, 0, 127}));
  annotation(uses(Modelica(version = "3.2.1")), Icon(graphics = {Polygon(origin = {0, -10}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{-60, -48.0014}, {60, -70.0014}, {60, 49.9986}, {-60, 69.9986}, {-60, -48.0014}}), Polygon(origin = {9.16, 56}, fillColor = {150, 150, 150}, fillPattern = FillPattern.Solid, points = {{-69.164, 3.99701}, {-49.164, 23.997}, {70.836, 3.99701}, {50.836, -16.003}, {-69.164, 3.99701}}), Polygon(origin = {70, -10}, fillColor = {100, 100, 100}, fillPattern = FillPattern.Solid, points = {{-10, -70}, {10, -50}, {10, 70}, {-10, 50}, {-10, -70}}), Polygon(origin = {0, 15}, fillColor = {85, 255, 127}, fillPattern = FillPattern.Solid, points = {{-48, 31}, {-48, -15}, {48, -31}, {48, 15}, {-48, 31}})}));
end SwimmingPoolSolarController;