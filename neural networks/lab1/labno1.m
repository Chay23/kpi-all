data = load('data09.txt');
Xt = data(76:100, [1, 2]);
yt = data(76:100, 3);
Xn = data(1:75, [1, 2]);
[n, m] = size(Xn);
x1 = Xn(:, 1);
x2 = Xn(:, 2);
y = data(1:75, 3);
plotdata(Xn, y);
alpha = 5;
eta = 0.1;
b0 = 1;
eps = 0.0001;
w = rand(3, 1);
iter = 1;
k = 1;
E = zeros(1, 20);
[m, noepoch] = size(E);
e = 0;
for l = 1:noepoch
%%while k == 1
e = 0;
for i = 1:75
  z = w(1) + x1(i)*w(2) + x2(i)*w(3); 
  e += (1/2)*((sigmoid(z, alpha) - y(i))^2);
  delta = -(y(i) - sigmoid(z, alpha));
  delta1 = delta*alpha*(1 - sigmoid(z, alpha))*sigmoid(z, alpha)*x1(i);
  delta2 = delta*alpha*(1 - sigmoid(z, alpha))*sigmoid(z, alpha)*x2(i);
  delta3 = delta*alpha*(1 - sigmoid(z, alpha))*sigmoid(z, alpha);
  
  if (abs(delta1) < eps && abs(delta2) < eps && abs(delta3) < eps) && e < eps
    k = 0;
    break;  
  endif  
  
  w(2) = w(2) - eta*delta1;
  w(3) = w(3) - eta*delta2;
  w(1) = w(1) - eta*delta3;
endfor  
E(l) = e;
endfor
p = 1:noepoch;
plot(p, E);
%%endwhile
plotw(Xn, y, w, Xt, yt);
