function Jinv = get_inv_jacobian(coords, gx, gy)
if size(coords, 2) == length(coords)
    coords = coords';
end
x1 = coords(1,1); y1 = coords(1, 2);
x2 = coords(2,1); y2 = coords(2, 2);
x3 = coords(3,1); y3 = coords(3, 2);

J11 = -(y1 - y3)/(x1*y2 - x2*y1 - x1*y3 + x3*y1 + x2*y3 - x3*y2);
J12 =  (x1 - x3)/(x1*y2 - x2*y1 - x1*y3 + x3*y1 + x2*y3 - x3*y2);
J21 =  (y1 - y2)/(x1*y2 - x2*y1 - x1*y3 + x3*y1 + x2*y3 - x3*y2);
J22 = -(x1 - x2)/(x1*y2 - x2*y1 - x1*y3 + x3*y1 + x2*y3 - x3*y2);

Jinv = [J11, J12;...
     J21, J22];
end