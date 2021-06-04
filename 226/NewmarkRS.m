function peaks = NewmarkRS(m, T, zeta, acc, t)
  g = 386.08858;
  gamma = 0.5;
  beta = 1 / 6;
  r = gamma / beta;
  
  w = 2 * pi / T;
  k = m * w^2;
  
  % Forcing Function - given by the acc

  % Determined by the no. of data points
  step = t(2) - t(1);
  n = length(acc);
  lim = (n * step) - step;
  
  % init vectors:
  p = zeros(n, 1);
  u = zeros(n, 1);
  u_dot = zeros(n, 1);
  u_ddot = zeros(n, 1);
  p_hat = zeros(n, 1);
  
  % init values:
  u(1) = 0;
  u_dot(1) = 0;
  p(1) = acc(1);
  
  m = k / w^2;
  c = 2 * m * w * zeta;

  a1 = (m / (beta * step^2)) + (gamma * c / (beta * step));
  a2 = (m / (beta * step)) + ((r - 1) * c);
  a3a = ((1 / (2 * beta)) - 1) * m;
  a3b = ((r / 2) - 1) * step * c ;
  a3 = a3a + a3b;
  
  k_hat = k + a1;
  % u_ddot(1) = (p(1) - (c * u_dot(1)) - (k * u(1))) / m;
  u_ddot(1) = ((m * p(1)) - (c * u_dot(1)) - (k * u(1))) / m;

  p_hat(1) = (g * m * acc(1))...
  + a1 * u(1)...
  + a2 * u_dot(1)...
  + a3 * u_ddot(1);

for i = 1 : (n - 1)

  p_hat(i + 1) = (g * m * acc(i + 1))...
  + a1 * u(i)...
  + a2 * u_dot(i)...
  + a3 * u_ddot(i);

  u(i + 1) = p_hat(i + 1) / k_hat;

  u_dot(i + 1) = (r * (u(i + 1) - u(i)) / step)...
  + ((1 - r) * u_dot(i))...
  + (step * u_ddot(i) * (1 - (r / 2)));

  u_ddot(i + 1) = ((u(i + 1) - u(i)) / (beta * step^2))...
  - (u_dot(i) / (beta * step))...
  - (((1 / (2 * beta)) - 1) * u_ddot(i));

end

u_max = max(max(u), abs(min(u)));
u_dot_max = max(max(u_dot), abs(min(u_dot)));
u_ddot_max = max(max(u_ddot), abs(min(u_ddot)));
ug = max(abs(acc));
peaks = [u_max, u_dot_max, u_ddot_max, ug];

if (u_max == Inf)
  peaks = [0, 0, 0, ug];
end

%   plot(t, u, "LineWidth", 1.5);
%   hold on;
%   plot(t, u_dot, "LineWidth", 1.5);
%   hold on;
%   plot(t,  u_ddot, "LineWidth", 1.5);
%   hold off;
%   ylim([-min(peaks) min(peaks)]);
%   xlim([0 lim]);

%   legend("Displacement", "Velocity", "Acceleration");

end