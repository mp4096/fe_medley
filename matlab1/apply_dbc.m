function [outsysmat, outsysrhs] = apply_dbc(insysmat, insysrhs, dbc_indices, dbc_values)
% implements the asymmetric variant of dbc-application
insysmat(dbc_indices, :) = 0; % SPARSE

for k = 1:length(dbc_indices)
    insysmat(dbc_indices(k), dbc_indices(k)) = 1;
end

insysrhs(dbc_indices) = dbc_values;

outsysmat = insysmat;
outsysrhs = insysrhs;
end