within Soltermica.BoundaryConditions.BaseClasses;

model Calendar
  //For counting on January 1 corresponds to day 0 and January 2 to 1
  //The first year corresponds to 0. It is taken as reference by default 2001.
  Real tiempoOficial;
  Real tiempoOficialUnix;
  //Variables numXXX correspond to the counters from the origin of the simulation. All counters start with zero at the start of the simulation.
  Integer numAnyo;
  Integer numAnyoBisiesto;
  Integer numMes;
  Integer numSem;
  Modelica.Blocks.Interfaces.IntegerOutput numDia annotation(
    Placement(visible = true, transformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Integer numDiaOficial;
  Integer numHora;
  //Integer numMinuto;//The determination of this variable generates chattering taking into account the time scale of the simulations
  //Integer variables that represent the date
  Integer Anyo;
  Integer Mes (start=MesInicio);
  Integer DiaMes (start=DiaInicio);
  Integer DiaSem;
  Integer DiaAnyo;
  //Variables relacionadas con el horario
  Modelica.Blocks.Interfaces.RealOutput tiempoUTC
    annotation(
      Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput HoraOficial "Official time with decimals"
    annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Integer Minuto;
  Real HorarioInvierno;//Variable Daylight Saving Time
  
  parameter Real husoHorario = 0 "Time Zone of the place";  
//e.g.: UTC+1=1, UTC-1=-1
protected
  //Parametros
  //Simulation origen. January 1, 2001 at 00:00:00 UTC
  parameter Integer AnyoInicio=2001;
  parameter Integer MesInicio=1;
  parameter Integer DiaInicio=1;
  parameter Integer EpochInicio=978307200;//TimestampUnix to the origin of the simulation
  
  parameter Integer SegMinu=60;
  parameter Integer MinuHora=60;
  parameter Integer SegHora=SegMinu*MinuHora;
  parameter Integer HorasDia=24;
  parameter Integer SegDia=SegHora*HorasDia;
  parameter Integer SegAnyo=SegDia*DiasAnyo;
  parameter Integer DiasSem=7;
  parameter Integer DiasAnyo=365;
  parameter Integer MesesAnyo=12;
  parameter Integer DiasMesAcum[MesesAnyo]={31,59,90,120,151,181,212,243,273,304,334,365};
  //Simulation clock seconds for DST adjust
  parameter Real CambioHorario[33,2]={{7174800.0,25927200.0},
                                      {39229200.0,57376800.0},
                                      {70678800.0,88826400.0},
                                      {102128400.0,120880800.0},
                                      {133578000.0,152330400.0},
                                      {165027600.0,183780000.0},
                                      {196477200.0,215229600.0},
                                      {228531600.0,246679200.0},
                                      {259981200.0,278128800.0},
                                      {291430800.0,310183200.0},
                                      {322880400.0,341632800.0},
                                      {354330000.0,373082400.0},
                                      {386384400.0,404532000.0},
                                      {417834000.0,435981600.0},
                                      {449283600.0,467431200.0},
                                      {480733200.0,499485600.0},
                                      {512182800.0,530935200.0},
                                      {543632400.0,562384800.0},
                                      {575686800.0,593834400.0},
                                      {607136400.0,625284000.0},
                                      {638586000.0,657338400.0},
                                      {670035600.0,688788000.0},
                                      {701485200.0,720237600.0},
                                      {733539600.0,751687200.0},
                                      {764989200.0,783136800.0},
                                      {796438800.0,814586400.0},
                                      {827888400.0,846640800.0},
                                      {859338000.0,878090400.0},
                                      {890787600.0,909540000.0},
                                      {922842000.0,940989600.0},
                                      {954291600.0,972439200.0},
                                      {985741200.0,1004493600.0},
                                      {1017190800.0,1035943200.0}};
equation
tiempoUTC=time;
tiempoOficial=time+(husoHorario+HorarioInvierno)*SegHora;
//Counters. Div is used instead of to_day to obtain a whole number
  numAnyo = integer(div(tiempoUTC, SegAnyo));
  numAnyoBisiesto=integer(div(numAnyo+1,4));
  numDia = integer(div(tiempoUTC, SegDia));
  numDiaOficial = integer(div(tiempoOficial, SegDia));
  numSem = integer(div(numDia,DiasSem));
  numHora= integer(div(tiempoUTC,SegHora));
//Equations to obtain the date with YYYY-MM-DD
  Anyo = AnyoInicio + numAnyo;
  DiaSem = numDia - numSem*DiasSem+1;
  DiaAnyo = (numDia+1)-pre(numAnyo)*DiasAnyo;
  when (pre(DiaAnyo)>DiasMesAcum[pre(Mes)]) then
    numMes=pre(numMes)+1;
    Mes=numMes+1-(pre(numAnyo)*MesesAnyo);
  end when;
//Day of the month taking into account that each month has certain days
  if ((pre(Mes))>1)then
    DiaMes=pre(DiaAnyo)-DiasMesAcum[pre(Mes)-1];
  else
    DiaMes=pre(DiaAnyo);
  end if;
//Times including Official Time
  //DST adjust
  if noEvent(tiempoUTC>CambioHorario[pre(numAnyo)+1,1]
    and tiempoUTC<CambioHorario[pre(numAnyo)+1,2]) then
      HorarioInvierno=1;
    else
      HorarioInvierno=0;
    end if;
  //Official Time
  HoraOficial=((tiempoOficial/SegHora)-numDiaOficial*HorasDia);
  tiempoOficialUnix=tiempoUTC+EpochInicio;
annotation(
    Documentation(info = "<html><head></head><body>At the moment the leap years and the Daylight Saving Time have not been implemented.<h4>Información</h4><div>De momento no se ha tratado los años bisiestos ni el cambio en el horario de verano/invierno.</div><div><br></div></body></html>"));end Calendar;
