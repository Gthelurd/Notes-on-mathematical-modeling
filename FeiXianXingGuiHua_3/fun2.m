%This is fun2.m
function [g,h]=fun2(x)
g=[-x(1)^2+x(2)-x(3)^2 
x(1)+x(2)^2+x(3)^3-20]; %Nonlinear inequality constraints 
h=[-x(1)-x(2)^2+2 
x(2)+2*x(3)^2-3]; %Nonlinear equality constraints