%This is example3.m
s = [1, 2, 3, 3, 4];
t = [2, 3, 4, 1, 1];
w = [9, 8, 7, 5, 2];
G = graph(s, t, w);
plot(G, 'EdgeLabel', G.Edges.Weight, 'linewidth', 2);   %EdgeLabel显示了边的标签（权重）
set(gca, 'XTick', [], 'YTick', []);