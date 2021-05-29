
function RSPlot(m, T, zeta, acc, t)
  
  n = length(T);
  u = zeros(n, 1);
  
  for i = 1 : n
    peaks = NewmarkRS(m, T(i), zeta, acc, t);
    u(i) = peaks(1);
  end
  
  plot(T, u, "LineWidth", 2);
  
end