within Soltermica.BaseClasses.ControlVolumes;

model Cylindrical "Cylindrical control volume"
  extends Modelica.Thermal.FluidHeatFlow.Interfaces.Partials.TwoPort(
    m=volume*medium.rho,
    T0=T0,
    final tapT=0);
  extends Soltermica.BaseClasses.ControlVolumes.FrictionLoss(
    V_flowNominal=1,
    dpNominal=1);
/*  extends Modelica.Thermal.FluidHeatFlow.Interfaces.Partials.SimpleFriction(
    V_flowLaminar=0.001,
    dpLaminar=0.001,
    V_flowNominal=1,
    dpNominal=1);*/
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a innerPort 
    "Heat port for internal heat exchange" annotation(
      Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b outerPort 
    "Heat port for external heat exchange (Ambient, etc.)" annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.SIunits.HeatFlowRate Q_flow_int;
  Modelica.SIunits.HeatFlowRate Q_flow_ext;
//Model paremeters
  parameter Modelica.SIunits.Volume volume=1 "Total volume of control volume";
  parameter Modelica.SIunits.Length height=1 "Height of vontrol volume";
  parameter Modelica.SIunits.Area crossSection=volume/height;
  parameter Modelica.SIunits.Length h_g(start=0)=0
    "Geodetic height (height difference from flowPort_a to flowPort_b)";
equation
// coupling with FrictionModel
  volumeFlow = V_flow;
  dp = pressureDrop + medium.rho*Modelica.Constants.g_n*h_g;
//Energy exchange with medium
  Q_flow_int=innerPort.Q_flow + Q_friction;
  T=innerPort.T;
  Q_flow_ext=outerPort.Q_flow;
  T=outerPort.T;
//Net heat flow in the control volume
  Q_flow = Q_flow_int + Q_flow_ext;
  annotation(
    Icon(graphics = {Rectangle(fillColor = {0, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-60, -60}, {60, 60}}), Rectangle(pattern = LinePattern.Dot, extent = {{-80, -80}, {80, 80}})}),
  Documentation(info = "<html><head></head><body><h4><u>Información</u></h4><div>Modelo de volumen de control de un fluido con forma cilíndrica. Se ha escogido la forma cilíndrica ya que es la que suele ser más versatil para modelar los diferentes equipos térmicos (tuberías, depósitos, etc.).</div><div>Las propiedades del fluido se consideran constantes (independientes de la temperatura y presión). El rango de trabajo de los sistemas solares térmicos suele estar entre los 0 y 100ºC, así que se da por adecuada dicha simplificación con el objeto no complicar excesivamente los modelos con medios dependientes de la tempreatura.</div><div>Dispone conectores de intercambio de energía y masa correspondientes. Se considera que toda la masa que entra, sale en la misma proporción con lo que no se almacena nada (paredes rígidas).</div><h4>Pérdida de carga y caída de presión</h4><div>El fenómeno de pérdida de carga al circular el fluido por el volumen de control es el mismo que utiliza el subpackete Thermal de la MSL. De esta forma hay que definir correctamente los parámetros correspondiente (dpLaminar, etc.). En principio y teniendo en cuenta la naturaleza de cada equipo estó se planteará ajustando los parámetros para que la pérdida de carga se asemeje lo más posible a la real.</div><div>Observación: Se plantea el desarrollo de un modelo parcial y completar el modelo de fricción para cada modelo que use esta clase.&nbsp;</div></body></html>"));
end Cylindrical;
