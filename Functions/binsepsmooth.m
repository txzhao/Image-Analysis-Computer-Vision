function pixels = binsepsmooth(inpic, delta)

% BINSMOOTH -- convolve an image by (separable) binomial filter

pixels = filter2(binsepsmoothfilter(delta), inpic);

