function showgray( Image, res, zmin, zmax)

% SHOWGRAY(IMAGE, RESOLUTION, ZMIN, ZMAX)
%
% Version of SHOWGREY with American spelling

if (nargin < 1)
  error( 'Wrong number of input arguments.')
  return
end
if (nargin <= 1)
  res = 64;
end
if (nargin <= 3)
  zmin = min( Image( :));
  zmax = max( Image( :));
end

rsize = size( res);

if isempty( Image)
  error( 'Bad argument: arg #1 (Image) must not be empty.')
  return
elseif all( rsize ~= 1)
  error( 'Bad argument: arg #2 (res) must be a vector (or scalar).')
  return
elseif any( size( zmax) ~= 1)
  error( 'Bad argument: arg #3 (zmax) must be scalar.')
  return
elseif any( size( zmin) ~= 1)
  error( 'Bad argument: arg #3 (zmin) must be scalar.')
  return
end

if all( rsize == 1)
  col = linspace( 0, 1, res)';

  if res <= 1
    error( 'Bad argument: scalar arg #2 (res) < 2 .')
    return
  end
else
  if rsize( 1) == 1
    col = res';
  else
    col = res;
  end

  res = length( col);
end

range = zmax - zmin;

if ~range
  range = eps;
end

image( 1 + res / range * ( Image - zmin));
colormap( [ col col col]);

axis image
axis off




