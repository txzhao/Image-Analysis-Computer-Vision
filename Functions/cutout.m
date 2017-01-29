function pixels = cutout(inpic, xmin, ymin, dx, dy)
% CUTOUT -- cut out a subwindow from a given image
%
%   cutout(INPIC, XMIN, YMIN, DX, DY) cuts out a window of size DX*DY
%   from IMAGE starting at position (XMIN, YMIN)
%

if ((nargin ~= 5) | (isempty(inpic)))
  error('One non-empty matrix must be given as input')
  return
else 
  pixels = inpic(xmin:xmin+dx-1, ymin:ymin+dy-1);
end
