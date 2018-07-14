within Soltermica.BoundaryConditions.SolarGeometry;

model SolarDeclination
  Modelica.Blocks.Interfaces.IntegerInput numDia annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angDecl annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Integer opcModelo=0;
equation
  if opcModelo==0 then
    angDecl = Modelica.SIunits.Conversions.from_deg(23.45*sin(Modelica.SIunits.Conversions.from_deg(360*(284+numDia)/365)));
  end if;
  if opcModelo==1 then
    angDecl=asin(sin(Modelica.SIunits.Conversions.from_deg(-23.44))*cos(Modelica.SIunits.Conversions.from_deg((360/365.24)*(numDia+10)+(360/Modelica.Constants.pi)*0.0167*sin(Modelica.SIunits.Conversions.from_deg((360/365.24)*(numDia-2))))));  
  end if;
/*  if opcModelo<>1 or opcModelo<>0 then
    assert(false,"Wrong model parameter. 0 o 1 valid options");
  end if;*/
annotation(
    Documentation(info = "<html><head></head><body><p>numDia is an integer number.</p><h4><u>Información</u></h4><div><div>Parametro que define la opción del modelo</div><div>0 - Modelo simplificado. Fuente Solar thermal de Duffie y Beckman\"</div><div>1 - ...</div></div></body></html>"));end SolarDeclination;
