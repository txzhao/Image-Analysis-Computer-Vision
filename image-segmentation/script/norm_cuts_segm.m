function segm = norm_cuts_segm(I, colour_bandwidth, radius, ncuts_thresh, max_area, max_depth)

tic
[nRow, nCol, c] = size(I);
N = nRow * nCol;
V = reshape(I, N, c); % connect up-to-down way. Vertices of Graph

fprintf('Compute affinity matrix...\n');
W = ncuts_affinity(I, radius, colour_bandwidth);
toc 

fprintf('Solve eigenvalue problems to find partitions...\n');
Seg = (1:N)'; 
[Seg, Id, Ncut] = ncuts_partition(Seg, W, ncuts_thresh, max_area, 'ROOT', max_depth, 1);

segm = zeros(nRow*nCol, 1);
for i=1:length(Seg)
    segm(Seg{i}) = i;
    fprintf('%s. Ncut = %f\n', Id{i}, Ncut{i});
end

segm = uint32(reshape(segm, nRow, nCol));
toc

