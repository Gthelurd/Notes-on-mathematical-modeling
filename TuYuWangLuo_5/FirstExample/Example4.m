%This is example4.m
s = [1, 2, 3, 3, 4];
t = [2, 3, 4, 1, 1];
w = [9, 8, 7, 5, 2];
nodesname = {'Alpha', 'Beta', 'Gamma', 'Delta'};
G = graph(s, t, w, nodesname);
plot(G, 'EdgeLabel', G.Edges.Weight, 'linewidth', 2); %EdgeLabel��ʾ�˱ߵı�ǩ��Ȩ�أ�
set(gca, 'XTick', [], 'YTick', []);