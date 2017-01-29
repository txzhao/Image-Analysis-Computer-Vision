function outcurves = thresholdcurves(incurves, mask)

% THRESHOLDCURVES(CURVES, MASK) -- Thresholding of curves
%
% Returns a new set of curves containing only those points
% in the polygons for which the mask value is non-negative.
%
% The format of these curves is the same as for CONTOURC

insize = size(incurves, 2);
tmpcurves = zeros(2, insize);

[xsize ysize] = size(mask);

trypointer = 1;
outpointer = 1;

while trypointer <= insize,
  levelvalue = incurves(1, trypointer);
  polylength = incurves(2, trypointer);

  trypointer = trypointer + 1;
  inpointer = trypointer;

  for polyidx = 1:polylength
    % Note! x-coordinate in first slot, y in second slot
    x = incurves(2, trypointer);
    y = incurves(1, trypointer);

    if (~signofpixelisOK(mask, x, y))
      remainlength = trypointer - inpointer;

      if (remainlength >= 0),
        if (remainlength >= 2)
          tmpcurves(1, outpointer) = levelvalue;
          tmpcurves(2, outpointer) = remainlength;

          tmpcurves(1, (outpointer+1):(outpointer+remainlength)) = ...
            incurves(1, inpointer:(inpointer+remainlength-1));
          tmpcurves(2, (outpointer+1):(outpointer+remainlength)) = ...
            incurves(2, inpointer:(inpointer+remainlength-1));

          outpointer = outpointer + remainlength + 1;
        end
      end

      inpointer = inpointer + remainlength + 1;
    end

    trypointer = trypointer + 1;
  end

  remainlength = trypointer - inpointer;

  if (remainlength >= 0),
      if (remainlength >= 2)
        tmpcurves(1, outpointer) = levelvalue;
        tmpcurves(2, outpointer) = remainlength;

        tmpcurves(1, (outpointer+1):(outpointer+remainlength)) = ...
          incurves(1, inpointer:(inpointer+remainlength-1));
        tmpcurves(2, (outpointer+1):(outpointer+remainlength)) = ...
          incurves(2, inpointer:(inpointer+remainlength-1));

        outpointer = outpointer + remainlength + 1;
      end

      inpointer = inpointer + remainlength;
  end
end

outcurves = tmpcurves(:,1:outpointer-1);



