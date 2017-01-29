function lineplotobject(object)

hold on

dimension = size(object.point, 1) - 1;

numlines = size(object.line, 2);

for lineidx = 1:numlines,
  pointidx1 = object.line(1,lineidx);
  pointidx2 = object.line(2,lineidx);
    
  point1 = object.point(:,pointidx1);
  point2 = object.point(:,pointidx2);
  
  if (dimension == 3)
    p1 = point1(1:3)/point1(4);
    p2 = point2(1:3)/point2(4);

    plot3([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)])
  elseif (dimension == 2)
    p1 = point1(1:2)/point1(3);
    p2 = point2(1:2)/point2(3);

    plot([p1(1), p2(1)], [p1(2), p2(2)])
  end
end

hold off

xlabel('X')
ylabel('Y')

if (dimension == 3)
  zlabel('Z')

  rotate3d on
end



% You can now rotate this figure interactively