function noisy = sapnoise( inpic, frac, zmin, zmax)
%
% SAPNOISE( inpic, FRAC, ZMIN, ZMAX) adds salt-and-peppar noise to an
% image by resetting a fraction FRAC/2 of the pixels to ZMIN and a 
% similar fraction to ZMAX in a pixel-to-pixel independent manner.
%
% If ZMIN and ZMAX are omitted, they are set to the true minimum
% and maximum values of inpic.
%

if nargin < 2
  error( 'Wrong # of arguments.')
  return
elseif nargin < 4
  zmax = max( inpic( :));
  zmin = min( inpic( :));
end

noisy = inpic;
Rand = rand( size( inpic));
index = find( Rand < frac / 2);
noisy( index) = zmin * ones( length( index), 1);
index = find( Rand > 1 - frac / 2);
noisy( index) = zmax * ones( length( index), 1);
