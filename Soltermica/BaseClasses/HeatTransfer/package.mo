within Soltermica.BaseClasses;
package HeatTransfer
  extends Modelica.Icons.Package;





  model OneDimensional2
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(
      Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OneDimensional oneDimensional1(U = U_a, A = A) annotation(
      Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OneDimensional oneDimensional2(U = U_b, A = A) annotation(
      Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = C) annotation(
      Placement(visible = true, transformation(origin = {0, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput U if overallHeatTransferCoeffientFixed
      annotation(
        Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
      
  
    //Model parameters
    parameter Boolean overallHeatTransferCoeffientFixed=true;
    parameter Real U_a = 1 "Coeficiente global de intercambio de calor para el lado a";
    parameter Real U_b = 1 "Coeficiente global de intercambio de calor para el lado b";
    parameter Modelica.SIunits.Area A = 1 "Superficie de intercambio efectiva";
    parameter Real C = 1 "Capacidad calorifica de la masa";
  equation
    connect(oneDimensional2.port_b, port_b) annotation(
      Line(points = {{60, 0}, {98, 0}, {98, 0}, {100, 0}}, color = {191, 0, 0}));
    connect(port_a, oneDimensional1.port_a) annotation(
      Line(points = {{-100, 0}, {-60, 0}, {-60, 0}, {-60, 0}}, color = {191, 0, 0}));
    connect(oneDimensional2.port_a, heatCapacitor1.port) annotation(
      Line(points = {{40, 0}, {0, 0}, {0, 22}, {0, 22}}, color = {191, 0, 0}));
    connect(oneDimensional1.port_b, heatCapacitor1.port) annotation(
      Line(points = {{-40, 0}, {0, 0}, {0, 22}, {0, 22}}, color = {191, 0, 0}));
    annotation(
      uses(Modelica(version = "3.2.1")),
      Icon(graphics = {Rectangle(lineColor = {255, 0, 0}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Forward, extent = {{-20, 100}, {20, -100}}), Line(origin = {-59, 0}, points = {{-39, 0}, {39, 0}}, color = {255, 0, 0}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20), Line(origin = {59, 0}, points = {{-39, 0}, {39, 0}}, color = {255, 0, 0}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20)}));
  end OneDimensional2;





end HeatTransfer;
