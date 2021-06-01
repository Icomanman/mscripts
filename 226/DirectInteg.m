function peaks = DirectInteg(acc, t)
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

  acc_max = max(acc);
  acc_min = min(acc);
  u_dot_max = max(u_dot);
  u_dot_min = min(u_dot);
  u_max = max(u);
  u_min = min(u);
  
  fprintf("Min acc: %f at %f. \n", acc_min, t(acc == acc_min));
  fprintf("Max acc: %f at %f. \n", acc_max, t(acc == acc_max));
  
  fprintf("Min v: %f at %f. \n", u_dot_min, t(u_dot == u_dot_min));
  fprintf("Max v: %f at %f. \n", u_dot_max, t(u_dot == u_dot_max));
  
  fprintf("Min u: %f at %f. \n", u_min, t(u == u_min));
  fprintf("Max u: %f at %f. \n", u_max, t(u == u_max));
  
  peaks = [ max(abs(acc_min), acc_max),...
            max(abs(u_dot_min), u_dot_max),...
            max(abs(u_min), u_max)];
  
%   plot(t, u_dot, "LineWidth", 1.5);
%   grid on;
%   xlim([0 20]);
%   ylim([-30 30]);

end