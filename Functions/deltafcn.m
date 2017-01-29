function pixels = deltafcn(xsize, ysize)
%
% DELTAFCN(xsize, ysize) -- generates a discrete delta function of
% support xsize*ysize, in which the central pixel is set to one and 
% all other pixel values are set to zero.

matrix = zeros(xsize, ysize);
matrix(ceil((xsize+1)/2), ceil((ysize+1)/2)) = 1;

pixels = matrix;



