function Intim = ind2int( Indim, map, nlevels)
%	INTIM = IND2INT( INDIM, MAP, NLEVELS) transforms the indexed image
%	with image matrix INDIM and colormap MAP into an positive integer
%	valued gray-level image INTIM with NLEVEL gray-levels.

if nargin < 2
  error( 'Wrong # of arguments.')
  return
elseif nargin == 2
  nlevels = size( map, 1);
end

if any( size( nlevels) ~= 1)
  error( 'Bad argument: arg #3 (nlevels) must be scalar.')
  return
end

nlevels = round( nlevels);
Intim = min( nlevels - 1, floor( nlevels * ind2gray( Indim, map)));
