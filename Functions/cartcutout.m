function pixels = cartcutout(inpic, xmin, ymin, dx, dy)
% CARTCUTOUT -- cut out a subwindow from a given image
%
%   cartcutout(INPIC, XMIN, YMIN, DX, DY) cuts out a window of size DX*DY
%   from IMAGE starting at position (XMIN, YMIN) with coordinates
%   given in terms of CARTESIAN coordinates on the screen

if ((nargin ~= 5) | (isempty(image)))
  error('One non-empty matrix must be given as input')
  return
else 
  [m, n] = size(inpic);
  imin = m - dy - 1;
  jmin = xmin;
  pixels = inpic(imin : 1 : imin+dy-1, jmin : 1 : jmin+dx-1);
end
