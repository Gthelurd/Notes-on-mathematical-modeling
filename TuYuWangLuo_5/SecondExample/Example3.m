clc;
clear;
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
[i, j, b] = find(a);
data = [i'; j'; b'];
index = data(1:2, :);
loop = max(size(a)) - 1;
result = [];
while length(result) < loop
    temp = min(data(3, :));
    flag = find(data(3, :) == temp);
    flag = flag(1);
    v1 = data(1, flag);
    v2 = data(2, flag);
    if index(1, flag) ~= index(2, flag)
        result = [result, data(:, flag)];
    end
    index(find(index == v2)) = v1;
    data(:, flag) = [];
    index(:, flag) = [];
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
