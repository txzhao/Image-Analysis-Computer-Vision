function Padmat = pad( A, padval)
%

if nargin < 1
  error( 'Wrong # of arguments.')
  return
elseif nargin == 1
  Padmat = A( [ 1 1: size( A, 1) size( A, 1)], ...
	[ 1 1: size( A, 2) size( A, 2)]);
else
  Padmat = [ padval * ones( 1, size( A, 2) + 2)
	padval * ones( size( A, 1), 1) A padval * ones( size( A, 1), 1)
	padval * ones( 1, size( A, 2) + 2)];
end
