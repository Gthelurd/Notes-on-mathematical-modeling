A=[-1,-2,0;-1,0,0];
b=[-1;0];
[x,fval]=fmincon('Objfun61',rand(3,1),A,b,[],[],[],[],'Objfun62');
disp(x);
disp(-fval);