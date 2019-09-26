function [d, t] = lab1f(np, nd)
if (nargin < 1), np = 1e5; nd = 2; end
hp = gcp('nocreate');
if isempty(hp), hp = parpool(4); end
AA = randn(np, nd); dAA = distributed(AA);
BB = randn(np, nd); dBB = distributed(BB);
tic;
dc = sqrt(sum((dAA - dBB).^2,2));
d = gather(dc);
t = toc;
delete(hp);