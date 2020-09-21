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
X = [xa(:), xb(:), xc(:), xh(:), xi(:), xk(:), xl(:), xn(:), xp(:), xz(:)];
eta = 0.1;
tau2 = 1000;
dim = 25;
sigma = 3; %dim
tau1 = 1000/log(sigma);

W = rand(sqrt(dim), sqrt(dim), 150);
comparer = zeros(sqrt(dim), sqrt(dim));
deltaw = zeros(sqrt(dim), sqrt(dim));
temp = zeros(150, 1);

for k = 1:1000
  ch = int32(10*rand(1));
  if ch == 0
    ch = 1;
  endif  
  for i = 1:int32(sqrt(dim))
    for j = 1:int32(sqrt(dim))
      for z = 1:150
        temp(z, 1) = W(i, j, z);
      endfor  
    comparer(i, j) = norm(X(:, ch) - temp);
    endfor
  endfor
  winner = min(comparer);
  [iwin, jwin] = find(comparer == winner);
  for i = 1:int32(sqrt(dim))
    for j = 1:int32(sqrt(dim))
      deltaw(i, j) = expadv(W(iwin, jwin, :), W(i, j, :), sigma);
      W(i, j, :) += eta*deltaw(i, j);
    endfor
  endfor 
  if sigma > 0.001 && k < 1000
    sigma *= exp(-(k-1)/tau1);
    k/100
  endif
  if eta > 0.01 && k < 1000
    k/1000
    eta *= exp(-(k-1)/tau2);
  endif  
  k
endfor  
Abug = load('abug.txt');
abug = Abug(:);
save filewithw.txt W;


  
    
