within Soltermica.ThermoFluidSystems.SwimmingPool;

model Pool
  Soltermica.BaseClasses.ControlVolumes.CuboidOpen cuboidOpen annotation(
    Placement(visible = true, transformation(origin = {64, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.BodyRadiation radiationTransfer annotation(
    Placement(visible = true, transformation(origin = {30, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionToAmbient annotation(
    Placement(visible = true, transformation(origin = {30, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor conductionToGround annotation(
    Placement(visible = true, transformation(origin = {26, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.SwimmingPool.BaseClasses.WaterEvaporation waterEvaporation annotation(
    Placement(visible = true, transformation(origin = {-16, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Soltermica.ThermoFluidSystems.SwimmingPool.BaseClasses.ThermalCover thermalCover annotation(
    Placement(visible = true, transformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(conductionToGround.port_b, cuboidOpen.puertoExt) annotation(
    Line(points = {{36, -54}, {64, -54}, {64, -40}}, color = {191, 0, 0}));

end Pool;
