function pixels = indexpic9()
%
% Returns a 9x9 test image with pixel values given by
% pixels(i, j) = 10*i + j
%

picsize = 9;
shiftvalue = 10;

onerow = ones(1, picsize);
idxrow = (1 : 1 : picsize);

pixels = shiftvalue * idxrow' * onerow ...
         + onerow' * idxrow;
