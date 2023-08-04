function [max,uk]=Objfun44(k_Add_1_xk,k)

if k == 4
        par_u = 10;
        par_x = 35;
else
        par_u = 10 - k_Add_1_xk * 0.3;
        par_x = 35 + k_Add_1_xk * 0.65;
end
[max,uk]=Objfun43(par_x,par_u);
end