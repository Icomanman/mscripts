function w = optimumOmega(n, tol)
v = (1 : 0.1 : 2);
[~, ~, LInf] = vectorNorm(v);

for i = 1:n
  fprintf("i: %i \n", i);
end

err = 1;

if err <= tol
  fprintf("tol: %d \n", tol);
end

fprintf("LInf: %f \n", LInf);

end