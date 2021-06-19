
% Shooting Method recursion and iteration
function [z, err0] = loopShoot(z0, z1)
  
  lim = 100;
  i = 1;
  err0 = shoot(z0, 0);
  err1 = shoot(z1, 0);
  tol = 10e-6;
  
  z = z1 - (err1 * ((z0 - z1)/(err0 - err1)));
  z0 = z1;
  z1 = z;
  while i <= lim && abs(err0) < tol
    
    z = z1 - (err1 * ((z0 - z1)/(err0 - err1)));
    z0 = z1;
    z1 = z;
    
%     plot(i, z, "o");
    i = 1 + i;
  end
  
end