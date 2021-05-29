function u = Newmark(k, w, zeta, step)
  gamma = 0.5;
  beta = 1 / 6;
  r = gamma / beta;
  
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
  p_hat = zeros(n, 1);
  
  % init values:
  u(1) = 0;
  u_dot(1) = 0;
  p(1) = pt(0);
  p_hat(1) = 0;
  
  m = k / w^2;
  c = 2 * m * w * zeta;
   
  a1 = (m / (beta * step^2)) + (gamma * c / (beta * step));
  a2 = (m / (beta * step)) + ((r - 1) * c);
  a3a = ((1 / (2 * beta)) - 1) * m;
  a3b = ((r / 2) - 1) * step * c ;
  a3 = a3a + a3b;
  
  k_hat = k + a1;
  u_ddot(1) = (p(1) - (c * u_dot(1)) - (k * u(1))) / m;
  
  for i = 1 : n
    if ((i*step) <= cutoff)
      p(i + 1) = pt(i * step);
    else
      p(i + 1) = 0;
    end
    
    p_hat(i + 1) = p(i + 1) + a1 * u(i) + a2 * u_dot(i) + a3 * u_ddot(i);
    
    u(i + 1) = p_hat(i + 1) / k_hat;
    
    u_dot(i + 1) = (r * (u(i + 1) - u(i)) / step)...
                 + ((1 - r) * u_dot(i))...
                 + (step * u_ddot(i) * (1 - (r / 2)));
    
    u_ddot(i + 1) = ((u(i + 1) - u(i)) / (beta * step^2))...
                  - (u_dot(i) / (beta * step))...
                  - (((1 / (2 * beta)) - 1) * u_ddot(i));
                
    t(i) = (i - 1) * step;
  end
  
  t(n + 1) = (lim * step) +  t(n);
  % "#0072BD" - Blue
  plot(t, u, "Color", "#0072BD", "LineWidth", 1.5);
  xlim([0 10]);
  ylim([-0.35 0.35]);
  
  legend("Linear Interpolation", "Central Difference", "Newmark - Linear Acc.");
  xlabel("Time, t (sec)");
  ylabel("Displacement, u (in)");
  hold off;
end