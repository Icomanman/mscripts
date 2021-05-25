function u = DirectInteg(acc, t, w, zeta)
  wd = w * sqrt(1 - zeta^2); 
  lim = length(acc);
  u = zeros(lim, 1);
  
  for i = 1 : lim
    u(i) = 9.80665 * acc(i) * exp(-zeta * w * t(i)) * sin(wd * t(i)) / wd;
  end  
  plot(t, u);
%   hold on;
%   plot(t, acc, "b");
%   hold off;
end