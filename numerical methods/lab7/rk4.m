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
## @deftypefn {} {@var{retval} =} rk4 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-10-27

function temp = rk4(func,x,pvi,h)
    K1 = h*func(x,pvi);
    K2 = h*func(x+0.5*h,pvi+0.5*K1);
    K3 = h*func(x+0.5*h,pvi+0.5*K2);
    K4 = h*func(x+h,pvi+K3);
    temp = pvi + (K1 + 2*K2 + 2*K3 + K4)/6;
endfunction
