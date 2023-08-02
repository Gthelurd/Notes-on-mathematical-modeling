%This is Example3.m
clc;
clear;
options = optimset('PlotFcns',@optimplotfval);
x0 = [-1.2,1];
x = fminsearch(@Objective3,x0,options)