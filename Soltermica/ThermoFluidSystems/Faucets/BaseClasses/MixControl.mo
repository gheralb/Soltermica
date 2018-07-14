within Soltermica.ThermoFluidSystems.Faucets.BaseClasses;

model MixControl
  Modelica.Blocks.Interfaces.RealInput volumeFlowSignal
    "Volume flow signal between 0 and 1. Corresponds to the percentage of total opening of the faucet"
    annotation(
      Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput temperatureSignal
    "Temperature signal between 1 and -1. Corresponds to the percentage of hot water flow (positive) and cold water (negative)"
    annotation(
      Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput hotSignal
    "Hot water opening signal"
    annotation(
      Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{100, 40}, {120, 60}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput coldSignal
    "Cold water opening signal"
    annotation(
      Placement(visible = true, transformation(origin = {110, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{100, -58}, {120, -38}}, rotation = 0)));
equation
  hotSignal = volumeFlowSignal * (0.5 * temperatureSignal + 0.5);
  coldSignal = volumeFlowSignal * ((-0.5 * temperatureSignal) + 0.5);
  annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
end MixControl;
