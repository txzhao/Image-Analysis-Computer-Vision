function pixels = pow2imagesame(inpic, a)

% POW2IMAGE(inpic, threshold) -- Power spectrum as negative power of two
%
% POW2IMAGE performs a transformation in the Fourier domain such 
% that the phase information is preserved, whereas the magnitude 
% is REPLACED BY a power spectrum of the form
%
% |Fourier|^2 \sim 1/(a + |omega|^2)

% Save maximum and minimum values
inmin = min(inpic(:));
inmax = max(inpic(:));

outpic = pow2image(inpic, a);

pixels = inmin + (inmax - inmin)*(outpic - outmin)/(outmax - outmin);
