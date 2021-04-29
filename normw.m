function W = normw(W)
%矩阵标准化
if nargin ~= 1
    error('normw: Wrong # of input arguments');
end;
 [n1 n2] = size(W);
if n1 ~= n2,
 error('normw: W matrix must be square');
end;
n = ndims(W);
nterm = sum(W, n);
nterm = repmat(nterm,[ones(1,n-1) size(W,n)]);
nterm = nterm + (nterm==0);
  W = W ./ nterm;

