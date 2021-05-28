
function u = CentralDiff(k, w, zeta, step)

  % Forcing Function
  % pt = @(s) 10 * sin(pi * s / 0.6);
  pt = @(t) 5 * sin(4.8 * pi * t);
  
  % set @ 10 sec (constant):
  lim = 10;
  n = lim / step;
  
  cutoff = 4.2;
  % init vectors:
  p = zeros(n, 1);
  t = zeros(n, 1);
  u = zeros(n, 1);
  u_dot = zeros(n, 1);
  u_ddot = zeros(n, 1);
  
  % init values:
  u(1) = 0;
  u_dot(1) = 0;
  p(1) = pt(0);
  
  m = k / w^2;
  c = 2 * m * w * zeta;

  u_ddot(1) = (p(1) - (c * u_dot(1)) - (k * u(1))) / m;
  
  u_neg = u(1) - (step * u_dot(1)) + ((step^2) * 0.5 * u_ddot(1));
  
  k_hat = (m / step^2) + (0.5 * c / step);
  p_hat = zeros(n, 1);

  a = (m / step^2) - (0.5 * c / step);
  
  b = k - (2 * m / step^2);
  
  p_hat(1) = p(1) - (a * u_neg) - (b * u(1));
  
  for i = 1 : n
    
    if ((i*step) <= cutoff)
      p(i + 1) = pt(i * step);
    else
      p(i + 1) = 0;
    end
    
    p_hat(i + 1) = p(i + 1) - (a * u(i)) - (b * u(i + 1));
    u(i + 2) = p_hat(i + 1) / k_hat;
    
    t(i) = (i - 1) * step;
    
  end
  
  t(n + 1) = (lim * step) +  t(n);
  % t(n + 2) = (lim * step) +  t(n + 1);
  plot(t, u(2 : end), "Color","#A2142F" , "LineWidth", 2);
  % "#A2142F" - Maroon
  % "#7E2F8E" - Purple
  % "#77AC30" - Green
  xlim([0 10]);
  ylim([-0.35 0.35]);
  
  legend("Linear Interpolation", "Central Difference");
  hold off;
end
