function curves = zerocrosscurves(zero, mask)

% ZEROCROSSCURVES(ZERO, MASK) -- Extraction of zero-crossing curves
%
% Computes the zero-crossing curves from the image ZERO
% If the MASK image is specified, only point on the zero-crossing
% curves for which the mask value is non-negative are preserved
%
% The format of these curves is the same as for CONTOURC

[coordpairs dummy] = contours(zero, [0 0]);

if (nargin < 2) 
  curves = coordpairs;
else
  curves = thresholdcurves(coordpairs, mask);
end
