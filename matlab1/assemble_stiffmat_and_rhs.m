function [sysmat, sysrhs] = assemble_stiffmat_and_rhs(eles, nodes)
% returns the system matrix and rhs with no dbc applied.
numele = length(eles);
numdofs = length(nodes);
sysmat = zeros(numdofs, numdofs); % SPARSE
sysrhs = zeros(numdofs, 1); % SPARSE

for k = 1:numele
    ele = eles(k,:);
    coords = nodes(ele,:);
    elemat = assemble_ele_stiffmat(ele, coords); % SPARSE
    elevec = assemble_ele_rhs(ele, coords); % SPARSE
    sysmat = add_smallmat_into_bigmat(elemat, sysmat, ele); %  SPARSE
    sysrhs = add_smallvec_into_bigvec(elevec, sysrhs, ele); % SPARSE
end

end