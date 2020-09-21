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
## @deftypefn {} {@var{retval} =} plotdata (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-03-04

function plotdata (X, y)
figure; hold on; 
pos = find(y == 1);
neg = find(y == 0);
plot(X(pos, 1), X(pos, 2), 'd', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), '^', 'MarkerFaceColor', 'y', 'MarkerSize', 7);



endfunction
