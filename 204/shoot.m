
% Shooting Method
function z = shoot()
  
  dz = -9.8;
  yf = 100; % final elev
  zf = 0;
  
  step = 0.25;
  lim = 100;
  i = 1;
  
  y = 0;
  z = 43; % init guess
  while z >= zf && i <= lim
   
    plot(i, z, "b*", "LineWidth", 1.5);
    hold on;
    
    plot(i, y, "ro", "LineWidth", 1.5);
    hold on;
    
    y = y + (step * z);
    z = z + (step * dz);
    
    i = i + 1;
  end
  
%   plot(i, z, "b*", "LineWidth", 1.5);
%   hold on;
%     
%   plot(i, y, "ro", "LineWidth", 1.5);
%   hold on;
    
  xlabel(["Steps, h: ", step]);
  ylabel("Velocity and Elevation");
  legend("Velocity, m/s", "Elevation, m");
  hold off;
  
end