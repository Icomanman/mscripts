function [u, u_dot] = DirectInteg(acc, t)
  
  n = length(acc);
  u = zeros(n, 1);
  u_dot = zeros(n, 1);
  
  step = t(2) - t(1);
  
  for i = 1 : n
    
    u_dot(i) = 1;
    
  end  
  
  for i = 1 : n
    
    u(i) = 1;
    
  end  
  
end