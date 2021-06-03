
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
  
%   plot(T, u, "LineWidth", 2);
%   xlim([0 3]);

  % peak values for a given period:
  period = 2;
  a = psa(T == period);
  v = psv(T == period);
  d = u(T == period);

  % for normalized pseudo-acceleration and displacement:
  norm = 1; % true;
  
  if (norm == 1)
    peaks = DirectInteg(acc, t);
    pga = peaks(1);
    pgv = peaks(2);
    pgd = peaks(3);
    psv = psv ./ pgv;
   
    fprintf("a at T = %f: %f\n", period, a / pga);
    fprintf("v at T = %f: %f\n", period, v / pgv);
    fprintf("d at T = %f: %f\n", period, d / pgd);
    
    TriPlot(psv, T, norm);
  else
    fprintf("a at T = %f: %f\n", period, a);
    fprintf("v at T = %f: %f\n", period, v);
    fprintf("d at T = %f: %f\n", period, d);
    
    TriPlot(psv, T, norm);
  end
 
end