
function u = CentralDiff(k, w, zeta, step)

  % Forcing Function
  pt = @(t) 5 * sin(4.8 * pi * t);

  % set @ 10 sec (constant)
  lim = 10;
  n = lim / step;
  
  p = zeros(n, 1);
  t = zeros(n, 1);
  
  u = zeros(n, 1);
  u_dot = zeros(n, 1);
  u_ddot = zeros(n, 1);
  
  u(1) = 0;
  u_dot(1) = 0;
  p(1) = pt(0);
  
  cutoff = 4.2;
  
  m = k / w^2;
  c = 2 * m * w * zeta;

  u_ddot = (p(1) - (c * u_dot(1)) - (k * u(1))) / m;
  
  u_neg = u(1) - (step * u_dot(1)) + ((step^2) * 0.5 * u(1));
  
  k_hat = (m / step^2) + (0.5 * c / step);
  
  a = (m / step^2) - (0.5 * c / step);
  
  b = k - (2 * m / step^2);
  
end
