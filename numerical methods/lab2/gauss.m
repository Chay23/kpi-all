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
## @deftypefn {} {@var{retval} =} gauss (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-02-20

function [x, Aminus1, determinant] = gauss (Aplus);
 n = size(Aplus);
 x = zeros(n(1), 1);
 k = 0;
 Anew = [Aplus(:, 1:n(2) - 1), eye(size(Aplus(:, 1:n(2) - 1)))];
for j = 1 : n(2)-1
  k++;
  for i = k : n(1) - 1 
   Aplus(i+1, :) = Aplus (i+1, :) + (-(Aplus(i + 1, j)/Aplus(j, j)))*Aplus(k, :);
   Anew(i+1, :) = Anew (i+1, :) + (-(Anew(i + 1, j)/Anew(j, j)))*Anew(k, :);
   Anew;
 endfor
endfor
Aplus
determinant = 1;
for i = 1:n(1)
  determinant *= Aplus(i, i);
  if determinant == 0
    fprintf('problem with matrix'); 
  endif  
endfor

x(n(1)) = Aplus(n(1), n(2))/Aplus(n(1), n(2) - 1);
Aminus = Aplus(:, 1:n(2)-1);
for i = 1:n(1) - 1
  x(n(1) - i) = (1/Aplus(n(1) - i, n(1) - i))*(Aplus(n(1) - i, n(2)) - Aminus(n(1)-i, :)*x);
endfor
  j = n(2) - 1;
  k = 0;
  while j > 0
    k++;
    for i = k:n(1) - 1
      Anew(n(1) - i, :) =  Anew(n(1) - i, :) + (-(Anew(n(1) - i, j)/Anew(j, j)))*Anew(j, :);
      Anew;
    endfor  
    j--;
  endwhile
  for i = 1:n(1)
    Anew(i, :) = Anew(i, :)/Anew(i, i);
  endfor  
  sizea = size(Anew);
  Aminus1 = Anew(:, n(2):sizea(2));
     endfunction
