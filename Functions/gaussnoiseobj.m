function out = gaussnoiseobj(obj, sigma)

out.point = gaussnoise(obj.point, sigma);

% Keep the line correspondences
out.line = obj.line;

