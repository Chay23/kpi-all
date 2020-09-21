x_bin = zeros(8, 8);
x_new = zeros(8, 8);
con = f(253);
[n, m] = size(x_bin);
f_x = zeros(m, 1);
finale = zeros(10, 1);
for k = 1:20
for i = 1:m
  for j = 1:n
    x_bin(i, j) = int32(rand(1)); %init 1st population in binary
  endfor
endfor
x = zeros(m, 1);
for i = 1:m
  for j = 0:n-1
    x(i) += x_bin(i, j+1)*2^(n - 1 - j); %transform every member in decimal
  endfor
endfor
f_x = f(x); %function value
f_norm = zeros(size(f_x));
for i = 1:m
  f_norm(i) = f_x(i)/sum(f_x); %quality criteria
endfor
f_distr = zeros(m, 1);
f_distr(1) = f_norm(1);
for i = 2:m
  f_distr(i) = f_distr(i-1) + f_norm(i); %distribute 0-1 due to func value of its members
endfor
x_2_ind = zeros(m, 1);
for i = 1:m
  x_2_ind(i) = rand(1); %8 random numbers U(0, 1) to form new population
endfor  
index = zeros(m, 1);
for i = 1:m
  for j = 1:m-1
    if (x_2_ind(i) > f_distr(j) && x_2_ind(i) <= f_distr(j+1)) %find indexes of new population
      index(i) = j+1;
    endif  
  endfor
endfor
for i = 1:m
  if index(i) == 0
    index(i) = 1;
  endif
endfor  
for i = 1:m
  x_new(i, :) = x_bin(index(i), :);
endfor
for i = 1:m/2
  if rand(1) < 0.75
    border = 0;
    while border == 0
      border = int32(8*rand(1));
    endwhile
    x_new(2*i, 1:border) = x_new(2*i - 1, 1:border);
    x_new(2*i - 1, border:m) = x_new(2*i, border:m);
  endif
endfor
x = zeros(m, 1);
for i = 1:m
  for j = 0:n-1
    x(i) += x_new(i, j+1)*2^(n - 1 - j); %transform every member in decimal
  endfor
endfor
f_x = f(x); %function value
finale(k) = max(f_x);  
endfor
max(finale)
x1 = 0:0.1:255;
y1 = f(x1);
figure(3, 'position',[100,100,1500,500]);
plot(x1, y1, 'r');
xlabel("(x^3 + 15)/256");
hold on;
plot (max(finale), "^", "markersize", 20)
hold on;
x2 = zeros(size(y1));
for i = 1:max(size(y1))
  y1(i) = max(finale);
  x2(i) = f(255);
endfor

plot(x1, x2);
hold on;
pause(5);
plot(x1, y1, 'm');