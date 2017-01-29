function pixels = binsmooth(inpic, delta, gamma)

% BINSMOOTH(INPIC, DELTA, GAMMA) -- convolve by (non-separable) 
% binomial filter of the form
%  
%     1 + DT * ((1 - GAMMA) * nabla5^2 + GAMMA * nablacross^2)
%  
%   where nabla5^2 and nablacross^2 are discrete approximations
%   to the Laplacian operator
%  
%                (0,  1, 0)                   (1/2, 0,  1/2)
%     nabla5^2 = (1, -4, 1)    nablacross^2 = ( 0 , -2,   0)
%                (0,  1, 0)                   (1/2, 0,  1/2)
%  
%   DT should be in the interval [0, 1/2] and the parameter
%   GAMMA should be selected in the interval [0, 1]


pixels = filter2(binsmoothfilter(delta, gamma), inpic);

