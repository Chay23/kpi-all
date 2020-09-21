YY = load('wfile.txt');
XX = reshape(YY, 5, 5, 150);
xa = load('aletter.txt');
xb = load('bletter.txt');
xc = load('cletter.txt');
xh = load('hletter.txt');
xi = load('iletter.txt');
xk = load('kletter.txt');
xl = load('lletter.txt');
xn = load('nletter.txt');
xp = load('pletter.txt');
xz = load('zletter.txt');
abug = load('abug.txt');
ibug = load('ibug.txt');
kbug = load('kbug.txt');
nbug = load('nbug.txt');
pbug = load('pbug.txt');
zbug = load('zbug.txt');
%colormap('gray');
%imagesc(abug);
%hold off;
%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;
%imagesc(ibug);
%hold off;

%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;


colormap('winter');
X = [xa(:), xb(:), xc(:), xh(:), xi(:), xk(:), xn(:), xp(:), xz(:)];
XXX = [abug(:), ibug(:), kbug(:), nbug(:), pbug(:), zbug(:)];
Xtest = [abug(:), ibug(:), kbug(:), nbug(:), pbug(:), zbug(:)];
dim = 25;
test_comp = zeros(5, 5);
mat_for_plot = zeros(5, 5, 9);
mat_for_test = zeros(5, 5, 6);
comparator = zeros(5, 5);
 for ch = 1:9
  for i = 1:sqrt(dim)
    for j = 1:sqrt(dim)
      comparator(i, j) = norm(X(:, ch) - reshape(XX(i, j, :), 150, 1));
    endfor
  endfor
  mat_for_plot(:, :, ch) = comparator;
  %comparator
  %imagesc(comparator);
  ch
endfor 
for i = 1:10
  %imagesc(mat_for_plot(:, :, i));
endfor  
for ch = 1:6
  for i = 1:sqrt(dim)
    for j = 1:sqrt(dim)
      test_comp(i, j) = norm(Xtest(:, ch) - reshape(XX(i, j, :), 150, 1));
    endfor
  endfor
  mat_for_test(:, :, ch) = test_comp;
  %test_comp
  %ch
endfor 

  winner = min(min(comparator));
  [ii, ij] = find(comparator == winner);
  #plotik(mat_for_test, 5, X);
  %imagesc(mat_for_test(:, :, 3));

 