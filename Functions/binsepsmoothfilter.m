function coeffs = binsepsmoothfilter(delta)

% BINSEPSMOOTHFILTER -- returns a 3x3 filter mask corresponding to
% a separable binomial filter.

onedimfilter = [delta/2, 1 - delta, delta/2];
coeffs = onedimfilter' * onedimfilter;



