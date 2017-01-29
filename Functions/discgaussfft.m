function pixels = discgaussfft(inpic, sigma2)

% DISCGAUSSFFT(pic, sigma2) -- Convolves an image by the
% (separable) discrete analogue of the Gaussian kernel by
% performing the convolution in the Fourier domain.
% The parameter SIGMA2 is the variance of the kernel.

% Reference: Lindeberg "Scale-space theory in computer vision", Kluwer, 1994.

ftransform = fft2(inpic);

[xsize ysize] = size(ftransform);
[x y] = meshgrid(0 : xsize-1, 0 : ysize-1);

pixels = real(ifft2(exp(sigma2 * (cos(2 * pi*(x / xsize)) + cos(2 * pi*(y / ysize)) - 2)) .* ftransform));
