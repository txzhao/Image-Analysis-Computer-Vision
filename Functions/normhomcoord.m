function out = normhomcoord(object)

dimension = size(object.point, 1) - 1;
numpoints = size(object.point, 2);

out.point = zeros(dimension+1, numpoints);
out.line = object.line;

for pointidx = 1:numpoints,
  point = object.point(:,pointidx);
  
  if (dimension == 3)
    out.point(:, pointidx) = point(1:4)/point(4);
  elseif (dimension == 2)
    out.point(:, pointidx) = point(1:3)/point(3);
  end
end
