function pixels = Lv(inpic, SMOOTH, scale, shape)
% predefine derivatives operators
sdx = [-1 0 1];
sdy = sdx';
cdx = [-0.5 0 0.5];
cdy = cdx';
sobel_x = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_y = [-1 0 1; -2 0 2; -1 0 1];
roberts_pos_dig = [-1 0; 0 1];
roberts_neg_dig = [0 -1; 1 0];
% dxmask = sdx;
% dymask = sdy;
dxmask = sdx;
dymask = sdy;
% dxmask = sobel_x;
% dymask = sobel_y;
% dxmask = roberts_pos_dig;
% dymask = roberts_neg_dig;

if (nargin < 5)
shape = 'same';
end

% smoothing
if (SMOOTH == true)
    inpic = discgaussfft(inpic, scale);
end

Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
pixels = Lx.^2 + Ly.^2;
pixels = sqrt(pixels);

end