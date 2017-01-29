function Medim = medfilt( Image, wheight, wwidth)
%
%	MEDIM = MEDFILT( IMAGE, WHEIGHT, WWIDTH) computes an output image
%	MEDIM by applying a median filter with window height WHEIGHT and
%	window width WWIDTH to the input image IMAGE.
%	If WWIDTH is omitted, it is set to WHEIGHT.
%

if nargin < 2
  error( 'Wrong # of arguments.')
  return
elseif nargin == 2
  wwidth = wheight;
end

warea = wheight * wwidth;

if wheight < 1 | wwidth < 1
  error( 'Bad data: arg #2 (wheight) & #3 (wwidth) must be strictly positive integers.')
  return
elseif warea == 1
  Medim = Image;
  return
end

Shifts = zeros(prod( size( Image)), warea);

for vecpsf = eye( warea)
  Shift = conv2( Image, reshape( vecpsf, wheight, wwidth), 'same');
  Shifts( :, find(vecpsf)) = Shift( :);
end

Medim = reshape( median( Shifts'), size( Image, 1) , size( Image, 2));
