function pixels = indexpic9()
%
% Returns a 9x9 test image with pixel values given by
% pixels(x, y) = 10*x + y
% where x and y are Cartesian coordinates on the screen

picsize = 9;
shiftvalue = 10;

onerow = ones(1, picsize);
idxrow = (1 : 1 : picsize);

pixels = shiftvalue * onerow' * idxrow ...
         + (shiftvalue - idxrow)' * onerow;

