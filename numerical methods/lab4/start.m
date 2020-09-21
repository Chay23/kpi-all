x0 = 0.2;
y0 = 0.4;
eps = 0.00001;
x = 0.093 - sin(y0 - 0.416);
y = (cos(x0 + 0.27) - 0.362)/1.412;
x
y
while abs(y - y0) > eps || abs(x - x0) > eps || sum(abs([-x + 0.093 - sin(y - 0.416); -y + (cos(x0 + 0.27) - 0.362)/1.412])) > eps
 
    x0 = x;
    y0 = y;
    x = 0.093 - sin(y - 0.416);
    y = (cos(x + 0.27) - 0.362)/1.412;
    fprintf('difference x = %d\n ', abs(x - x0));
    fprintf('difference y = %d\n ', abs(y - y0));
    fprintf('system difference = %d\n', sum(abs([-x + 0.093 - sin(y - 0.416); -y + (cos(x0 + 0.27) - 0.362)/1.412])));

endwhile
x
y


