function pixels = pixelplotcurves(image, curves, value)

% PIXELPLOTCURVES(IMAGE, CURVES) -- Creates pixel map from polygons

insize = size(curves, 2);
trypointer = 1;

numcurves = 0;

while trypointer <= insize,
  polylength = curves(2, trypointer);

  numcurves = numcurves + 1;

  trypointer = trypointer + 1;

  for polyidx = 1:polylength
    x = curves(2, trypointer);
    y = curves(1, trypointer);

    image(round(x), round(y)) = value;

    trypointer = trypointer + 1;
  end
end

pixels = image;




