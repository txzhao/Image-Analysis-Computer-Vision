function imout = overlap_bounds(im, segm)
[h,w] = size(segm);
imcut = segm(2:h-1,2:w-1);
diff = [ ones(1,w) ; ones(h-2,1), ((imcut==segm(3:h,2:w-1)) & (imcut==segm(2:h-1,3:w)) & (imcut==segm(1:h-2,2:w-1)) & (imcut==segm(2:h-1,1:w-2))), ones(h-2,1); ones(1,w) ];
mask = repmat(uint8(diff), [1,1,3]);
imout = (im .* mask);
imout(:,:,1) = imout(:,:,1) + (1 - mask(:,:,1))*255;

