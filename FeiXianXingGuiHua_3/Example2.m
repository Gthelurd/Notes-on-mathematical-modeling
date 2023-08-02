%This is Example2.m
clc;
clear;
options = optimset('GradObj','on','Hessian','on');
[x,y]=fminunc('Objective2',rand(1,2),options)