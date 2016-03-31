function plot_fe_function(ele_array, node_array, solution)
trisurf(ele_array, node_array(:,1), node_array(:,2), solution);
end