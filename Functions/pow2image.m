function pixels = pow2image(inpic, a)

% POW2IMAGE(inpic, threshold) -- Power spectrum as negative power of two
%
% POW2IMAGE performs a transformation in the Fourier domain such 
% that the phase information is preserved, whereas the magnitude 
% is REPLACED BY a power spectrum of the form
%
% |Fourier|^2 \sim 1/(a + |omega|^2)

ftransform = fft2(inpic);

% Generate the power spectrum in centered frequency coordinates
% (note that the factor (pi/umax) corresponds to (2*pi/usize))
[usize vsize] = size(ftransform);
umax = usize/2;
vmax = vsize/2;
[u v] = meshgrid(umax - usize : umax - 1, vmax - vsize : vmax - 1);
pow2spectrum = 1 ./ (a + ((pi * u/umax).^2 + (pi * v/vmax).^2));

% Move the origin of the power spectrum to the lower left corner
pow2spectrum = fftshift(pow2spectrum);

% Replace the power spectrum (NOT a linear operation)
modtransform = pow2spectrum .* exp(i * angle(ftransform));

pixels = real(ifft2(modtransform));
