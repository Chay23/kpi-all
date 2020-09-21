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
## @deftypefn {} {@var{retval} =} newton_b (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-05-03

function sum1 = newton_b (des, x, y)
[m, n] = size(y);
sum1 = y(n);
F = 0;
den = 1;
i = n - 1;
while i > 0
  F = 0;
  j = n;
  while j >= i
    den = 1;
    k = n;
    while k >= i
      if  k != j
        den *= (x(j) - x(k));
      endif  
      k--;
    endwhile
    F += y(j)/den;  
    j--;
  endwhile
  k = n  ;
  while k > i
    F *= (des - x(k));
    k--;
  endwhile
  sum1 += F;
  i --  ;
endwhile 
endfunction
