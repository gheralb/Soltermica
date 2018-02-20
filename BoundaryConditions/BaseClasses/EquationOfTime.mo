within Soltermica.BoundaryConditions.BaseClasses;

model EquationOfTime

  Modelica.Blocks.Interfaces.IntegerInput numDia annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput E annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  parameter Integer opcModelo=0;
protected
  Real B if opcModelo==0;
equation
  if opcModelo==0 then
    B = (numDia - 1) * (360 / 365);
    E = (229.2 * (0.000075 + 0.001868 * cos(Modelica.SIunits.Conversions.from_deg(B)) - 0.032077 * sin(Modelica.SIunits.Conversions.from_deg(B)) - 0.014615 * cos(Modelica.SIunits.Conversions.from_deg(2 * B)) - 0.04089 * sin(Modelica.SIunits.Conversions.from_deg(2 * B))) * 60);
  end if;
  if opcModelo==1 then
    E = (595*sin(Modelica.SIunits.Conversions.from_deg(198+1.9713*numDia))+ 442*sin(Modelica.SIunits.Conversions.from_deg(175+0.9856*numDia))*60);
  end if;
/*  if opcModelo<>0 or opcModelo<>1 then
    assert(false,"Wrong model parameter. 0 o 1 valid options");
  end if;*/
annotation(
    Documentation(info = "<html><head></head><body><p>...</p><h4><u>Información</u></h4><div>Ecuación del tiempo. Entrada el número de día entero. Salida (en segundos) la diferencia entre la duración del dia solar medio y la del día solar verdadero.</div><div><div>Parametro que define la opción del modelo</div><div>0 - Fuente: Solar Engineering for Thermal Proccess (Duffie et al.)</div><div>1 - Fuente wikipedia/\"Anuario del Real Observatorio Astronómico\", 2016, Madrid</div></div></body></html>"));end EquationOfTime;
