function out = depthmatrix(Z)

out = [1, 0, 0, 0;
       0, 1, 0, 0;
       0, 0, 1, Z;
       0, 0, 0, 1];
