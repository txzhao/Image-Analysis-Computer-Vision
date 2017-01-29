function pixels = nophaseimage(inpic)

ftransform = fft2(inpic);

modtransform = abs(ftransform);

pixels = real(ifft2(modtransform));
