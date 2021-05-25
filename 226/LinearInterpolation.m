
function u = LinearInterpolation(k, w, zeta, step)
  
  % Forcing Function
  pt = @(t) 10 * sin(pi * t / 0.6);
  
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
  
  u = zeros(11, 1);
  u_dot = zeros(11, 1);
  u(1) = 0;
  u_dot(1) = 0;
  p = pt(0);
  i = 1;
  while (i <= 10)
    u(i + 1) = A * u(i) + B * u_dot(i) + C * p + D * pt((i) / 10);
    u_dot(i + 1) = Ap * u(i) + Bp * u_dot(i) + Cp * p + Dp * pt((i) / 10);
    i = i + 1;
    p = pt(i / 10);
  end
  
  plot(u);
  
end