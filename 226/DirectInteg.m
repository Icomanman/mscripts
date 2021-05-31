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
  t_idx_min = find(u_dot == u_dot_min);
  t_idx_max = find(u_dot == u_dot_max);
  fprintf("Min: %d at %d. \n", u_dot_min, t(t_idx_min));
  fprintf("Max: %d at %d. \n", u_dot_max, t(t_idx_max));
  % plot(t, u_dot);

end