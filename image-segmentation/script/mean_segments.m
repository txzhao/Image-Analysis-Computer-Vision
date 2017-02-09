function Inew = mean_segments(I, segm)

N = max(max(segm));
[h, w, c] = size(I);
Ic = single(reshape(I, [h*w, c]));
sc = reshape(segm, [h*w,1]);
cols = zeros(N, c);
nums = zeros(N, 1);
for i=1:h*w
    s = sc(i);
    cols(s,:) = cols(s,:) + Ic(i,:);
    nums(s) = nums(s) + 1;
end
cols = bsxfun(@rdivide, cols, nums);
Inew = uint8(reshape(cols(sc,:), [h,w,c]));
