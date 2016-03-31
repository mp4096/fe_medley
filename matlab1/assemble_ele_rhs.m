function elerhs = assemble_ele_rhs(eles, coords)
elerhs = zeros(3,1);
[gpoints, gweights] = get_gausspoints_and_weights(2);
numgpoints = length(gweights);

nodal_functions = {@N1, @N2, @N3};

for g = 1:numgpoints
    gx = gpoints(g,1);
    gy = gpoints(g,2);
    weight = gpoints(g);
    for i = 1:3  
        elerhs(i) = elerhs(i) + 0.5 * weight * nodal_functions{i}(gx, gy);
    end
end
end