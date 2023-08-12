%This is example2.m
s = [1, 2, 3, 3, 4];
t = [2, 3, 4, 1, 1];
G = graph(s, t);
plot(G);
set(gca, 'XTick', [], 'YTick', []);