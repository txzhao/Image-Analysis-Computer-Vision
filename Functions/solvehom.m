function out = solvehom(A)

% Get matrix size
[m n] = size(A);

% if (m < n)
%   error(['The number of rows in A is smaller than the number of columns')
% end

% Compute SVD
[U S V] = svd(A);

% Define a vector for extracting the last column of V
e = zeros(n, 1);
e(n, 1) = 1;

out = V * e;