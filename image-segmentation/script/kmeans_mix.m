function [segmentation, centers, empty, cen_idx, count] = kmeans_mix(Ivec, K, L, seed, RANDSAMP, DEBUG)
delta = 100 * ones(K, 3);
clus_centers = zeros(K, 3);
clus_centers_new = zeros(K, 3);
idx_old = zeros(1, size(Ivec, 1));
empty = false;
threshold = 0.01;
count = 0;
nthreshold = 2;

% Let X be a set of pixels and V be a set of K cluster centers in 3D (R,G,B).
if RANDSAMP == true
    % Randomly initialize the K cluster centers
%     rng(seed, 'twister');
    clus_centers = rand(K, 3);
    
    % or you can choose cluster centers by yourself
%     clus_centers(1, :) = 1/255 * [255, 155, 0];
%     clus_centers(2, :) = 1/255 * [255, 255, 255];
%     clus_centers(3, :) = rand(1, 3);

    % or you can choose cluster centers from image pixels
%     rng('default');
%     idx = randperm(size(Ivec, 1), K);
%     for i = 1 : K
%         clus_centers(i, :) = Ivec(idx(i), :);
%     end
else
    % implement k-means++ algorithm
    [~, clus_init] = kmeansplus_init(Ivec', K, seed);
    clus_centers = clus_init';
end

% Compute all distances between pixels and cluster centers
D = pdist2(clus_centers, Ivec, 'euclidean');

if DEBUG == false
    % Iterate L times
    for i = 1 : L
        % Assign each pixel to the cluster center for which the distance is minimum
        [~, cen_idx] = min(D);
        
        % Recompute each cluster center by taking the mean of all pixels assigned to it
        for j = 1 : K
            n_idx = find(cen_idx == j);
            if size(n_idx, 2) < nthreshold
                clus_centers(j, :) = rand(1, 3);
%                 empty = 1;
%                 n = randsample(size(Ivec, 1), 1);
%                 clus_centers(j, :) = Ivec(n, :);
            else
                clus_centers(j, :) = double(mean(Ivec(n_idx, :)));
            end
        end
        % Recompute all distances between pixels and cluster centers
        D = pdist2(clus_centers, Ivec, 'euclidean');
    end
else
    % debug
    while (max(delta(:)) > threshold)
        [~, cen_idx] = min(D);
        for j = 1 : K
            n_idx = find(cen_idx == j);
            if isempty(n_idx) == true
                empty = 1;
                n = randsample(size(Ivec, 1), 1);
                clus_centers_new(j, :) = Ivec(n, :);
            else
                clus_centers_new(j, :) = mean(Ivec(n_idx, :));
            end
        end
        delta = abs(clus_centers_new - clus_centers);
%         delta = abs(idx_old - cen_idx);
        count = count + 1;
        D = pdist2(clus_centers_new, Ivec, 'euclidean');
        clus_centers = clus_centers_new;
%         idx_old = cen_idx;
    end
end

[~, cen_idx] = min(D);
segmentation = cen_idx;
centers = clus_centers;
