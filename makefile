meshes:
	./scripts/gmsh_with_meshsize 0.3 in/square/square.geo in/square/square_coarse.msh
	./scripts/gmsh_with_meshsize 0.1 in/square/square.geo in/square/square_mediumcoarse.msh
	./scripts/gmsh_with_meshsize 0.05 in/square/square.geo in/square/square_mediumfine.msh
	./scripts/gmsh_with_meshsize 0.01 in/square/square.geo in/square/square_fine.msh
