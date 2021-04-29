clear;clc;
%%基于范巧教授的代码算的无固定效应下的
A = csvread('C:\M\bin\MMMMM\论文\shuju.csv',1,0);
W1 = csvread('C:\M\bin\MMMMM\论文\2.csv');
W = normw(W1);
n = length(A);
y = A(:,[3]);
x = [ones(n,1) A(:,4:10)]; 
T = 18;
N = 21;
Y = eye(T);
TW = kron(Y,W);
vnames = strvcat('Y1','constant','X1','X2','X3','X4','X5','X6','X7');
info.lflag = 0;
info.rmin = -1;
info.rmax = 1;
results = sdm(y,x,TW,info);
prt(results,vnames);

%%贝叶斯估计
prior.lflag = 0;
prior.novi = 1;
ndraw = 2500;
nomit = 500;
results2 = sdm_g(y,x,TW,ndraw,nomit,prior);
prt(results2,vnames);