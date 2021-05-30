
function [u, psv, psa] = RSPlot(m, T, zeta, acc, t)
  g = 386.08858;
  n = length(T);
  u = zeros(n, 1);
  psv = zeros(n, 1);
  psa = zeros(n, 1);
  
  for i = 1 : n
    w = 2 * pi / T(i);
    peaks = NewmarkRS(m, T(i), zeta, acc, t);
    u(i) = peaks(1);
    psv(i) = u(i) * w;
    psa(i) = u(i) * (w^2) / g;
  end
  
%   plot(T, psa, "LineWidth", 2);

  TriPlot(psv, T);
  
end