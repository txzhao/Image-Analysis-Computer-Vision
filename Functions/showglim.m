function showglim( Image, res, zmax, zmin)
%	SHOWGLIM( IMAGE, RES, ZMAX, ZMIN)
%	shows the real matrix IMAGE as gray-level image.
%	If RES is scalar, RES distinct gray-levels, equidistantly
%	spaced between 0 (black) and 1 (white), are used.
%	If RES is a vector, its elements, which should lie in the interval
%	[ 0, 1], are used as gray-levels.
%	The (matrix element) values ZMIN and ZMAX are mapped to black and
%	white respectively.
%	For a quantized image it is advisable to set ZMAX = first
%	quantization level outside actual range.
%	Values in ] ZMIN, ZMAX[ are mapped by linear interpolation.
%	Values outside this interval are mapped to either black or white by
%	truncation.
%	If ZMIN is omitted, it is assumed to be 0.
%	If ZMAX is also omitted, ZMAX and ZMIN are set to the true max
%	and min values of the elements of IMAGE.
%	If RES is also omitted, it is assumed to be 64.
%	If ZMIN = ZMAX, the displayed image is thresholded at ZMAX.

if nargin < 1
  error( 'Wrong number of input arguments.')
  return
elseif nargin == 1
  res = 64;
  zmax = max( Image( :));
  zmin = min( Image( :));
elseif nargin == 2
  zmax = max( Image( :));
  zmin = min( Image( :));
elseif nargin == 3
  zmin = 0;
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
