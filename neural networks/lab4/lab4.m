Aletter = load('aletter.txt');
Bletter = load('bletter.txt');
Cletter = load('cletter.txt');
Hletter = load('hletter.txt');
Iletter = load('iletter.txt');
Kletter = load('kletter.txt');
Lletter = load('lletter.txt');
Nletter = load('nletter.txt');
Pletter = load('pletter.txt');
Zletter = load('zletter.txt');

Testletter = load('abug.txt');  
  %%%%%%%%%%%%%%%%% WATCH SCRIPT TESTING
  %%%%%%%%%%%%%%%%% WATCH SCRIPT TESTING
  %%%%%%%%%%%%%%%%% WATCH SCRIPT TESTING
  %%%%%%%%%%%%%%%%% WATCH SCRIPT TESTING
aletter = Aletter(:);
bletter = Bletter(:);
cletter = Cletter(:);
hletter = Hletter(:);
iletter = Iletter(:);
kletter = Kletter(:);
lletter = Lletter(:);
nletter = Nletter(:);
pletter = Pletter(:);
zletter = Zletter(:);
X = [aletter bletter cletter hletter iletter kletter lletter nletter pletter zletter];
testletter = Testletter(:);
W = aletter*aletter' + bletter*bletter' + cletter*cletter' + hletter*hletter' + iletter*iletter';
W = W + kletter*kletter' + lletter*lletter' + nletter*nletter' + pletter*pletter' + zletter*zletter';
W = W./10;
%(sign(W*iletter) - iletter)';
%(sign(W*aletter) - aletter)';
testarr = zeros(20, 1);
for i = 1:20
  testarr(i) = int32(150*rand(1));
  if testarr(i) == 0
    testarr(i) = int32(150*rand(1));
  endif  
endfor
testletteri = iletter;
testlettera = aletter;
testletterp = pletter;
testlettern = nletter;
for i = 1:20
  testletteri(testarr(i)) = -testletteri(testarr(i));
  testlettera(testarr(i)) = -testlettera(testarr(i));
  testletterp(testarr(i)) = -testletterp(testarr(i));
  testlettern(testarr(i)) = -testlettern(testarr(i));
endfor
colormap('gray');
imagesc(reshape(testlettern, 15, 10));



%sum(abs(sign(W*testletteri) - iletter))
%sum(abs(sign(W*testlettera) - aletter))
%sum(abs(sign(W*testletterp) - pletter))
%sum(abs(sign(W*testlettern) - nletter))
colormap('gray');
figure(2);
imagesc(reshape(W*testlettern, 15, 10));
colormap('gray');
figure(3);
colormap('gray');
imagesc(reshape(sign(W*testlettern), 15, 10));
recognizer(W, X, testlettern)
