function printcurves(curves, verbose)

% PRINTCURVES(CURVES, VERBOSE) -- Prints information about polygons
%
% Depending on the value of VERBOSE different amounts of 
% information about the input polygons is printed
%
% VERBOSE = 0 : Only the number of polygons
%           1 : The length of each polygon
%           2 : The coordinates
%
% The format of these curves is the same as for CONTOURC

insize = size(curves, 2);
trypointer = 1;

numcurves = 0;

while trypointer <= insize,
  polylength = curves(2, trypointer);

  numcurves = numcurves + 1;

  if (verbose >= 1)
    fprintf('  polygon %d: length %d\n',  numcurves, polylength)
  end

  trypointer = trypointer + 1;

  for polyidx = 1:polylength
    x = curves(2, trypointer);
    y = curves(1, trypointer);

    if (verbose >= 2)
      fprintf('    (x %g, y %g)\n', x, y)
    end

    trypointer = trypointer + 1;
  end
end

fprintf('total number of polygons %d\n', numcurves)




