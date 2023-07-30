%此版本要求matlab2017及以上
clc,clear,format long g
x = optimvar('x',9,'Type','integer','LowerBound',0);
prob = optimproblem('ObjectivSense','max');
prob.Objective = x(1)+x(2)+1.65*x(8)+2.3*x(9)-0.05*(5*x(1)+10*x(6))-...
    0.0321*(7*x(2)+9*x(7)+12*x(9))-25/400*(6*x(3)+8*x(8))-...
    783/7000*(4*x(4)+11*x(9))-0.35*x(5);
con1 = [5*x(1)+10*x(6)<=6000
    7*x(2)+9*x(7)+12*x(9)<=10000,
    6*x(3)+8*x(8)<=4000
    4*x(4)+11*x(9)<=7000
    7*x(5)<=4000];
con2 = [x(1)+x(2)==x(3)+x(4)+x(5),x(6)+x(7)==x(8)];
prob.Constraints.con1 = con1;
prob.Constraints.con2 = con2;
[sol,fval,flag] = solve(prob);
sol , x, format