within Soltermica.BaseClasses.ControlVolumes;

partial model FrictionLoss
  Modelica.SIunits.Pressure pressureDrop;
  Modelica.SIunits.VolumeFlowRate volumeFlow;
  Modelica.SIunits.Power Q_friction;
  
  parameter Modelica.SIunits.VolumeFlowRate V_flowNominal(start=1)
    "Nominal volume flow"
    annotation(Dialog(group="Friction loss"));
  parameter Modelica.SIunits.Pressure dpNominal(start=1)
    "Nominal pressure drop"
    annotation(Dialog(group="Friction loss"));
  parameter Real frictionLoss(min=0, max=1) = 0
    "Part of friction losses fed to medium"
    annotation(Dialog(group="Friction loss"));
equation
protected
  parameter Real k(final unit="Pa.s2/m6", fixed=false);
  parameter Modelica.SIunits.VolumeFlowRate V_flowNominal_small(min=0) = 1E-4*abs(
    V_flowNominal);
initial algorithm
  k:=(dpNominal)/(V_flowNominal)^2;
equation
/*
  if volumeFlow > 0 then
    pressureDrop = k*(volumeFlow)^2;
  elseif volumeFlow < 0 then
    pressureDrop = - k*(volumeFlow)^2;
  else
    pressureDrop =  0;
  end if;
*/
//  pressureDrop = smooth(1,if (volumeFlow<0) then 0 else k*(volumeFlow^2));
  pressureDrop = Modelica.Fluid.Utilities.regStep(volumeFlow,k*(volumeFlow^2),-k*(volumeFlow^2),V_flowNominal_small);
  Q_friction = frictionLoss*volumeFlow*pressureDrop;
end FrictionLoss;
