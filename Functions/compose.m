function B = compose( f, A)
%	B = COMPOSE( F, A) computes the matrix B with elements
%	B( m, n) = F( A( m, n)).
%	Thus F should be a vector, and the elements of the matrix A should
%	take values in the interval [ 0.5, length( F) + 0.5[.
%	The output matrix B has the same size as the input matrix A.
%	If F and A are viewed as sampled functions of one and two variables
%	respectively, then B can be viewed as the sampled version of the
%	composition ( F o A) of F and A.
%	If necessary, the range of A is forced within the domain of F by
%	truncation.

if nargin ~= 2
  error( 'Wrong # of arguments.')
  return
elseif all( size( f) ~= 1)
  error( 'Bad argument: arg #1 (f) must be a vector (or scalar.)')
  return
end

B = reshape( f( min( length( f), max( 1, A( :)))), size( A, 1), size( A, 2));
