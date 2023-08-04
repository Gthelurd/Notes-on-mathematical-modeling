function xk_plus_1 = Objfun41(xk,uk)
    xk_plus_1=(1-0.65)*uk+(1-0.35)*(xk-uk);
end