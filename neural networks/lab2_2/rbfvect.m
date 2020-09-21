
function fi = rbfvect (x, y, sigma)
fi = exp((-1)*norm(x-y)^2/(0.1*sigma^2));
endfunction
