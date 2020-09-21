## Copyright (C) 2019 Serhiy
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} recognizer (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-03-29

function retval = recognizer (W, X, testletter)
sum_pred = zeros(10, 1);
sum_pred(1) = sum(abs(sign(W*testletter) - X(:, 1)));
sum_pred(2) = sum(abs(sign(W*testletter) - X(:, 2)));
sum_pred(3) = sum(abs(sign(W*testletter) - X(:, 3)));
sum_pred(4) = sum(abs(sign(W*testletter) - X(:, 4)));
sum_pred(5) = sum(abs(sign(W*testletter) - X(:, 5)));
sum_pred(6) = sum(abs(sign(W*testletter) - X(:, 6)));
sum_pred(7) = sum(abs(sign(W*testletter) - X(:, 7)));
sum_pred(8) = sum(abs(sign(W*testletter) - X(:, 8)));
sum_pred(9) = sum(abs(sign(W*testletter) - X(:, 9)));
sum_pred(10) = sum(abs(sign(W*testletter) - X(:, 10)));
pred = min(sum_pred);
if pred == sum_pred(1)
  fprintf("I think its letter AI");
endif  
if pred == sum_pred(2)
  fprintf("I think its letter B");
endif
if pred == sum_pred(3)
  fprintf("I think its letter C");
endif
if pred == sum_pred(4)
  fprintf("I think its letter H");  
endif
if pred == sum_pred(5)
  fprintf("I think its letter I");  
endif
if pred == sum_pred(6)
  fprintf("I think its letter K");  
endif
if pred == sum_pred(7)
  fprintf("I think its letter L");  
endif
if pred == sum_pred(8)
  fprintf("I think its letter N");  
endif
if pred == sum_pred(9)
  fprintf("I think its letter P");  
endif
if pred == sum_pred(10)
  fprintf("I think its letter Z");  
endif
endfunction
