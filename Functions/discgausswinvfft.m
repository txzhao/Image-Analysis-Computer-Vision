function pixels = discgausswinvtfft(inpic, sigma2,  k)

% DISCGAUSSFFTWINVTFFT(inpic, sigma2,  k) -- Tries to restore an image inpic
% which has been subject to Gaussian filtering with the (separable) 
% discrete analogue of the Gaussian kernel (see "help DISCGAUSSFFT").
%
% With H(omega) denoting the transfer function of the filter that
% is assumed to have distorted the image, the transfer function of
% the restoration filter is
%
%   H'(omega) = H(omega)^*/(|H(omega)|^2 + k^2)
%
% where k is a free parameter and sigma2 is the variance of the kernel.

ftransform = fft2(inpic);

[xsize ysize] = size(ftransform);
[x y] = meshgrid(0 : xsize-1, 0 : ysize-1);

transfer = exp(sigma2 * (cos(2 * pi*(x / xsize)) + cos(2 * pi*(y / ysize)) - 2));

pixels = real(ifft2(transfer ./ ((transfer .^2 + k*k)) .* ftransform));
