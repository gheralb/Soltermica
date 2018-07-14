within Soltermica.BaseClasses;
package Icons
  extends Modelica.Icons.IconsPackage;





















  partial package CataloguePackage
    extends Modelica.Icons.Package;
    annotation(
      Icon(graphics = {Rectangle(origin = {20, 10}, lineColor = {175, 175, 175}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-50, -70}, {50, 70}}), Rectangle(lineColor = {175, 175, 175}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-50, -70}, {50, 70}}), Rectangle(origin = {-20, -10}, lineColor = {175, 175, 175}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-50, -70}, {50, 70}}), Rectangle(origin = {-22, 31}, fillColor = {0, 170, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-28, 13}, {34, -31}}), Line(origin = {-18, -20}, points = {{-30, 0}, {30, 0}}, color = {175, 175, 175}, thickness = 0.5), Line(origin = {-18, -40}, points = {{-30, 0}, {30, 0}}, color = {175, 175, 175}, thickness = 0.5), Line(origin = {-20, -60}, points = {{-30, 0}, {30, 0}}, color = {175, 175, 175}, thickness = 0.5)}));
  end CataloguePackage;





















  partial model BoundaryConditionsPackage
    extends Modelica.Icons.Package;
    annotation(
      Icon(graphics = {Ellipse(origin = {-10, 0}, fillColor = {255, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Sphere, extent = {{-40, -50}, {60, 50}}, endAngle = 360), Polygon(origin = {0, 64.88}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {65, -0.12}, rotation = -90, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {0, -65.12}, rotation = 180, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {-65, -0.12}, rotation = 90, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {46, 45.88}, rotation = -45, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {45, -45.12}, rotation = -135, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {-45, -45.12}, rotation = -225, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {-46, 45.88}, rotation = 45, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Ellipse(origin = {63, -48}, lineColor = {255, 255, 255}, fillColor = {240, 240, 240}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-161, -32}, {27, 22}}, endAngle = 360), Ellipse(origin = {63, -33}, fillColor = {250, 250, 250}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{37, -33}, {-37, 33}}, endAngle = 360), Ellipse(origin = {35, -9}, fillColor = {253, 253, 253}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-25, 25}, {25, -25}}, endAngle = 360), Ellipse(origin = {15, -28}, fillColor = {245, 245, 245}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-33, 30}, {33, -30}}, endAngle = 360), Ellipse(origin = {48, -44}, fillColor = {240, 240, 240}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-54, -30}, {50, 28}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
  end BoundaryConditionsPackage;























  partial package SoltermicaPackage
    extends Modelica.Icons.Package;
    annotation(
      Icon(graphics = {Ellipse(origin = {-10, 0}, fillColor = {255, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Sphere, extent = {{-40, -50}, {60, 50}}, endAngle = 360), Polygon(origin = {0, 64.88}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {65, -0.12}, rotation = -90, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {0, -65.12}, rotation = 180, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {-65, -0.12}, rotation = 90, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {46, 45.88}, rotation = -45, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {45, -45.12}, rotation = -135, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {-45, -45.12}, rotation = -225, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}}), Polygon(origin = {-46, 45.88}, rotation = 45, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-20, -4.88411}, {20, -4.88411}, {0, 15.1159}, {-20, -4.88411}})}));
  end SoltermicaPackage;






end Icons;
