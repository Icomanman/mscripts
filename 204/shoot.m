
% Shooting Method
function err = shoot(z, to_plot)
  
  % a)
  % dz = -9.8;
  % b)
  dz = -9.8 - (z/40);
  yf = 100; % final elev
  zf = 0;
  
  step = 0.25;
  lim = 50;
  i = 1;
  
  y = 0;
    while z >= zf && i <= lim
    
      if (to_plot == 1)
        plot(i, z, "*", "Color", "#0072BD", "LineWidth", 2);
        hold on;

        plot(i, y, "o", "Color", "#7E2F8E", "LineWidth", 2);
        hold on;
      end
      
      y = y + (step * z);
      z = z + (step * dz);

      i = i + 1;
    end
    
    err = (yf - y) / yf;
  
  if (to_plot == 1)  
    plot(i, z, "r*", "LineWidth", 2);
    hold on;

    plot(i, y, "ro", "LineWidth", 2);
    hold on;

    xlabel(["Steps, h: ", step]);
    ylabel("Velocity and Elevation");
    legend("Velocity, m/s", "Elevation, m");
    hold off;
  end
end