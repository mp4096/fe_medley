function sysmat = add_smallmat_into_bigmat(smallmat, bigmat, ele_indices)
sysmat = bigmat;
sysmat(ele_indices, ele_indices) = sysmat(ele_indices, ele_indices) + smallmat; % SPARSE
end