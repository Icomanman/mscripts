function u = DirectInteg(acc, t)
  g = 386.08858;
  n = length(acc);
  u = zeros(n, 1);
  u_dot = zeros(n, 1);
  step = t(2) - t(1);

  u(1) = 0;
  u_dot(1) = 0;
  
  for i = 1 : n - 1
    u_dot(i + 1) = u_dot(i) + (g * 0.5 * (acc(i) + acc(i + 1)) * step);
    u(i + 1) = u(i) + (0.5 * (u_dot(i) + u_dot(i + 1)) * step); 
  end  

  u_dot_max = max(u_dot);
  u_dot_min = min(u_dot);
  
  fprintf("Min: %f at %f. \n", u_dot_min, t(u_dot == u_dot_min));
  fprintf("Max: %f at %f. \n", u_dot_max, t(u_dot == u_dot_max));
  
  plot(t, u_dot, "LineWidth", 1.5);
  grid on;
  xlim([0 20]);
  ylim([-30 30]);

end