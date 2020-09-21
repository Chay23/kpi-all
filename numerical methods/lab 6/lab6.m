A = [7.25 0.92 1.15 1.105; 0.92 3.17 1.3 0.16; 1.15 1.3 6.43 2.1; 1.105 0.16 2.1 5.11];
eigenmax = 0;
eigenmin = 0;
x = rand(4, 1);
ksi = A*x;
lambda = vecnorm(ksi)/vecnorm(x);
x = ksi./vecnorm(ksi);
iter = 0;
while (vecnorm(A*x - lambda*x) > 0.00001) && (vecnorm(A*x + lambda*x) > 0.00001)
  ksi = A*x;
  lambda = vecnorm(ksi)/vecnorm(x);
  x = ksi./vecnorm(ksi);
  iter++;
endwhile

if vecnorm(A*x - lambda*x) < 0.00001
  %fprintf("max eigenvalue is %d and eigenvector is %d %d %d %d \n", lambda, x)
  eigenmax = lambda;
else %fprintf("max eigenvalue is %d and eigenvector is %d %d %d %d \n", -lambda, x)
  eigenmax = -lambda;
endif
save "lab6.txt" eigenmax;
save ("-append", "lab6.txt", "x");
diff_vect = A*x - eigenmax*x;
save ("-append", "lab6.txt", "diff_vect");

%fprintf("diff vector is %d %d %d %d\n", A*x - eigenmax*x)
B = A - eigenmax*eye(4);
xb = rand(4, 1);
ksib = B*xb;
lambdab = vecnorm(ksib)/vecnorm(xb);
xb = ksib./vecnorm(ksib);
iter2 = 0;
while (vecnorm(B*xb - lambdab*xb) > 0.00001) && (vecnorm(B*xb + lambdab*xb) > 0.00001)
  ksib = B*xb;
  lambdab = vecnorm(ksib)/vecnorm(xb);
  xb = ksib./vecnorm(ksib);
  iter2++;
endwhile
if vecnorm(B*xb - lambdab*xb) < 0.00001
  eigenmin = lambdab;
else eigenmin = -lambdab;
endif
%fprintf("min eigenvalue is %d and eigenvector is %d %d %d %d \n", eigenmax + eigenmin, xb)
eigenmin_a = eigenmax + eigenmin;
%fprintf("diff vector is %d %d %d %d\n", A*xb - eigenmin_a*xb)
diff_vect2 = A*xb - eigenmin_a*xb;
save ("-append", "lab6.txt", "xb");
save ("-append", "lab6.txt", "eigenmin_a");
save ("-append", "lab6.txt", "diff_vect2");
