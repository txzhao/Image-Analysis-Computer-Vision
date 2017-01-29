function pointplot(points)

hold on

dimension = size(points, 1) - 1;

numpoints = size(points, 2);

for pointidx = 1:numpoints,
  point = points(:,pointidx);
  
  if (dimension == 3)
    pt = point(1:3)/point(4);
  elseif (dimension == 2)
    pt = point(1:2)/point(3);
  end
  
  scatter(pt(1), pt(2))
end

hold off

xlabel('X')
ylabel('Y')
zlabel('Z')

rotate3d on
