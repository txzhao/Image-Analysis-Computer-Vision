function pixels = laplacefivepointoperator()
% LAPLACEFIVEPOINT -- returns a 3x3 filter mask corresponding to
% the FIve-point Laplacian operator

pixels = [0,  1, 0; ...
          1, -4, 1; ...
          0,  1, 0];


