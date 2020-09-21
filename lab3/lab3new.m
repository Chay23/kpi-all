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
[n, m] = size(X);
eta = 0.1;
eta0 = 0.1;
sigma = 3;
sigma0 = 3;
tau2 = 1000;
tau1 = 1000/log(sigma);
dim = 25;
comparer = zeros(sqrt(dim), sqrt(dim));
W = rand(sqrt(dim), sqrt(dim), n);
for k = 1:1000 + 500*dim
  ch = int32(m*rand(1));
  while ch == 0
    ch = int32(m*rand(1));
  endwhile
  for i = 1:sqrt(dim)
    for j = 1:sqrt(dim)
      comparer(i, j) = norm(X(:, ch) - reshape(W(i, j, :), n, 1));
    endfor
  endfor
  winner = min(min(comparer));
  [ii, ij] = find(comparer == winner);
  for i = 1:sqrt(dim)
    for j = 1:sqrt(dim)
      deltaw = eta*exp(-((i - ii)^2 + (j - ij)^2)/(2*sigma^2))*(X(:, ch) - reshape(W(i, j, :), n, 1));
      W(i, j, :) += reshape(deltaw, 1, 1, 150);
    endfor
  endfor
  if k < 1000
  sigma = sigma0*exp(-k/tau1);
  endif
  if eta > 0.01
  eta = eta0*exp(-k/tau2);  
  endif
  k  
endfor  
save filewithw.txt W;