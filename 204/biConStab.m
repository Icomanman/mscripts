 
[x, FLAG, RELRES, ITER, RESVEC] = bicgstab(A,b, [], 200);

plot(RESVEC, "Linewidth", 1);