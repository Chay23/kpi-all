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
## @deftypefn {} {@var{retval} =} findroot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-02-16

function x = findroot (a, b, eps);
if pol(a) == 0
  x = a;
  return;
endif
if pol(b) == 0
  x = b;
  return;
endif  
c = (b-a)/2;
mid = a+c;
iter = 0;
while (b-a)/2 > eps 
  while abs(pol(mid)) > eps
  iter++;
  c = (b-a)/2;
  mid = a + c;
  if sign(pol(a)) != sign(pol(mid))
    b = mid;
   else a = mid;
 endif
 fprintf('a value \n');
a
b
pol(mid)


endwhile
endwhile
x = mid;
pol(mid)
iter
endfunction
