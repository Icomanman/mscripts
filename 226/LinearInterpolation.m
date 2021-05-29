
function u = LinearInterpolation(k, w, zeta, step)
  
  % Forcing Function
  % pt = @(s) 10 * sin(pi * s / 0.6);
  pt = @(t) 5 * sin(4.8 * pi * t);
  
  % Coefficients:
  e = exp(-zeta * w * step);
  wd = w * sqrt(1 - zeta^2);
  sine = sin(w * step);
  cosine = cos(wd * step);
  
  zr = zeta / sqrt(1 - zeta^2);
  z_diff = 1 - (2 * zeta^2);
  
  C1 = (2 * zeta) / (w * step);
  C2 = (z_diff / (wd * step)) - zr;
  C2a = -z_diff / (wd * step);
  C3 = 1 + C1;
  
  A = e * (zr * sine + cosine);
  B = e * (sine / wd);
  C = (1 / k) * (C1 + e * ((C2 * sine) - (C3 * cosine)));
  D = (1 / k) * (1 - C1 + e * ((C2a * sine) + (C1 * cosine)));
  
  Ap1 = w / sqrt(1 - zeta^2);
  Ap = -e * (Ap1 * sine);
  Bp = e * (cosine - (zr * sine));
  Cp = (1 / k) *  ((-1 / step) + e * ((Ap1 + (zr / step)) * sine + cosine / step));
  Dp = (1 / (k * step)) * (1 - e * (zr * sine + cosine));
  
  % set @ 10 sec (constant)
  lim = 10;
  n = lim / step;
  
  p = zeros(n, 1);
  t = zeros(n, 1);
  
  u = zeros(n, 1);
  u_dot = zeros(n, 1);
  
  u(1) = 0;
  u_dot(1) = 0;
  p(1) = pt(0);
  
  cutoff = 4.2;
  
  for i = 1 : n
    
    if ((i*step) > cutoff)
      p(i + 1) = 0;
    else
      p(i + 1) = pt(i * step);
    end
    
    u(i + 1) = A * u(i) + B * u_dot(i) + C * p(i) + D * p(i + 1);
    u_dot(i + 1) = Ap * u(i) + Bp * u_dot(i) + Cp * p(i) + Dp * p(i + 1);
    
    t(i) = (i - 1) * step;
    
  end
  
  t((n) + 1) = (lim * step) +  t(n);
    % "#7E2F8E" - Purple
  plot(t, u, "--", "Color", "#7E2F8E", "LineWidth", 3);
  hold on;
end