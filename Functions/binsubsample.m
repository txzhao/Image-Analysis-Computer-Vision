function pixels = binsubsample(inpic)
% BINSUBSAMPLE -- subsampling with binomial presmoothing
%
%   binsubsample(image) reduces the size of an image by first smoothing
%   it with a two-dimensional binomial kernel having filter coefficients 
%      (1/16  1/8  1/16)
%      ( 1/8  1/4  1/8)
%      (1/16  1/8  1/16)
%   and then subsampling it by a factor of two in each dimension.

%
% Check of input arguments turned off -- has surprising side effects!
%
% if ((nargin ~= 1) | (isempty(image)))
%   error('One non-empty matrix must be given as input')
% return
%

prefilterrow = [1 2 1]/4;
prefilter = prefilterrow' * prefilterrow;
presmoothpic = filter2(prefilter, inpic);
pixels = rawsubsample(presmoothpic);

