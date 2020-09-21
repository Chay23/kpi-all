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
## @deftypefn {} {@var{retval} =} newton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-04-20

function sum1 = newton_f (x0, x, y)
sum1 = 0;
[m, n] = size(y);
F = 0;
den = 0;
for i = 1:n
  F = 0;
  for j = 1:i
    den = 1;
    for k = 1:i 
      if k != j
        den *= (x(j) - x(k));
      endif
    endfor
  F += y(j)/den;
  endfor
  for k = 1:i-1
    F *= (x0 - x(k));
  endfor
  sum1 += F;
endfor        

endfunction
