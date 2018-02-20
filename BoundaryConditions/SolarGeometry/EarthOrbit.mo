within Soltermica.BoundaryConditions.SolarGeometry;

model EarthOrbit
//variables
  Modelica.SIunits.Force F_x;
  Modelica.SIunits.Force F_y;
  Modelica.SIunits.Force F;
  Modelica.SIunits.Position x_rel_sol;
  Modelica.SIunits.Position y_rel_sol;
  Modelica.SIunits.Length radOrb_sol;
  Modelica.SIunits.Angle alpha_sol;
  Modelica.SIunits.Velocity v_x;
  Modelica.SIunits.Velocity v_y;
  Modelica.SIunits.AngularVelocity omega_sol;
  Modelica.SIunits.Acceleration a_x;
  Modelica.SIunits.Acceleration a_y;
  Modelica.SIunits.Irradiance irrExt;
  
//parametros
  parameter Modelica.SIunits.Mass m_tierra=5.972e24;
  parameter Modelica.SIunits.Length radio_tierra=6.371e6;
  parameter Modelica.SIunits.Length esp_atm=16e3+60e3+20e3;
  
  parameter Modelica.SIunits.Mass M_sol=1.989e30;
  parameter Modelica.SIunits.Length radio_sol=(1.392e9)/2;
  parameter Modelica.SIunits.ThermodynamicTemperature T_ef_sol=5776;
  parameter Modelica.SIunits.Area sup_sol=4*Modelica.Constants.pi*radio_sol^2;
  parameter Modelica.SIunits.Power energia_tot_sol=sup_sol*Modelica.Constants.sigma*T_ef_sol^4;
  
  parameter Modelica.SIunits.Length afelio=1.52098232e11;
  parameter Modelica.SIunits.Length perihelio=1.4709829e11;
  parameter Modelica.SIunits.Length excentricidad=0.017;
  parameter Modelica.SIunits.Length radio_ejeMayor=afelio+perihelio;
//  parameter Modelica.SIunits.Length radio_ejeMenor=0;

//condiciones iniciales. Punto inicial
//La simulación comenzará en el perihelio. Supondré que es el 4 de enero a las 12:00 Horas solar en el Meridiano de Greenwich
//  parameter Modelica.SIunits.Position x_rel_sol_0 = perihelio;
//  parameter Modelica.SIunits.Position y_rel_sol_0 = 0;
//  parameter Modelica.SIunits.Velocity v_x_0=0;
//  parameter Modelica.SIunits.Velocity v_y_0=sqrt((2*Modelica.Constants.G*M_sol*afelio)/(perihelio*(perihelio+afelio)));
//La simulación comenzará el 1 de enero a las 0:00. Datos obtenidos por simulación. (Verificar en detalle)
  parameter Modelica.SIunits.Position x_rel_sol_0 = 1.46892e+11;
  parameter Modelica.SIunits.Position y_rel_sol_0 = -7.84772e+09;
  parameter Modelica.SIunits.Velocity v_x_0=1589.43;
  parameter Modelica.SIunits.Velocity v_y_0=30248.4;
  
equation
//Componentes cartesianas de la fuerza del Sol sobre La Tierra
  F_x=-Modelica.Constants.G*((m_tierra*M_sol)/radOrb_sol^2)*(x_rel_sol/radOrb_sol);
  F_y=-Modelica.Constants.G*((m_tierra*M_sol)/radOrb_sol^2)*(y_rel_sol/radOrb_sol);
  F=sqrt(F_x^2+F_y^2);
  radOrb_sol=sqrt(x_rel_sol^2+y_rel_sol^2);
  tan(alpha_sol)=(y_rel_sol/x_rel_sol);
//Segunda ley de Newton
  F_x=m_tierra*a_x;
  F_y=m_tierra*a_y;
//Definiciones de aceleracion y velocidad
  a_x=der(v_x);
  a_y=der(v_y);
  v_x=der(x_rel_sol);
  v_y=der(y_rel_sol);
  omega_sol=der(alpha_sol);
//Energía radiada por el Sol
  irrExt=(energia_tot_sol/sup_sol)*((radio_sol^2)/(radOrb_sol-radio_tierra-esp_atm)^2);
initial equation 
  x_rel_sol=x_rel_sol_0;
  y_rel_sol=y_rel_sol_0;
  v_x=v_x_0;
  v_y=v_y_0;
end EarthOrbit;
