function result = variance(inpic)

[xsize ysize] = size(inpic);
[x y] = meshgrid(-xsize/2 : xsize/2-1, -ysize/2 : ysize/2 - 1);

abspic = abs(inpic);

norm = sum(abspic(:));

ex = sum(abspic(:) .* x(:))/norm;
ey = sum(abspic(:) .* y(:))/norm;

exx = sum(abspic(:) .* x(:) .* x(:))/norm;
exy = sum(abspic(:) .* x(:) .* y(:))/norm;
eyy = sum(abspic(:) .* y(:) .* y(:))/norm;

matrix = zeros(2, 2);
matrix(1, 1) = exx - ex*ex;
matrix(1, 2) = exy - ex*ey;
matrix(2, 1) = matrix(1, 2);
matrix(2, 2) = eyy - ey*ey;

result = matrix;
