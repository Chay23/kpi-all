A = [ 7.25 0.92 1.15 1.105 -1.11; 
     1.28 3.17 1.3 -1.63 -1.68;
     0.79 -2.46 6.43 2.1 -1.217;
     1.375 0.16 2.1 5.11 18;
     1.59 1.02 1.483 -9 18];
ans = [2.1 1.08 -3.87 0 -2.43]' ;
Aplus = [A, ans];
[x, Aminus1, determinant] = gauss(Aplus)    
Answer = A*x
dif = ans - Answer
Aminus1
B = A*Aminus1