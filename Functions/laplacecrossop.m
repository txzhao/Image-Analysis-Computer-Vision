function pixels = laplacecrossop()

% LAPLACECROSSOP -- returns a 3x3 filter mask corresponding to
% the Laplacian cross-operator

pixels = [0.5,  0, 0.5; ...
           0 , -2,  0 ; ...
          0.5,  0, 0.5];


