clear;clc;
%% 录入原始数据，包括研究对象数据和备选空间权重矩阵数据
W1 = csvread('C:\Users\cc\Desktop\lunwen\论文矩阵\邻接矩阵.csv');
W2 = csvread('C:\Users\cc\Desktop\lunwen\论文矩阵\地理距离.csv');
W3 = csvread('C:\Users\cc\Desktop\lunwen\论文矩阵\经济地理距离.csv');
Y  = csvread('C:\Users\cc\Desktop\lunwen\论文矩阵\人均实际GDP.csv',1,1);
[N,T] = size(Y);
y = reshape(Y,N*T,1);
%% 将所有备选空间权重矩阵拼接成三维元胞数组
W_Cell = cat(3,{W1,W2,W3}); % 需要根据备选权重矩阵数量进行调整,有几个调整成几个。
Num_W = length(W_Cell); 

%% 生成内生时空权重矩阵及全局莫兰指数，并作图
for m = 1:Num_W
    [TW{m},Global_Moran_I{m}] = TW_Generating(y,W_Cell{m},N,T);
    figure(1),subplot(Num_W,1,m), plot(Global_Moran_I{m},'r-*');
    figure(2),subplot(2,Num_W,m),spy(W_Cell{m});
    hold on 
    subplot(2,Num_W,Num_W+m),surf(TW{m});
end

save('C:\Users\cc\Desktop\lunwen\论文矩阵\TW Generating\TW_and_MoranI','TW','Global_Moran_I')
save('C:\Users\cc\Desktop\lunwen\论文矩阵\TW Selection\TW','TW')
