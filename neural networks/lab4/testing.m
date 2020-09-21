A = load('aletter.txt');
B = load('bletter.txt');
C = load('cletter.txt');
H = load('hletter.txt');
I = load('iletter.txt');
K = load('kletter.txt');
a = A(:);
b = B(:);
c = C(:);
h = H(:);
i = I(:);
k = K(:);
X = [a b c h i k];
[n, m] = size(X);
W = zeros(n, n);
for j = 1:m
  W += X(:, j)*(X(:, j))';
endfor
for j = 1:n
  W(j, j) = 0;
endfor

testarr = zeros(20, 1);
for j = 1:20
  testarr(j) = int32(n*rand(1));
  while testarr(j) == 0
    testarr(j) = int32(n*rand(1));
  endwhile  
endfor
a_test = a;
b_test = b;
c_test = c;%% X_test = X
h_test = h;
i_test = i;
k_test = k;
for j = 1:20
  a_test(testarr(j)) = -a_test(testarr(j));
  b_test(testarr(j)) = -b_test(testarr(j));
  c_test(testarr(j)) = -c_test(testarr(j));
  h_test(testarr(j)) = -h_test(testarr(j));
  i_test(testarr(j)) = -i_test(testarr(j));
  k_test(testarr(j)) = -k_test(testarr(j));
endfor
X_test = [a_test b_test c_test h_test i_test k_test];
%for j = 1:m
%  colormap('gray');
%imagesc(-reshape(X_test(:, j), 15, 10));  %% display all picture
%  colormap('gray');%%%%%%%%%%%%%%comment if nececary
%  pause;
%endfor  
y_a = sign(W*a_test);
y_b = sign(W*b_test);
y_c = sign(W*c_test);
y_h = sign(W*h_test); %%for j =1:m
y_i = sign(W*i_test); %%Y_test(:, j) = sign(W*X_test(:, j)
y_k = sign(W*k_test); %% endfor
sum_a = sum(abs(y_a - a))
sum_b = sum(abs(y_b - b))  %% sum_Y = zeros(m, 1)
sum_c = sum(abs(y_c - c))  %% for j = 1:m
sum_h = sum(abs(y_h - h))  %% sum_Y(j) = sum(abs(Y_test(:, j) - X(:, j)))
sum_i = sum(abs(y_i - i))  %% endfor
sum_k = sum(abs(y_k - k))

plot_letter(b_test, y_b) %%%%%TO SHOW CALL PLOT_LETTER(LET_TEST, Y_LET)