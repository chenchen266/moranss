function moran_scatter_chinese=CCmoran_scatter_chinese_function(x,W,rawdata) 


%2020年4月首版编写于“云上”广东省委党校。更新于2021年4月28日。
%版权归属于广东省委党校416寝室CC所有，不得用于除学习以外的其他用途。
%有问题邮箱联系：econometrical@163.com。

[N t]=size(x);
w = normw(W);
zx=zscore(x);
wzx=w*zx;
scatter(zx,wzx,'filled');
axis([-2,4,-1,2])
hold on

n=xlim;
m=ylim;
moran_I=regress(wzx,zx);
zx1=-3:0.01:4;

moran_scatter_chinese=plot(zx1,moran_I*zx1,'-r','linewidth',2);
title(['Moran’s I = ',num2str(moran_I,'%8.4f')]);
%%a = moran_I;
%%b = sprintf('%8.4f',a) ;
%%title(['Moran’s I = ',b]);
hold on

id = rawdata;
for i = (1:N)
text(zx(i),wzx(i),id{i});
end
hold on

line([n(1),n(2)],[0,0],'linestyle','--','color','k');
line([0,0],[m(1),m(2)],'linestyle','--','color','k');
hold off
end