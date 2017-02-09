function segm = mean_shift_segm(I, spatial_bandwidth, colour_bandwidth, num_iterations)

tic
fprintf('Find colour channels with K-means...\n');
K = 16;
[segm, centers, ~, ~, ~] = kmeans_segm(I, K, 10, 4321, true, false);
toc

centers(isnan(centers)) = 0.0;
% imshow(overlay_bounds(I, segm))
% pause

[height, width, depth] = size(I);
idx = reshape(segm, [height, width]);
maps = zeros(height, width, K, 'single'); 
mapx = zeros(height, width, K, 'single');
mapy = zeros(height, width, K, 'single');
[X, Y] = meshgrid(1:width, 1: height);
for k = 1:K
    maps(:,:,k) = (idx == k);       % label the position whose index equals k
    mapx(:,:,k) = maps(:,:,k).*X;   % labels to coordinates
    mapy(:,:,k) = maps(:,:,k).*Y; 
end
s = 2*ceil(1.5*spatial_bandwidth) + 1;
h = fspecial('gaussian', [s s], spatial_bandwidth);
mapsw = reshape(imfilter(maps, h), [width*height,K]) + 1e-6;
mapsx = reshape(imfilter(mapx, h), [width*height,K]);
mapsy = reshape(imfilter(mapy, h), [width*height,K]);
toc

fprintf('Search for high density points...\n');
constC = -0.5/(colour_bandwidth^2);
x = reshape(X, [width*height, 1]);
y = reshape(Y, [width*height, 1]);
Ic = single(reshape(I, [width*height, 3]));
wei = exp(constC*pdist2(Ic, centers));  % kernel = exp(-0.5||x/h||^2)
for l = 1:num_iterations
    p = (round(x)-1)*height + round(y);
    ww = mapsw(p,:) .* wei;
    w = sum(ww, 2);
    u = bsxfun(@rdivide, ww*centers, w);
    x = bsxfun(@rdivide, sum(mapsx(p,:).*wei, 2), w);
    y = bsxfun(@rdivide, sum(mapsy(p,:).*wei, 2), w);
    wei = bsxfun(@rdivide, ww, w);
    x = max(min(x, width), 1);
    y = max(min(y, height), 1);
    toc
end

fprintf('Assign high density points to pixels...\n');
XY = [x, y];
thr = 10.0;
val = 0;
mask = zeros(height*width, 1, 'int16');
for y=1:height
    for x=1:width
        p = round(x-1)*height + round(y);
        if mask(p)==0
    	    stack = [ p ];
            val = val + 1;
            mask(p) = val;
            while length(stack)>0
	        p0 = stack(end);
                xy = XY(p0,:);
                x0 = floor((p0-1)/height) + 1;
                y0 = mod(p0-1, height) + 1;
	        stack = stack(1:end-1);
                if x0<width & mask(p0+height)==0 & sum((xy-XY(p0+height,:)).^2)<thr
                    stack = [ stack, p0+height ]; 
                    mask(p0+height) = val;
                end
                if x0>1 & mask(p0-height)==0 & sum((xy-XY(p0-height,:)).^2)<thr
                    stack = [ stack, p0-height ]; 
                    mask(p0-height) = val;
                end
                if y0<height & mask(p0+1)==0 & sum((xy-XY(p0+1,:)).^2)<thr
                    stack = [ stack, p0+1 ]; 
                    mask(p0+1) = val;
                end
                if y0>1 & mask(p0-1)==0 & sum((xy-XY(p0-1,:)).^2)<thr
                    stack = [ stack, p0-1 ]; 
                    mask(p0-1) = val;
                end
            end
        end
    end
end
segm = reshape(mask, [height,width]);
toc
