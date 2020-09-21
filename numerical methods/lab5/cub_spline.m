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
## @deftypefn {} {@var{retval} =} cub_spline (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-05-07

function rez = cub_spline (des, x, y)
a = 0; b = 0; bn = 0; c = 0; d = 0; rez = 0; prev = 0;cur = 0; i = 1;
while des >= x(i)
  i++;
  if i == 7
    i = 6;
    break;
  endif  
endwhile  
  prev = i-1;
  cur = i;
  a = y(prev);
  b = first_deriv(y(prev));
  bn = first_deriv(y(cur));
  yn1 = (y(cur) - y(prev)) / (x(cur) - x(prev));
  c = (3*yn1 - bn - 2*b) / (x(cur)-x(prev));
	d = (bn + b - 2*yn1) / ((x(cur) - x(prev))^2);
	rez = a + b*(des - x(prev)) + c*((des - x(prev))^2) + d*((des - x(prev))^3);
endfunction
