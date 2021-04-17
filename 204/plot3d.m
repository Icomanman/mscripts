
x = [-10 : 0.5 : 10];
y = [-10 : 0.5 : 10];
z = [-10 : 0.5 : 10];

f0 = @(z) (z * 0);
f = @(z) (-2 - z);
f2 = @(z) (-2 ./ z);
f3 = @(z) (6 - z^2)^0.5;

y = (-2 - z);
y2 =(-2 ./ z);
y3 = (6 - (z.^2)).^0.5;

% plot(z, y, "Linewidth", 1.5);
% hold on
% plot(z, y2, "Linewidth", 1);
% hold on
% % z = [-(6)^0.5 : 0.1 : (6)^0.5];
% plot(z, y3, "Linewidth", 1);

hold off

g = @(y, z) (-2 - y - z);
plot3(f0(x), f(y), f(z), "Linewidth", 1.5);
hold on
plot3(f0(x), f2(y), f2(z),"Linewidth", 1.5);
hold on
grid on
