
% Gutenberg-Richter

R = 0.757;

Eq = zeros(6,1); 
% Eq is the array of the number of earthquakes with the ff indices:
% 1 - M < 3.5
% 2 - 3.5 < M < 4.5
% 3 - 4.5 < M < 5.5
% 4 - 5.5 < M < 6.5
% 5 - 6.5 < M < 7.5
% 6 - M >= 7.5

% assign the numbers based on the given parameters:
Eq(1) = 35000 + 2000 * R;
Eq(2) = 4400 + 300 * R;
Eq(3) = 300 + 20 * R;
Eq(4) = 40 + 4 * R;
Eq(5) = 3 + 1.5 * R;
Eq(6) = 0.7 + R;

% Total number divided by the period considered:
lambda = Eq ./ 400;

% vector of magnitudes from 2.5 to 7.5:
m = linspace(2.5, 7.5, 6)';

% plot lambda vs m:
semilogy(m, lambda, "*", "Linewidth", 2);
hold on;
grid on;
xlabel("Magnitude, m");
ylabel("Annual Rate of Exceedance, \bf \lambda_{m}");

% solving for the regression function by converting the vectors 
% into their respective matrix forms: y = a - bm
M = ones(6, 2);
M(:,2) = m;

B = (lambda \ M);
a = B(1);
b = B(2);
fprintf("a = %f, b = %f\n", a, b);
% plot the regression line:
fplot(@(m) 10^(a - b.*m), [2.5, 7.5], "Linewidth", 2);
hold off;
