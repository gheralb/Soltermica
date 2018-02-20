within Soltermica.Media;

record Water "Medium: properties of water"
extends Modelica.Thermal.FluidHeatFlow.Media.Medium(
  rho=995.6,
  cp=4177,
  cv=4177,
  lamda=0.615,
  nue=0.8E-6);
  annotation (Documentation(info="<html>
Medium: properties of water
</html>"));
end Water;