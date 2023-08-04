function [par,key]=Objfun43(par_x,par_u)
    if par_u>=0
        par =par_u+par_x;
        key=1;
    else
        par=par_x;
        key=0;
    end
end
   