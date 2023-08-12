%This is example1.m
clc;
clear;
A = [0, 1, 1, 0, 0, 0, 0; ...
    1, 0, 0, 1, 1, 0, 0; ...
    1, 0, 0, 1, 0, 0, 1; ...
    0, 1, 1, 0, 1, 1, 1; ...
    0, 1, 0, 1, 0, 1, 0; ...
    0, 0, 0, 1, 1, 0, 0; ...
    0, 0, 1, 1, 0, 0, 0];
G = graph(A);
G.Edges.Weight(1) = 50;
G.Edges.Weight(2) = 60;
G.Edges.Weight(3) = 65;
G.Edges.Weight(4) = 40;
G.Edges.Weight(5) = 52;
G.Edges.Weight(6) = 45;
G.Edges.Weight(7) = 50;
G.Edges.Weight(8) = 42;
G.Edges.Weight(8) = 30;
G.Edges.Weight(9) = 42;
G.Edges.Weight(10) = 70;
plot(G, 'EdgeLabel', G.Edges.Weight, 'linewidth', 2)
set(gca, 'XTick', [], 'YTick', []);