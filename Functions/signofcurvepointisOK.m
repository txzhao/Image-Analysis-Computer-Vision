function ok = signofcurvepointisOK(mask, x, y)

% SIGNOFCURVEPOINTISOK(MASK, X, Y) -- Sign check in mask image from floating
% point coordinates of a curve.
%
% Performs liberal sign checks in a matrix from floating point coordinates.
% TRUE is returned if some way of rounding off (X, Y) to integer coordinates
% gives rise to a non-negative value of MASK.
%
% Note! This function takes cares of the different coordinate systems used
% for representing curves and images in matlab. If you use this function
% for all pixel accesses from _curve_ coordinates (as those obtained from
% functions derived from the CONTOUR function), you should for many
% purposes be able to ignore the transposed relation between these
% coordinate systems.

ok = signofpixelisOK(mask, y, x);