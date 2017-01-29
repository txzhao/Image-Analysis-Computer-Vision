function noisy = gaussnoise(inpic, sdev, zmin, zmax)
%
% GAUSSNOISE(INPIC, SDEV, ZMIN, ZMAX) adds white (uncorrelated)
% Gaussian noise with standard deviation SDEV to INPIC.
%       
% If the arguments ZMIN and ZMAX are specified, the output
% values are truncated to the range [ZMIN, ZMAX]

if nargin < 2
  error( 'Wrong # of arguments.')
  return
elseif nargin == 2
  noisy = inpic + sdev * randn( size( inpic));
else
  noisy = max( zmin, min( zmax, inpic + sdev * randn( size( inpic))));
end
