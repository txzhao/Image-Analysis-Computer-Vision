function [ Pos, Value, Anms] = locmax8( A)

%	[ POS, VALUE, ANMS] = LOCMAX8( A) finds the 8-connectedness local
%	maxima of the matrix A and returns a list POS with the positions
%	of the local maxima, a list VALUE with the corresponding local
%	maximal values, and a matrix ANMS equal to A at the local maxima
%	and set to 0 everywhere else.

if nargin < 1
  error( 'Wrong # of arguments.')
  return
end

framed=zeros(size(A)+2);
framed(2:(size(A,1)+1),2:(size(A,2)+1))=A;
A=framed;

Shifts = zeros( prod( size( A)), 9);

for vecpsf = eye( 9)
  Shift = conv2( pad( A, -inf), reshape( vecpsf, 3, 3), 'valid');
  Shifts( :, find(vecpsf)) = Shift( :);
end

Anms = ones( size( A(:)));

for shiftind = 1: 4
  Anms = Anms & Shifts( :, 5) >= Shifts( :, shiftind);
end

for shiftind = 6: 9
  Anms = Anms & Shifts( :, 5) > Shifts( :, shiftind);
end

locmaxind = find( Anms);
[ Col, Row] = meshgrid( 1: size( A, 2), 1: size( A, 1));
Pos = [ Row( locmaxind) Col( locmaxind)];
Value = A( locmaxind);
Anms = reshape( Anms, size( A, 1), size( A, 2)) .* A;

Pos=Pos-1;
Anms=Anms(2:(size(Anms,1)-1),2:(size(Anms,2)-1));