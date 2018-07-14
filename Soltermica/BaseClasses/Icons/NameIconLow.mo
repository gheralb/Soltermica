within Soltermica.BaseClasses.Icons;

partial model NameIconLow "Base icon with model name below the icon"
  annotation (Icon(graphics = {Text(lineColor = {0, 0, 255}, extent = {{-100, -100}, {100, -130}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end NameIconLow;