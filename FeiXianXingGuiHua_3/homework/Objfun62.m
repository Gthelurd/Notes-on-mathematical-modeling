function [C,Ceq]=Objfun62(x)
C=[x(1)+x(2)+x(3)+2*x(1)^2+2*x(2)^2-10;
    x(1)+x(2)-x(3)+x(1)^2+x(2)^2-50;
    2*x(1)+2*x(2)+x(3)+x(1)^2-40;
    ];
Ceq=x(1)^2+x(3)-2;
end