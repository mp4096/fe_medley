function elemat = assemble_ele_stiffmat(ele, elecoords)
elemat = zeros(3,3);
[gpoints, gweights] = get_gausspoints_and_weights(2);
numgpoints = length(gweights);

nodal_gradfunctions = {@gradN1, @gradN2, @gradN3};

for g = 1:numgpoints
    gx = gpoints(g,1);
    gy = gpoints(g,2);
    weight = gpoints(g);
    Jinv = get_inv_jacobian(elecoords, gx, gy);
    detJ = det(get_jacobian(elecoords, gx, gy));
    for i = 1:3  
        for j = 1:3
            gradi = nodal_gradfunctions{i}(gx, gy);
            gradj = nodal_gradfunctions{j}(gx, gy);
            elemat(i,j) = elemat(i,j) + 0.5 * weight * gradi' * Jinv * Jinv' * gradj * detJ;
        end
    end
end
end