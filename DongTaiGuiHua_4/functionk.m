%This is functionk.m
function [max, uk]=functionk(k_Add_1_xk,k)
% k_Add_1_xk=518.4;
% k=5;
if k == 6
        par_u = 1;
        par_x = 4;
else
        par_u = 1 - k_Add_1_xk * 0.1;
        par_x = 4 + k_Add_1_xk * 0.9;
end

[max, uk]= maxvalue(par_u, par_x)
