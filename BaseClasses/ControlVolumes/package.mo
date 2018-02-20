within Soltermica.BaseClasses;
package ControlVolumes
  extends Modelica.Icons.Package;















  partial model LocalFrictionLoss
    extends Modelica.Icons.UnderConstruction;
    Modelica.SIunits.Pressure pressureDrop;
    Modelica.SIunits.VolumeFlowRate volumeFlow;
    Modelica.SIunits.Power Q_friction;
    parameter Real Kab(final unit = "Pa.s2/m6");
    parameter Real Kba(final unit = "Pa.s2/m6");  
    parameter Real frictionLoss(min = 0, max = 1) = 0 "Part of friction losses fed to medium" annotation(
      Dialog(group = "Friction loss"));
  equation

  protected
  /*  parameter Real k(final unit = "Pa.s2/m6", fixed = false);
  initial algorithm
    k := dpNominal / V_flowNominal ^ 2;*/
  equation
    if volumeFlow > 0 then
      pressureDrop = (Kab) * (0.5 * medium.rho * volumeFlow ^ 2) / AreaOrifice ^ 2;
    elseif volumeFlow < 0 then
      pressureDrop = (Kba) * (0.5 * medium.rho * volumenFlow ^ 2) / AreaOrifice ^ 2;
    else
      pressureDrop = 0;
    end if;
    Q_friction = frictionLoss * volumeFlow * pressureDrop;
  end LocalFrictionLoss;



end ControlVolumes;
