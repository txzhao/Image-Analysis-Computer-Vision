function pixels = binsmoothiter(inpic, dt, gamma, k)

%
% BINSMOOTHITER(inpic, DT, GAMMA, k) convolves a given image K times 
% by a  (not always separable) binomial smoothing filter of the form
%
%   1 + DT * ((1 - GAMMA) * nabla5^2 + GAMMA * nablacross^2)
%
% where nabla5^2 and nablacross^2 are discrete approximations
% to the Laplacian operator
%
%              (0,  1, 0)                   (1/2, 0,  1/2)
%   nabla5^2 = (1, -4, 1)    nablacross^2 = ( 0 , -2,   0)
%              (0,  1, 0)                   (1/2, 0,  1/2)
%
% DT should be in the interval [0, 1/2] and the parameter
% GAMMA should be selected in the interval [0, 1]
%

tmp1 = inpic;

for idx = 1:k,
  tmp2 = binsmooth(tmp1, dt, gamma);
  tmp1 = tmp2;
end

pixels = tmp1;

