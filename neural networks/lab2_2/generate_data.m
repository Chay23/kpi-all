s = 0:0.01:0.99;
t = sin(s);
%plot(s, t);
k = zeros(100, 1);
k = rand(100, 1);
m = zeros(100, 1);
m = rand(100, 1);
X = [k, m, zeros(100, 1)];
for i = 1:100
  if m(i) > sin(k(i)) 
    X(i, 3) = 0;
  else 
    X(i, 3) = 1;
 endif 
endfor
X(:, 3);
figure; hold on; 
pos = find(X(:, 3) == 1);
neg = find(X(:, 3) == 0);
plot(X(pos, 1), X(pos, 2), 'o', 'LineWidth', 2, 'MarkerSize', 5);
plot(X(neg, 1), X(neg, 2), '^', 'MarkerFaceColor', 'y', 'MarkerSize', 5);
plot(s, t, "m");



y = X(:, 3);
X = X(:, 1:2);
[n, m] = size(y);
eps = 0.00000001;
sigma = 1/sqrt(2*n);
eta = 0.15;
Phi = zeros(n, n);
w = rand(n, 1);
for i = 1:n
  for j = 1:n
    Phi(i, j) = rbfvect(X(i, :), X(j, :), sigma);
  endfor
endfor  


yvyx = Phi*w;
E = (1/2)*sum((yvyx - y).^2);
delta = zeros(n, 1);
delta = y - yvyx;
deltai = zeros(n, 1);
k = 1;
while k == 1
  for i = 1:n
    deltai = delta*sum(Phi(:, i));
  endfor
  if E < eps
    k = 0;
    break;
  endif
  w = w - eta*deltai;
  yvyx = Phi*w;
  delta = yvyx - y;
  E = (1/2)*sum(delta.^2)
endwhile
w;