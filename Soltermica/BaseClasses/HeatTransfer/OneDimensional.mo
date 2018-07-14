within Soltermica.BaseClasses.HeatTransfer;

model OneDimensional
	"Modelo transferencia de calor glogal. Desprecia la masa térmica de las capas." 
	extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
	parameter Real U=1 "Coeficiente global de intercambio de calor";
	parameter Modelica.SIunits.Area A=1 "Superficie de intercambio efectiva";
equation 
	Q_flow=A*U*dT;
	annotation(Icon(graphics = {Rectangle(fillColor = {150, 150, 150}, fillPattern = FillPattern.Backward, extent = {{-20, 100}, {20, -100}}), Line(points = {{-90, 0}, {90, 0}}, color = {255, 0, 0}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20)}));
end OneDimensional;