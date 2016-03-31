% script that computes the solution for an example
inputmeshname = '../in/square/square_mediumcoarse.msh';
[ele_array, node_array, dbc_indices] = parse_msh(inputmeshname);
dbc_values = zeros(size(dbc_indices));
[sysmat, sysrhs] = assemble_stiffmat_and_rhs(ele_array, node_array);
[sysmat, sysrhs] = apply_dbc(sysmat, sysrhs, dbc_indices, dbc_values);

sol = solve_system(sysmat, sysrhs); % SPARSE