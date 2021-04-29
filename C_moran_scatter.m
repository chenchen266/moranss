clear; clc;  
%数据格式一定要按照我给的excal数据样式
Y= xlsread('莫兰指数数据.xlsx',1,'C2:I31');%以下读取xlsx格式文件的C2:$I$31区域的数据，即变量数据
W = xlsread('空间邻接矩阵.xlsx',1,'B2:AE31');%读取矩阵
[~,~,rawdata] = xlsread('莫兰指数数据.xlsx',1,'B2:B31');%读取莫兰散点图中所使用的汉字
%k为读取年份数，以第一年为例
K=1;%下一行代码读取Y的第一列（Y是30*7矩阵），即excal数据的第一年，可以自己修改为第几年
x=Y(:,K);%读取k年份的变量数据

%% 以下不需要改动

% 画出某年的莫兰散点图
moran_scatter=CCmoran_scatter_function(x,W);

% 莫兰散点图附有汉字
figure
region = rawdata;
moran_scatter_chinese=CCmoran_scatter_chinese_function(x,W,region);