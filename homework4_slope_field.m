syms x y 

dydt(x,y) = -y + (5*x.^2)/(x.^2 + 4);
dxdt(x,y) = x - y;

[gridX gridY] = meshgrid(0:0.2:5);
evalX = eval(dxdt(gridX, gridY));
evalY = eval(dydt(gridX, gridY));

x = 0:0.2:5;
yEqualsXLine = x;

gCurve = (5 * x.^2) ./ (x.^2 + 4);

figure(1)
hold on
plot(x, yEqualsXLine)
plot(x, gCurve)
quiver(gridX, gridY, evalX, evalY)

hold off