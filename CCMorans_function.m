function I= CCMorans_function(Y,W)

%CC于2021年4月7日晚编写于广东省委党校。
%版权归属于广东省委党校416寝室CC所有，不得用于除学习以外的其他用途。
%有问题邮箱联系：econometrical@163.com。


[n T]=size(Y);
w = normw(W);%行标准化
for k=1:T
%% 求莫兰指数值    
x=Y(:,k);
s=var(x,1);
m=mean(x);
y=0;
for i=1:n
    for j=1:n
        y=y+w(i,j)*(x(i)-m)*(x(j)-m);
    end
end
moran=y/(s*n);

s0=n;

%% 求解S1（此时未除于2）
s1=0;
for i=1:n
     for j=1:n
        s1=s1+(w(i,j)+w(j,i))^2;
     end
end

%% 求解S2
s2=0;
for i=1:n
    w12(i)=0;
    w21(i)=0;
  for j=1:n
     w12(i)=w12(i)+w(i,j);
     w21(i)=w21(i)+w(j,i);
  end
    s2=s2+(w12(i)+w21(i))^2;%S2
end
%% 求D表达式
k21=0;
k22=0;
for i=1:n
   k21=k21+(x(i)-m)^4;
   k22=k22+(x(i)-m)^2;   
end
k2=(n*k21)/(k22^2);
%% 求Z值等
s1=s1/2;
ei=-1/(n-1);
ei2=ei^2;
A=n*((n^2-3*n+3)*s1-n*s2+3*s0^2);
B=k2*((n^2-n)*s1-2*n*s2+6*s0^2);
C=s0^2*(n-1)*(n-2)*(n-3);
varcc=((A-B)/C)-ei2;
sd=varcc^(1/2);
z=(moran-ei)/sd;
P = 2 * (1-normcdf(abs(z)));
BB(:,k)=[moran ei sd z  P];
end
% 列表显示莫兰指数结果
fprintf(1,'莫兰检验结果(第一列为I(莫兰指数） 第二列为E(I) 第三列为SD(I) 第四列为Z 第五列为P)')
I = BB'
end
