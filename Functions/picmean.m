function result = picmean(inpic)

[xsize ysize] = size(inpic);
[x y] = meshgrid(-xsize/2 : xsize/2-1, -ysize/2 : ysize/2 - 1);

abspic = abs(inpic);

norm = sum(abspic(:));

ex = sum(abspic(:) .* x(:))/norm;
ey = sum(abspic(:) .* y(:))/norm;

matrix = zeros(1, 2);
matrix(1, 1) = ex;
matrix(1, 2) = ey;

result = matrix;
