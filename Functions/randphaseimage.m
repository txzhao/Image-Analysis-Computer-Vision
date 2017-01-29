function pixels = randphaseimage(inpic)

ftransform = fft2(inpic);

[xsize ysize] = size(ftransform);
phase = 2.0 * pi * (rand(xsize, ysize) - 0.5);

modtransform = abs(ftransform) .* exp(i * phase);

pixels = real(ifft2(modtransform));
