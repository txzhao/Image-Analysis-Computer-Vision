function [ segm, prior, fcenters, bcenters ] = graphcut_segm(I, area, K, alpha, sigma)
% area = [ minx, miny, maxx, maxy ]

[h, w, c] = size(I);
dw = area(3) - area(1) + 1;
dh = area(4) - area(2) + 1;
mask = uint8([zeros(area(2) - 1, w); zeros(dh, area(1) - 1), ones(dh, dw), ...
	     zeros(dh, w - area(3)); zeros(h - area(4), w)]);
Ivec = single(reshape(I, size(I, 1) * size(I, 2), 3));

grey = single(rgb2gray(I));
h = fspecial('gaussian', [7, 7], 0.5);
grey = imfilter(grey, h);
h = fspecial('sobel');
dx = imfilter(grey, h/4);
dy = imfilter(grey, h/4');
grad = sqrt(dx.^2 + dy.^2);
edge = (alpha*sigma)*ones(size(grey)) ./ (grad + sigma);

tic
for l = 1 : 3

    fprintf('Find Gaussian mixture models...\n');
    [fprob, fcenters] = mixture_prob(I, K, 20, mask);
    [bprob, bcenters] = mixture_prob(I, K, 20, 1 - mask);
    prior = reshape(fprob ./ (fprob + bprob), size(I, 1), size(I, 2), 1);
    toc

    fprintf('Find minimum cut...\n');
    [u, erriter, i] = cmf_cut(prior, edge);
    mask = uint8(u > 0.5);
    toc

end

segm = int16(u > 0.5) + 1;

