function [ Filtim, MTF] = bworth( Image, cutoff, order, type)
%
%	FILTIM = BWORTH( IMAGE, CUTOFF, ORDER, TYPE) filters the image
%	IMAGE with a Butterworth filter of order ORDER with cut-off frequency
%	CUTOFF cycles per pixel and returns the resulting image FILTIM
%	along with the modulation transfer function MTF.
%	The filter is high-pass or low-pass depending on whether TYPE = 'h'
%	or TYPE = 'l' respectively.
%	If TYPE is omitted, it is set to 'l'.
%	If ORDER is also omitted, it is set to 1.

if nargin < 2
  error( 'Wrong # of arguments.')
  return
elseif nargin == 2
  order = 1;
  type = 'l';
elseif nargin == 3
  type = 'l';
end

pmax = ( size( Image, 1) - 1) / 2;
qmax = ( size( Image, 2) - 1) / 2;
pmin = floor( -pmax);
qmin = floor( -qmax);
pmax = floor( pmax);
qmax = floor( qmax);
[ Q P] = meshgrid( ...
	( qmin: qmax) / size( Image, 2), ...
	( pmin: pmax) / size( Image, 1) ...
	);

MTF = ( P .* P + Q .* Q) .^ order;
cutoffpow = cutoff ^ ( 2 * order);

if type( 1) == 'h'
  MTF = MTF ./ ( cutoffpow + MTF);
else
  MTF = cutoffpow ./ ( cutoffpow + MTF);
end

Filtim = real(ifft2( rot90( fftshift( rot90( ...
MTF .* fftshift( fft2( Image)), 2)), 2)));
