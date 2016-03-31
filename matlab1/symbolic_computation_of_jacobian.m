% script to compute the inverse of the jacobian of the transform for
% linear triangles

syms x1 x2 x3 y1 y2 y3

B = [x2 - x1, x3 - x1;...
     y2 - y1, y3 - y1];
 
Binv = inv(B)