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
## @deftypefn {} {@var{retval} =} plotw (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-03-11

function plotw (X, y, w, Xt, yt)
figure; hold on; 
pos = find(y == 1);
neg = find(y == 0);
plot(X(pos, 1), X(pos, 2), 'd', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), '^', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

pos1 = find(yt == 1);
neg1 = find(yt == 0);

plot(Xt(pos1, 1), Xt(pos1, 2), 'x', 'LineWidth', 2, 'MarkerSize', 7);
plot(Xt(neg1, 1), Xt(neg1, 2), 'p', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
x = 0:0.1:1;
y = -w(1)/w(3) - w(2)*x/w(3);
plot(x, y);

endfunction
