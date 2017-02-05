function pixels = gaussfft(pic, t)
% perform Gaussian filter using fft

row = size(pic, 1);
col = size(pic, 2);

[X Y] = meshgrid(-row / 2 : (row / 2) - 1, -col / 2 : (col / 2) - 1);
gauss = (1 / (2 * pi * t)) * exp(-(X .* X + Y .* Y) / (2 * t));

Phat = fft2(pic);
Ghat = fft2(fftshift(gauss));
pixels = real(ifft2(Phat .* Ghat));

end
