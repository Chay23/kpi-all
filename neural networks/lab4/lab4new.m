Ax = load('aletter.txt');
Bx = load('bletter.txt');
Cx = load('cletter.txt');
Hx = load('hletter.txt');
Ix = load('iletter.txt');
Kx = load('kletter.txt');
Lx = load('lletter.txt');
Nx = load('nletter.txt');
Px = load('pletter.txt');
Zx = load('zletter.txt');
%%%%%%%%%%%%%%%%% WATCH SCRIPT TESTING
%%%%%%%%%%%%%%%%% WATCH SCRIPT TESTING
%%%%%%%%%%%%%%%%% WATCH SCRIPT TESTING
%%%%%%%%%%%%%%%%% WATCH SCRIPT TESTING
abug = load('abug.txt');
ibug = load('ibug.txt');
kbug = load('kbug.txt');
nbug = load('nbug.txt');
pbug = load('pbug.txt');
zbug = load('zbug.txt');

X = [Ax(:), Bx(:), Cx(:), Hx(:), Ix(:), Kx(:), Lx(:), Nx(:), Px(:), Zx(:)];
[n, m] = size(X);
W = zeros(n, n);
for i = 1:m  %% set wages
  W += X(:, i)*(X(:, i))'; 
endfor
for i = 1:n
  %W(i, i) = 0; %set diagonal equal 0
endfor  
for i = 1:n/10  %%choose inverse position
  testarr(i) = int32(n*rand(1));
  while testarr(i) == 0
    testarr(i) = int32(n*rand(1));
  endwhile
endfor
X_test = X;  %%matrix for test
for j = 1:n/10
  for i = 1:m
    X_test(testarr(j), i) = -X_test(testarr(j), i); %%change pixels in such positions  
  endfor
endfor
%Distance = zeros(n, m);
sum(abs(sign(W*X_test(:, 5)) - X(:, 5)))





