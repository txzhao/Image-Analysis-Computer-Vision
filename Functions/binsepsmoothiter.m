function pixels = binsepsmoothiter(inpic, dt, k)

%
% BINSEPSMOOTHITER(INPIC, DT, K) -- convolves a given image K times by a 
% (separable) binomial smoothing filter of the form
%
%   (    DT^2/4   ,  DT*(1 - DT)/2,     DT^2/4   )
%   (DT*(1 - DT)/2,   (1 - DT)^2  , DT*(1 - DT)/2)
%   (    DT^2/4   ,  DT*(1 - DT)/2,     DT^2/4   )
%
% where DT should be in the interval [0, 1/2]
%

tmp1 = inpic;

for idx = 1 : k,
  tmp2 = binsepsmooth(tmp1, dt);
  tmp1 = tmp2;
end

pixels = tmp1;

