within Soltermica.BoundaryConditions.SolarRadiation;

model ExtraterrestrialIrradiance
/*Este modelo está mal planteado ya los componentes condicionales solo se deben usar con conexsiones
no dentro de otras condicionales (if...). Mirar Modelica specifications 3.4 en el punto 4.4.5
since y and x are declared conditional and 4.4.5 includes the statement "A component declared with a condition-attribute can only be modified and/or used in connections".
There is no special rule that they can be removed from branches of if-statements.*/
  //Variables
  Modelica.Blocks.Interfaces.IntegerInput numDia annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput irrExt annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Model parameters
  parameter Modelica.SIunits.Irradiance constSolar=1367;
//Parametro que define la opción del modelo
//0 - Modelo simplificado que calcula la irradiación extraterrestre. Fuentes diversas. Fuente orginal desconocida.
//1 - Modelo simplificado que calcula la irradiacia extraterrestre. Relativamente mayor precisión que otros. Fuente Spencer citado por Duffie y Beckman
  parameter Integer opcModelo=0;
protected
  Real B if opcModelo==1;//Variable auxiliar
equation
  if opcModelo==0 then
//Hay que pasar los datos que se introducen al coseno a radianes, ya que se supone que están en grados.
    irrExt=constSolar*(1+0.033*cos(Modelica.SIunits.Conversions.from_deg((360/365.25)*(numDia-3))));
  elseif opcModelo==1 then
//Hay que pasar los datos que se introducen al coseno a radianes, ya que se supone que están en grados.
    B = (numDia - 1) * (360 / 365);
    irrExt = constSolar * (1.000110 + 0.034221 * cos(Modelica.SIunits.Conversions.from_deg(B)) + 0.001280 * sin(Modelica.SIunits.Conversions.from_deg(B)) + 0.000719 * cos(Modelica.SIunits.Conversions.from_deg(2 * B)) + 0.000077 * sin(Modelica.SIunits.Conversions.from_deg(2 * B)));
  else
    assert(false,"Opción del modelo mal definida");  
  end if;
end ExtraterrestrialIrradiance;
