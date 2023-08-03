%This is maxvalue.m
function [par,key]=maxvalue(par_u, par_x)
    if par_u>=0
        par=par_u+par_x;
        key=1;
    else
        par=par_x;
        key=0;
    end
end
