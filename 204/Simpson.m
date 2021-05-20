
% fn = function handle - integrand
% interval
% n = no. of subdivisions

function area = Simpson(fn, interval, n)
  k = log(n) / log(2);
  
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
  n0 = 2^(k -1);
  T0 = Trap(fn, interval, n0);
  T = Trap(fn, interval, n);
  
  area = T + ((T - T0) / 3);
  
end