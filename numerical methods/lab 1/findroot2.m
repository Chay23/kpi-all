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
## @deftypefn {} {@var{retval} =} findroot2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-02-16

function x = findroot2 (a, b, eps);
if pol(a) == 0
  x = a;
  return;
endif
if pol(b) == 0
  x = b;
  return;
endif  
iter2 = 0;
c = (a*pol(b) - b*pol(a))/(pol(b) - pol(a));
while abs(pol(b) - pol(a)) > eps 
  while abs(pol(b)) > eps

   a = b - (b - a) * pol(b) / (pol(b) - pol(a));
   b = a + (a - b) * pol(a) / (pol(a) - pol(b));
  iter2++;
  fprintf('res hord \n');
a 
b
pol(a)
pol(b)
endwhile
endwhile
x = b;
iter2
endfunction
