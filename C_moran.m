clear; clc;
%莫兰检验   以下读取xlsx格式文件的C2:$I$31区域的数据
Y= xlsread('莫兰指数数据.xlsx',1,'C2:I31');
W = xlsread('空间邻接矩阵.xlsx',1,'B2:AE31');

%% 莫兰指数结果（这个单元格不需要改动）
I = CCMorans_function(Y,W);

%% 计算某年的莫兰散点图
K=1;%下一行代码读取Y的第一列（Y是30*7矩阵），即excal数据的第一年，可以自己修改为第几年
x=Y(:,K);
moran_scatter=CCmoran_scatter_function(x,W);


%%  莫兰散点图附有汉字
figure
region = {'北京','天津','河北','山西','内蒙古','辽宁','吉林',...
          '黑龙江','上海','江苏','浙江','安徽','福建','江西',...
          '山东','河南','湖北','湖南','广东','广西','海南',...
          '重庆','四川','贵州','云南','陕西','甘肃',...
          '青海','宁夏','新疆'};%此顺序与数据排列的顺序一致
      
moran_scatter_chinese=CCmoran_scatter_chinese_function(x,W,region);