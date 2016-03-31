% parse the input file
function [ele_array, node_array, dbc_indices] = parse_msh(filename)
%% parse the nodes (easy, because numnodes is available)
meshfile = fileread(filename);
meshfile = strsplit(meshfile, '\n');

numnodes = str2num(meshfile{5});
node_array = zeros(numnodes,2);
for i=1:numnodes
    coords = strsplit(meshfile{i+5});
    node_array(i,:) = [str2num(coords{2}) str2num(coords{3})];
end

%% find total number of elements and boundary elements and number of nodes
fid = fopen(filename);

line = fgetl(fid);
num_bnd_elements = 0;
num_vol_elements = 0;
while ischar(line)
    % for 1D elements
    matches = regexp(line, '^\d+ \d+ \d+ \d+ \d+ (\d+) (\d+)$', 'tokens');
    if ~isempty(matches)
        num_bnd_elements = num_bnd_elements + 1;
    end
    % for 2D elements
    matches = regexp(line, '^\d+ \d+ \d+ \d+ \d+ (\d+) (\d+) (\d+)$', 'tokens');
    if ~isempty(matches)
        num_vol_elements = num_vol_elements + 1;
    end
            
    
    line = fgetl(fid);
end

fclose(fid);

%% do the actual parsing for the elements

fid = fopen(filename);

line = fgetl(fid);
bnd_elements = zeros(num_bnd_elements, 3);
ele_array = zeros(num_vol_elements, 3);
facet_counter = 1;
cell_counter = 1;
while ischar(line)
    % for 1D elements
    matches = regexp(line, '^\d+ \d+ \d+ (\d+) \d+ (\d+) (\d+)$', 'tokens');
    if ~isempty(matches)
        bnd_elements(facet_counter, :) = [str2num(matches{1}{1}) str2num(matches{1}{2}) str2num(matches{1}{3})];
        facet_counter = facet_counter + 1;
    end
    % for 2D elements
    matches = regexp(line, '^\d+ \d+ \d+ \d+ \d+ (\d+) (\d+) (\d+)$', 'tokens');
    if ~isempty(matches)
        ele_array(cell_counter, :) = [str2num(matches{1}{1}) str2num(matches{1}{2}) str2num(matches{1}{3})];
        cell_counter = cell_counter + 1;
    end
        
    
    line = fgetl(fid);
end
fclose(fid);
%% filter bnd elements by subdomain
% dirichlet = 1
dbc_indices = bnd_elements(find(bnd_elements(:,1)==1), 2:3);
dbc_indices = unique(dbc_indices(:));
