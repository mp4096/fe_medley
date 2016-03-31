function J = get_jacobian(coords, gx, gy)
if size(coords, 2) == length(coords)
    coords = coords';
end
x1 = coords(1,1); y1 = coords(1, 2);
x2 = coords(2,1); y2 = coords(2, 2);
x3 = coords(3,1); y3 = coords(3, 2);

J = [x2 - x1, x3 - x1;...
     y2 - y1, y3 - y1];
end