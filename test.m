clc, clear
%rng('shuffle')  %根据当前时间为随机数生成器提供�?�子
rng(0) %进�?�一致性比较，每�?�产生的随机数是一样的
p0=0; n=10^6; tic    %计时开�?
for i=1:n
   x=randi([0,99],1,5); %产生一行五列的区间[0,99]上的随机整数
   [f,g]=mengte(x);
   if all(g<=0)
       if p0<f
           x0=x; p0=f; %记录下当前较好的�?
       end
   end
end
x0, p0, toc    %计时结束