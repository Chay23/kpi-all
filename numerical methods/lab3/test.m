A = [ 7.25 0.92 1.15 1.105 -1.11; 
     1.28 3.17 1.3 -1.63 -1.68;
     0.79 -2.46 6.43 2.1 -1.217;
     1.375 0.16 2.1 5.11 18;
     1.59 1.02 1.483 -9 18];
ans = [2.1 1.08 -3.87 0 -2.43]' ;
Aplus = [A, ans];
n = size(Aplus);
 x = zeros(n(1), 1);
 k = 0;
 for j = 1 : n(2)-1
  k++;
  for i = k : n(1) - 1 
   Aplus(i+1, :) = Aplus (i+1, :) + (-(Aplus(i + 1, j)/Aplus(j, j)))*Aplus(k, :);
  
 endfor
endfor
Aplus(2, :) = Aplus(2, :) + 0.1*Aplus(4, :);
Aplus(4, :) = Aplus(4, :) - 0.3*Aplus(5, :);
A
A = Aplus(:, 1:5);
f = Aplus(:, 6);
A
eps = 0.00001;
x = iter_md(A, f, eps)
A
f - A*x
A*x;
f;