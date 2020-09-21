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
## @deftypefn {} {@var{retval} =} maadams4 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-10-29

function [x, y] = maadams4 (dyfun, xspan, y0, h)
 x=xspan(1):h:xspan(2);
% use Runge-Kutta method to get four initial values
[xx,yy]=marunge(dyfun,[x(1),x(4)],y0,h);
y(1)=yy(1);y(2)=yy(2);
y(3)=yy(3);y(4)=yy(4);
for n=4:(length(x)-1)
p=y(n)+h/24*(55*feval(dyfun,x(n),y(n))-59*feval(dyfun,x(n-1),y(n-1))+37*feval(dyfun,x(n-2),y(n-2))-9*feval(dyfun,x(n-3),y(n-3)));
y(n+1)=y(n)+h/24*(9*feval(dyfun,x(n+1),p)+19*feval(dyfun,x(n),y(n))-5*feval(dyfun,x(n-1),y(n-1))+feval(dyfun,x(n-2),y(n-2)));
endfor

endfunction
