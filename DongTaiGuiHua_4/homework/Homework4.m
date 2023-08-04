clc
clear
x = 100; 
k_Add_1_xk = 0;
max = 0;
uk = [];
for i = [3:-1:1];
    [k_Add_1_xk, u_k] =Objfun44(k_Add_1_xk, i);
    uk=[uk u_k];
end
uk=flip(uk);
maxprofit = k_Add_1_xk*100;


x_last = x;
number=[x_last];
for i = 2:3
    x =Objfun41(x,uk(i)*x_last);
    x_last = x;
   
    number=[number x_last];
end
disp(number);
disp(maxprofit);