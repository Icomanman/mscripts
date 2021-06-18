
% Forward and Backward Euler Methods
function mse = EulerMethod()

	k = -3e-11;
	tf = 200;
	ti = 0;
	step = 0.05;
	n = (tf - ti) / step;
	t = (0 : step : tf)';
	T = zeros(n + 1, 1);
  F = zeros(n + 1, 1);
  B = zeros(n + 1, 1);

	temp_init = 1000;
	temp_final = 300;

	T(1) = temp_init;
	T(n) = temp_final;
  
  % Forward: 
	for i = 1 : n
		dT = k * ((T(i)^4) - (temp_final^4));
		T(i + 1) = T(i) + dT * step;
  end
  F = T;
	plot(t, T, "LineWidth", 1);
  hold on;
  
  % Backward:
  dT = k * ((T(1)^4) - (temp_final^4));
  T(2) = T(1) - (dT * step);
	for i = 1 : n
     dT = k * ((T(i + 1)^4) - (temp_final^4));
     T(i + 1) = T(i) + dT * step;
  end
  B = T;
	plot(t, T, "--", "LineWidth", 2);
  xlabel("Time, t in s");
  ylabel("Temp, T in K");
  legend("Forward", "Backward");
  hold off;

  mse = sum((F - B).^2) / n;
  
end