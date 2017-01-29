function ok = signofpixelisOK(mask, x, y)

% SIGNOFPIXELISOK(MASK, X, Y) -- Sign check from floating point coordinates
%
% Performs liberal sign checks in a matrix from floating point coordinates.
% TRUE is returned if some way of rounding off (X, Y) to integer coordinates
% gives rise to a non-negative value of MASK.

[xsize ysize] = size(mask);

if ((x < 0.5) | (y < 0.5) | (x > xsize+0.5) | (y > ysize+0.5))
  ok = 0;
else 
  xmin = max(1, floor(x));
  xmax = min(xsize, ceil(x));
  ymin = max(1, floor(y));
  ymax = min(ysize, ceil(y));

  ok = ((mask(xmin, ymin) >= 0) | (mask(xmax, ymin) >= 0) | ...
        (mask(xmin, ymax) >= 0) | (mask(xmax, ymax) >= 0));
end