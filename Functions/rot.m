function Rotim = rot( Image, angle, bkg)
%
%	ROTIM = ROT( IMAGE, ANGLE, BKG) rotates the image IMAGE by an angle
%	ANGLE and sets the values of the background pixels to BKG.
%	If BKG is omitted, it is set to 0.
%	If ANGLE is also omitted, it is also set to 0.
%	This is not a very interesting rotation, but it will, like all
%	other values of ANGLE, create an output image ROTIM of size DxD,
%	where D = NORM( SIZE( IMAGE)), with the original image in the center.

if nargin < 1
  error( 'Wrong # of arguments.')
  return
elseif nargin == 1
  angle = 0;
  bkg = 0;
elseif nargin == 2
  bkg = 0;
end

diam = norm( size( Image));
rad2 = ( diam - 1) / 2;
gridvec = linspace( -rad2, rad2, ceil( diam));
[ X2 X1] = meshgrid( gridvec, gridvec);
Y = round( ...
	[ X1( :) X2( :)] ...
	* sin( pi / 180 * [ 90 - angle, -angle; angle, 90 - angle]) ...
	+ ones( size( X1( :))) ...
	* ceil( ( size( Image) + 1) / 2) ...
	);
outind = find( Y( :, 1) < 1 | Y( :, 1) > size( Image, 1) ...
	| Y( :, 2) < 1 | Y( :, 2) > size( Image, 2));
Y = Y( :, 1) + ( Y( :, 2) - 1) * size( Image, 1);
Y( outind, :) = prod( size( Image)) + ones( size( outind));
Image = [ Image( :); bkg];

if nargout
  Rotim = reshape( Image( Y), size( X1, 1), size( X1, 2));
else
  showglim( reshape( Image( Y), size( X1, 1), size( X1, 2)))
end
