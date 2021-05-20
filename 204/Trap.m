
% fn = function handle - integrand
% interval
% n = no. of subdivisions

function area = Trap(fn, interval, n)
  diff = 0;
  
  if (length(interval) ~= 2)
    fprintf("Please input a valid interval\n");
    area = NaN;
    return;
  else
    diff = (interval(2) - interval(1));
    if(diff <= 0 || isnan(diff))
      fprintf("Please input a valid interval\n");
      area = NaN;
      return;
    end
  end
  a = interval(1);
  b = interval(2);
  x = diff / n;
  fa = fn(a);
  fb = fn(b);
  fi = 0;
  
  for i = 1 : (n - 1)
    fi = fi + fn(a + (x * i));
  end
  
  area = (0.5 * x) * (fa + (2 * fi) + fb);
  
end