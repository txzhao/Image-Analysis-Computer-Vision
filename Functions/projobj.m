function out = projobj(obj, projmat)

out.point = projmat * obj.point;

% Keep the line correspondences
out.line = obj.line;

