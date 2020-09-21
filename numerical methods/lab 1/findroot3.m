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
## @deftypefn {} {@var{retval} =} findroot3 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-02-16

function x = findroot3(x0, eps);
  x1 = x0 - (pol(x0)/dpol(x0)); 
  iter3 = 0;
while abs(x1 - x0) > eps && abs(pol(x1)) > eps
  x0 = x1;
  x1 = x1 - (pol(x1)/dpol(x1));
  x1
  pol(x1)
  iter3++;
endwhile  
x = x1;
iter3
endfunction
