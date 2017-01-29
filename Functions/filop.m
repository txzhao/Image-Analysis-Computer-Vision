function filop
%	FILOP prompts for and executes file creation.
is = input( 'Print on file? y/n [n]: ', 's');

if isempty( is)
elseif is( 1) == 'y'
  eval( [ 'print -deps ' input( 'Filename: ', 's')]);
end
