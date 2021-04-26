function moran_scatter_chinese=CCmoran_scatter_chinese_function(x,W,region) %x为输入变量，W为空间权重矩阵


% CC于2021年4月编写于广东省委党校，版权归属于广东省委党校416寝室CC
%有问题邮箱联系：econometrical@163.com


w = normw(W);%行标准化
zx=(x-mean(x))/std(x);
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

id = region';
for i = (1:30)
text(zx(i),wzx(i),id{i});
end
hold on

line([n(1),n(2)],[0,0],'linestyle','--','color','k');
line([0,0],[m(1),m(2)],'linestyle','--','color','k');
hold off
end