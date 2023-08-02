function [flag] = Confun33(x)
    c=[ 100-x(1)-x(2);
        40-x(1);
        -x(1);
        -x(2);
        -x(3);
        x(1)-100;
        x(2)-100;
        x(3)-100;
    ];
   d=180-x(1)-x(2)-x(3);
   if (all(c<=0) && d==0)
       flag=1;
   else 
       flag=0;
   end
end