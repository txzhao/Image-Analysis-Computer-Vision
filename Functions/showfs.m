function showfs( Freqspec, res, fourspecmax)
%	Given the frequency spectrum FREQSPEC
%	SHOWFS( FREQSPEC, RES, FOURSPECMAX) displays a compressed version
%	of the corresponding Fourier spectrum as a gray-level image.
%	RES distinct gray-levels, equidistantly spaced between 0 (black)
%	and 1 (white), are used.
%	Matrix elements with absolute values 0 and FOURSPECMAX are mapped
%	to black and white respectively.
%	If FOURSPECMAX is also omitted, it is set to the true max value
%	of the Fourier spectrum.
%	If RES is also omitted, it is assumed to be 64.

if nargin < 1
  error( 'Wrong number of input arguments.')
  return
elseif nargin == 1
  res = 64;
  fourspecmax = max( abs( Freqspec( :)));
elseif nargin == 2
  fourspecmax = max( abs( Freqspec( :)));
end

if fourspecmax < 0
  error( 'Bad data: arg #3 (fourspecmax) < 0.')
  return
end

showglim( log( 1 + abs( fftshift( Freqspec))), res, log( 1 + fourspecmax))
