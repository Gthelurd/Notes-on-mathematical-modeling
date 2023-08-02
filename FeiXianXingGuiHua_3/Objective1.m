%This is Obejctive1.m
function [f,g]=Objective1(x) 
f=100*(x(2)-x(1)^2)^2+(1-x(1))^2; 
g=[-400*x(1)*(x(2)-x(1)^2)-2*(1-x(1));200*(x(2)-x(1)^2)];