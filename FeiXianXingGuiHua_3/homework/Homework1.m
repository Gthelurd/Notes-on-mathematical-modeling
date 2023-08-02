clc;
x=[1;1];
[f0,g]=deltaf(x);
while norm(g)>0.000001
 p=-g/norm(g);
 t=1.0;
 f=deltaf(x+t*p);
 while f>f0
 t=t/2;
 f=deltaf(x+t*p);
 end
x=x+t*p;
[f0,g]=deltaf(x);
end
x,f0