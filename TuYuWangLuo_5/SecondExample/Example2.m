clc;
clear;
a = zeros(7);
a(1, 2) = 50;
a(1, 3) = 60;
a(2, 4) = 65;
a(2, 5) = 40;
a(3, 4) = 52;
a(3, 7) = 45;
a(4, 5) = 50;
a(4, 6) = 30;
a(4, 7) = 42;
a(5, 6) = 70;
a = a + a';
a(find(a == 0)) = inf;
result = [];
p = 1;
tb = 2:length(a);
while length(result) ~= length(a) - 1
    temp = a(p, tb);
    temp = temp(:);
    d = min(temp);
    [jb, kb] = find(a(p, tb) == d);
    j = p(jb(1));
    k = tb(kb(1));
    result = [result, [j; k; d]];
    p = [p, k];
    tb(find(tb == k)) = [];
end
s = result(1, :);
t = result(2, :);
w = result(3, :);
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
myplot = plot(G, 'EdgeLabel', G.Edges.Weight, 'linewidth', 2);
highlight(myplot, s, t, 'EdgeColor', 'r')
%plot(myplot)
result