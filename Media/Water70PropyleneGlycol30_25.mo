within Soltermica.Media;

record Water70PropyleneGlycol30_25
  "Properties of Water and Propylene Glycol mixture (70-30%) at 25 degrees celsius"
  extends Modelica.Thermal.FluidHeatFlow.Media.Medium(
    rho=1020,
    cp=3850,
    cv=3850,
    lamda=0.47,
    nue=2.75E-6);
end Water70PropyleneGlycol30_25;
