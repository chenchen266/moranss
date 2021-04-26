function I= CCMorans_function(Y,W)

% CC于2021年4月7号晚编写于广东省委党校，版权归属于广东省委党校416寝室CC
%有问题邮箱联系：econometrical@163.com


[n T]=size(Y);
for k=1:T
w = normw(W);%行标准化
x=Y(:,k);
s=var(x,1);
m=mean(x);
y=0;
a=0;
for i=1:1:n
    for j=1:1:n
         if (i==j) 
            continue
        end
        y=y+w(i,j)*(x(i)-m)*(x(j)-m);
        a=a+w(i,j);
    end
end
moran=y/(s*a);
k21=0;
k22=0;
w0=0;
w1=0;
w2=0;
for i=1:1:n
   k21=k21+(x(i)-m)^4;
   k22=k22+(x(i)-m)^2;
     for j=1:1:n
        w0=w0+w(i,j);
        w1=w1+(w(i,j)+w(j,i))^2;
     end
end
for i=1:1:n
    w12(i)=0;
    w21(i)=0;
  for j=1:1:n
     w12(i)=w12(i)+w(i,j);
     w21(i)=w21(i)+w(j,i);
  end
    w2=w2+(w12(i)+w21(i))^2;
end
k2=(n*k21)/(k22^2);
w1=w1/2;
ei=-1/(n-1);
vari=(n*((n^2+3*n+3)*w1-n*w2+3*w0^2)-k2*((n^2-n)*w1-2*n*w2+6*w0^2))/(w0^2*(n-1)*(n-2)*(n-3))-ei^2;
z=(moran-ei)/vari^(1/2);
P = 2 * (1-normcdf(abs(z)));
B(:,k)=[moran z P];
end
% 列表显示莫兰指数结果
fprintf(1,'莫兰检验结果(第一列为莫兰指数 第二列为Z值 第三列为P值)')
I = B'
end
