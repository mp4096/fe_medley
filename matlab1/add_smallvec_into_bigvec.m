function sysvec = add_smallvec_into_bigvec(smallvec, bigvec, ele_indices)
sysvec = bigvec;
sysvec(ele_indices) =  sysvec(ele_indices) + smallvec;
end