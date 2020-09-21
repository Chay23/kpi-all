x = 0.5:0.1:1;
y = func_val(x);
%plot(x, y);
x_test = 0.5:0.01:1;
x_test1 = 0.5:0.01:1;
[m, n] = size(x_test);
[m1, n1] = size(x_test1);

err_langr = zeros(1, n);
err_newt = zeros(1, n);
err_newt_b = zeros(1, n);
err_spline = zeros(1, n1);
magor_t = zeros(1, n);


[m, n] = size(x_test);
%plot(x, y);
for i = 1:n
   z_lagr = lagrange(x, y, x_test(i));
   z0 = func_val(x_test(i));
   err_langr(i) = abs(z_lagr - z0);
endfor

for i = 1:n
  z_new_f = newton_f(x_test(i), x, y);
  z0 = func_val(x_test(i));
  err_newt(i) = abs(z_new_f - z0);
endfor
for i = 1:n1
  z_spline = cub_spline(x_test1(i), x, y);
  z0 = func_val(x_test1(i));
  err_spline(i) = abs(z_spline - z0);
endfor                        
for i = 1:n
  z_spline = newton_b(x_test(i), x, y);
  z0 = func_val(x_test(i));
  err_newt_b(i) = abs(z_spline - z0);
endfor
for i = 1:n
  magor_t(i) = major(x, x_test(i));
endfor
err_langr;
err_newt_b;
err_spline;
plot (x_test, err_langr, 'b');
hold on;
plot (x_test, err_newt, 'r');
hold on;
plot (x_test, err_newt_b, 'y');
hold on;
plot (x_test1, f(err_spline), 'm');
hold on; 
plot(x_test, magor_t);
