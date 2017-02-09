function [L, C] = kmeansplus_init(X, K, seed)
L = [];
rng(seed, 'twister');
while length(unique(L)) ~= K    
    % The k-means++ initialization.
    C = X(:, 1 + round(rand * (size(X, 2) - 1)));
    L = ones(1, size(X, 2));
    for i = 2 : K
        D = X - C(:, L);
        D = cumsum(sqrt(dot(D, D, 1)));
        if D(end) == 0, C(:, i : K) = X(:, ones(1, K - i + 1)); return; end
        C(:, i) = X(:, find(rand < D / D(end), 1));
        [~, L] = max(bsxfun(@minus, 2 * real(C' * X), dot(C, C, 1).'));
    end
    
end