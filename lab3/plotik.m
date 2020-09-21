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
## @deftypefn {} {@var{retval} =} plotik (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Serhiy <Serhiy@DESKTOP-P0VD5JV>
## Created: 2019-03-28

function plotik (mat_test, i, X)
  figure(1);
  colormap('gray');
  x = reshape(X(:, i), 15, 10);
  imagesc(x);
%  hold off;

%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;
  
  figure(2);
  colormap('winter');
  
  imagesc(mat_test(:, :, i));

  text(5, 1, 'A');
  text(3, 5, 'B');
  text(1, 5, 'C');
  text(3, 1, 'H');
  text(1, 1, 'I');
  text(1, 3, 'K');
  %text(2, 4, 'L');
  text(5, 5, 'N');
  text(5, 3, 'P');
  text(3, 3, 'Z');

endfunction
