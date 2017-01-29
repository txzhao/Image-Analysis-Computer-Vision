function [ Pos, Value, Anms] = locmax4( A)

Anms = [ diff( A) < 0; ones( 1, size( A, 2))] ...
	& [ ones( 1, size( A, 2)); diff( A) >= 0] ...
	& [ diff( A') < 0; ones( 1, size( A, 1))]' ...
	& [ ones( 1, size( A, 1)); diff( A') >= 0]';
locmaxind = find( Anms);
[ Col, Row] = meshgrid( 1: size( A, 2), 1: size( A, 1));
Pos = [ Row( locmaxind) Col( locmaxind)];
Value = A( locmaxind);
Anms = Anms .* A;
