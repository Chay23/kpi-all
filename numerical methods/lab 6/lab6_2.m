A = [7.25 0.92 1.15 1.105; 0.92 3.17 1.3 0.16; 1.15 1.3 6.43 2.1; 1.105 0.16 2.1 5.11];
A1 = A;
A2 = zeros(4, 4);
[L1, U1] = lu(A1);
while norm(A2-A1, "fro") > 0.00001
  A2 = U1*L1;
  [L1, U1] = lu(A2);
  A1 = U1*L1;
  norm(A2-A1, "fro");
endwhile
eigenval = zeros(4, 1);
for i = 1:4
  eigenval(i) = U1(i, i);
endfor
A2 = U1;
eigenvect = zeros(4, 4);
A1 = A - eigenval(1)*eye(4, 4);
A1 = [A - eigenval(1)*eye(4, 4), zeros(4, 1)];
A2 = [A - eigenval(2)*eye(4, 4), zeros(4, 1)];
A3 = [A - eigenval(3)*eye(4, 4), zeros(4, 1)];
A4 = [A - eigenval(4)*eye(4, 4), zeros(4, 1)];
[x1, A_1, deter1] = new_gauss(A1);
[x2, A_2, deter2] = new_gauss(A2);
[x3, A_3, deter3] = new_gauss(A3);
[x4, A_4, deter4] = new_gauss(A4);
save "lab6_2.txt" eigenval;
save ("-append", "lab6_2.txt", "x1");
save ("-append", "lab6_2.txt", "x2");
save ("-append", "lab6_2.txt", "x3");
save ("-append", "lab6_2.txt", "x4");
diff1 =  A*x1 - eigenval(1)*x1;
diff2 =  A*x2 - eigenval(2)*x2;
diff3 =  A*x3 - eigenval(3)*x3;
diff4 =  A*x4 - eigenval(4)*x4;

save ("-append", "lab6_2.txt", "diff1");
save ("-append", "lab6_2.txt", "diff2");
save ("-append", "lab6_2.txt", "diff3");
save ("-append", "lab6_2.txt", "diff4");



