%This is Example1.m
clc
clear
k_Add_1_xk = 0;
max = 0;
uk = [];
for i = [6:-1:1];
    [k_Add_1_xk, u_k] = functionk(k_Add_1_xk, i);
    uk=[uk u_k];
end
uk=flip(uk);
maxprofit = k_Add_1_xk*1000;

x = 1000; 
x_last = 0;
x_last = x;
number=[x_last];
for i = 2:5
    x = 0.9 * x - 0.1 * uk(i) * x_last;
    x_last = x;
   
    number=[number x_last];
end
disp('从第一年开始的完好机器数量如下');
number
disp(strcat('最大利润为',num2str(maxprofit)))
