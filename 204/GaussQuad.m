
function area = GaussQuad(fn)
  n = 2; % constant for this problem
  % coefficients, from the lookup table
  w = [0.5555555556, 0.8888888889, 0.5555555556];
  % roots, from the lookup table
  r = [0.7745966692, 0, -0.7745966692];
  % Adjusted to interval: 0, 0.5
  t = 0.25;
  
  fi = 0;
  for i = 1 : (n + 1)
    x = (t * r(i)) + t;
    fi = fi + (w(i) * fn(x) * t);
  end
  area = fi;
end