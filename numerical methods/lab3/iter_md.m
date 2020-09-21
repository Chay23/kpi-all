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
## @deftypefn {} {@var{retval} =} iter_md (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-03-03

function x = iter_md (A, f, eps)
n = size(A);
x = zeros(n(1), 1);
d = zeros(n(1), 1);
B = zeros(n);

for i = 1:n(1)
  d(i) = f(i)/A(i, i);
  for j = 1:n(2)
    B(i, j) = - (A(i, j)/A(i, i));
  endfor
  B(i, i) = 0;
endfor

x = d;
fprintf('f - A*x  = %d %d %d %d %d \n', f - A*x);


while sum(abs(f - A*x)) > eps
  x = d + B*x;
  fprintf('Another one x =%d; %d; %d; %d; %d; \n ',x);
  e = sum(abs(f - A*x));
  fprintf('error = %d \n',e);
  fprintf('f - A*x  = %d; %d; %d; %d; %d; \n', f - A*x);
  fprintf('NEXT ITER\n');
endwhile
 
endfunction
