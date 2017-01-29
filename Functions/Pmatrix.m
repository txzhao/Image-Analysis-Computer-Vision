function out = Pmatrix(focallength)

f = focallength;

out = [1, 0,   0, 0;
       0, 1,   0, 0;
       0, 0, 1/f, 0];
