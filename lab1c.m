function [d, t] = lab1c(np, nd, nw)
if (nargin < 1), np = 1e5; nd = 2; nw=1; end
hp = gcp('nocreate');
if isempty(hp), hp = parpool(nw); end
A = randn(np, nd); B = randn(np, nd);
d = zeros(np, nd);
for nw = 1:20
    tic;
    parfor i = 1:np
        for j = 1:nd
            d(i) = d(i) + (B(i,j) - A(i,j)).^2;
        end
        d(i) = sqrt(d(i));    
    end
    fprintf("Number of workers: %i\n", nw)
    t = toc
    delete(hp);
end