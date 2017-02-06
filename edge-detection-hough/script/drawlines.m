function drawlines(nrho, ntheta, Dx, Dy)
clf
num = max(size(nrho, 1), size(nrho, 2));
for i = 1 : num
    if (ntheta(i) == pi/2) || (ntheta(i) == -pi/2)
        line([nrho(i), nrho(i)], [1, Dx])
    elseif ntheta(i) == 0
        line([1, Dy], [nrho(i), nrho(i)])
    else
        xd_neg = (nrho(i) - 1 * sin(ntheta(i))) / cos(ntheta(i));
        xd_pos = (nrho(i) - Dy * sin(ntheta(i))) / cos(ntheta(i));
        yd_neg = (nrho(i) - 1 * cos(ntheta(i))) / sin(ntheta(i));
        yd_pos = (nrho(i) - Dx * cos(ntheta(i))) / sin(ntheta(i));
        if (xd_neg <= Dx && xd_neg >= 1) && (yd_neg <= Dy && yd_neg >= 1)
            line([1, yd_neg], [Dx - xd_neg, Dx])
        elseif (xd_neg <= Dx && xd_neg >= 1) && (yd_pos <= Dy && yd_pos >= 1)
            line([1, yd_pos], [Dx - xd_neg, 1])
        elseif (xd_pos <= Dx && xd_pos >= 1) && (yd_pos <= Dy && yd_pos >= 1)
            line([yd_pos, Dy], [1, Dx - xd_pos])
        elseif (xd_pos <= Dx && xd_pos >= 1) && (yd_neg <= Dy && yd_neg >= 1)
            line([1, Dy], [Dx - xd_neg, Dx - xd_pos])
        elseif (xd_neg <= Dx && xd_neg >= 1) && (xd_pos <= Dx && xd_pos >= 1)
            line([yd_neg, Dy], [Dx, Dx - xd_pos])
        else
            line([yd_pos, yd_neg], [1, Dx])
        end
    end    
    hold on;
end
axis([1 Dy 1 Dx]);

