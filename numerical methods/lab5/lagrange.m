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
## @deftypefn {} {@var{retval} =} lagrange (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-04-20

function z = lagrange (x, y, x0)
z = 0;
p1 = 1; p2 = 0;
[m, n] = size(x);
for i = 1:n
  p1 = 1;
  p2 = 1;
  for j = 1:n
    if i != j
      p1 *= x0 - x(j);
      p2 *= x(i) - x(j);
    endif
  endfor  
  z += y(i)*p1/p2;
endfor  
endfunction
