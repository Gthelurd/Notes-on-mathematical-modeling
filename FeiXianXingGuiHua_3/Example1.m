%This is Example1.m
clc;
clear;
options = optimset('GradObj','on');
[x,y] = fminunc('Objective1',rand(1,2),options)
%x =1.0000    1.0000...
%y =3.6009e-15