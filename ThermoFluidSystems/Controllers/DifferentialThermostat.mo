within Soltermica.ThermoFluidSystems.Controllers;

model DifferentialThermostat
  extends Soltermica.BaseClasses.Icons.NameIcon;
  Modelica.Blocks.Interfaces.RealInput CollectorTemperatureProbe annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput WaterStorageProbe annotation(
    Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PumpOut annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(
    k1 = 1,
    k2 = -1)
    annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Hysteresis hysteresisDT(
    uLow=DeltaT_off,
    uHigh=DeltaT_on)
    annotation(
      Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.And and1 annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid1(
    amplitude=1,
    rising=risingTime,
    offset=0)
    annotation(
      Placement(visible = true, transformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Hysteresis hysteresisMaxTemp(
    uHigh = waterStorageMaxTemperature + temperatureMargin,
    uLow = waterStorageMaxTemperature - temperatureMargin)
    annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Not notDoor annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

//Model parameters
  parameter Modelica.SIunits.TemperatureDifference DeltaT_on "Diferencia tempertura para el arranque del circulador";
  parameter Modelica.SIunits.TemperatureDifference DeltaT_off 
    "Diferencia de temperatura para la parada del circulador";
  parameter Modelica.SIunits.Temperature waterStorageMaxTemperature
    "Temperatura de consigna del acumulador";
  parameter Real temperatureMargin=0.5;
  parameter Modelica.SIunits.Time risingTime=1;
    

 equation
  connect(notDoor.y, and1.u2) annotation(
    Line(points = {{2, -50}, {8, -50}, {8, -8}, {18, -8}, {18, -8}}, color = {255, 0, 255}));
  connect(hysteresisMaxTemp.y, notDoor.u) annotation(
    Line(points = {{-38, -50}, {-22, -50}}, color = {255, 0, 255}));
  connect(WaterStorageProbe, hysteresisMaxTemp.u) annotation(
    Line(points = {{-100, -50}, {-62, -50}}, color = {0, 0, 127}));
  connect(and1.y, triggeredTrapezoid1.u) annotation(
    Line(points = {{42, 0}, {52, 0}}, color = {255, 0, 255}));
  connect(triggeredTrapezoid1.y, PumpOut) annotation(
    Line(points = {{75, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(hysteresisDT.y, and1.u1) annotation(
    Line(points = {{2, 0}, {18, 0}, {18, 0}, {18, 0}}, color = {255, 0, 255}));
  connect(add.y, hysteresisDT.u) annotation(
    Line(points = {{-38, 0}, {-22, 0}, {-22, 0}, {-22, 0}}, color = {0, 0, 127}));
  connect(WaterStorageProbe, add.u2) annotation(
    Line(points = {{-100, -50}, {-72, -50}, {-72, -6}, {-62, -6}, {-62, -6}}, color = {0, 0, 127}));
  connect(CollectorTemperatureProbe, add.u1) annotation(
    Line(points = {{-100, 50}, {-74, 50}, {-74, 6}, {-62, 6}, {-62, 6}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")), Icon(graphics = {Polygon(origin = {0, -10}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{-60, -48.0014}, {60, -70.0014}, {60, 49.9986}, {-60, 69.9986}, {-60, -48.0014}}), Polygon(origin = {9.16, 56}, fillColor = {150, 150, 150}, fillPattern = FillPattern.Solid, points = {{-69.164, 3.99701}, {-49.164, 23.997}, {70.836, 3.99701}, {50.836, -16.003}, {-69.164, 3.99701}}), Polygon(origin = {70, -10}, fillColor = {100, 100, 100}, fillPattern = FillPattern.Solid, points = {{-10, -70}, {10, -50}, {10, 70}, {-10, 50}, {-10, -70}}), Polygon(origin = {0, 15}, fillColor = {85, 255, 127}, fillPattern = FillPattern.Solid, points = {{-48, 31}, {-48, -15}, {48, -31}, {48, 15}, {-48, 31}})}));
end DifferentialThermostat;
