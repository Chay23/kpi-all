x0 = 0.5;
y0 = -0.5;
X0 = [x0; y0];
X = zeros(2, 1) + 1;
eps = 0.00001;
while (abs(X - X0) > [eps; eps] && abs(fpol(X)) > [eps; eps]) 
  while sum(abs(fpol(X0))) > eps
  X0 = X;
  X = X0 - pinv(df(X0))*fpol(X0);
 % sum(abs(fpol(X0)))
  fprintf('fpol(X0) = %d ', sum(abs(fpol(X0))));
  fprintf('X - X0 = %d\n %d ', X - X0);
  fprintf('NEXT X = %d\n %d\n', X); 
  endwhile
endwhile
X