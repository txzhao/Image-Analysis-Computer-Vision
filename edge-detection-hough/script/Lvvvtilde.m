function Lvvv = Lvvvtilde(inpic, shape)
if (nargin < 2)
    shape = 'same';
end

dx = [0 0 0 0 0; 0 0 0 0 0; 0 -0.5 0 0.5 0; 0 0 0 0 0; 0 0 0 0 0];
dy = dx';
dxx = [0 0 0 0 0; 0 0 0 0 0; 0 1 -2 1 0; 0 0 0 0 0; 0 0 0 0 0];
dyy = dxx';
% dxy = filter2(dx, dy, shape);
dxxx = conv2(dx, dxx, shape);
dxxy = conv2(dxx, dy, shape);
dxyy = conv2(dx, dyy, shape);
dyyy = conv2(dy, dyy, shape);

Lx = filter2(dx, inpic, shape);
Ly = filter2(dy, inpic, shape);
Lxxx = filter2(dxxx, inpic, shape);
Lxxy = filter2(dxxy, inpic, shape);
Lxyy = filter2(dxyy, inpic, shape);
Lyyy = filter2(dyyy, inpic, shape);

Lvvv = (Lx .^3) .* Lxxx + 3 * (Lx .^2) .* Ly .* Lxxy + 3 * Lx .* (Ly .^2)...
    .* Lxyy + (Ly .^3) .* Lyyy;

end
