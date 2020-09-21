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
## @deftypefn {} {@var{retval} =} expadv (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-03-27

function h = expadv (xi, wi, sigma)
  x = zeros(150, 1);
  w = zeros(150, 1);
 % size(x)
  %size(xi)
  for i = 1:150
    x(i, 1) = xi(1, 1, i);
    w(i, 1) = wi(1, 1, i);
  endfor  
  h = exp(-(norm(x - w))^2/(2*sigma^2));

endfunction
