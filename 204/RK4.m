
% Fourth-Order Runge-Kutta
function RK4()
  
  interval = [0 20];
  n = 100;
  step = (interval(2) - interval(1)) / n;
  
  t = (0 : step : interval(2))';
  y = zeros(n, 1);
  z = zeros(n, 1);
  
  y(1) = 0;
  z(1) = 0;
  
  dz = @(t, z) cos(t) + sin(z);
  dy = @(t, y, z) sin(t) + cos(y) + sin(z);
  
  for i = 1 : n
    % z
    kz1 = dz(t(i), z(i));
    kz2 = dz(t(i) + (0.5 * step), z(i) + (step * 0.5 * kz1));
    kz3 = dz(t(i) + (0.5 * step), z(i) + (step * 0.5 * kz2));
    kz4 = dz(t(i) + step, z(i) + (step * kz3));
    
    Tz4 = (step / 6) * (kz1 + kz2 + kz3 + kz4);
    z(i + 1) = z(1) + Tz4;
    
    % y
    ky1 = dy(t(i), y(i), z(i));
    ky2 = dy(t(i) + (0.5 * step), y(i) + (step * 0.5 * ky1), z(i));
    ky3 = dy(t(i) + (0.5 * step), y(i) + (step * 0.5 * ky2), z(i));
    ky4 = dy(t(i) + step, y(i) + (step * ky3), z(i));
    
    Ty4 = (step / 6) * (ky1 + ky2 + ky3 + ky4);
    y(i + 1) = y(1) + Ty4;
    
  end
  
  plot(t, y, "--" ,"LineWidth", 2);
  hold on;
  plot(t, z, "LineWidth", 1.5);
  xlabel("t");
  ylabel("Function Values: y and z");
  legend("y Values", "z Values");
  hold off;
  
end