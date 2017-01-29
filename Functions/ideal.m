function [ Filtim, MTF] = ideal( Image, cutoff, type)
%
%	FILTIM = IDEAL( IMAGE, CUTOFF, TYPE) filters the image IMAGE with
%	an ideal high-pass or low-pass filter with cut-off frequency CUTOFF
%	cycles per pixel and returns the resulting image FILTIM along with
%	the modulation transfer function MTF.
%	The filter is high-pass or low-pass depending on whether TYPE = 'h'
%	or TYPE = 'l' respectively.
%	If TYPE is omitted, it is set to 'l'.

if nargin < 2
  error( 'Wrong # of arguments.')
  return
elseif nargin == 2
  order = 1;
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

cutoff2 = cutoff * cutoff;

if type( 1) == 'h'
  MTF = P .* P + Q .* Q > cutoff2;
else
  MTF = P .* P + Q .* Q <= cutoff2;
end

Filtim = real(ifft2( rot90( fftshift( rot90( ...
MTF .* fftshift( fft2( Image)), 2)), 2)));
