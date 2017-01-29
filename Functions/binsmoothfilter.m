function matrix = binsmoothfilter(delta, gamma)
% BINSMOOTHFILTER -- returns a binomial smoothing filter of

matrix = deltafcn(3, 3) ...
         + 0.5*delta * ((1 - gamma) * laplace5ptop + gamma * laplacecrossop);

