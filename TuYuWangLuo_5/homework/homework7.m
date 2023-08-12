clc;
clear;

L = {'va', 'v1', 4, 10;
     'vs', 'v2', 1, 8;
     'v1', 'v3', 6, 2;
     'v1', 'vt', 1, 7;
     'v2', 'v1', 2, 5;
     'v2', 'v3', 3, 10;
     'v3', 'vt', 2, 4};

G1 = digraph(L(:, 1), L(:, 2), cell2mat(L(:, 3)));
G2 = digraph(L(:, 1), L(:, 2), cell2mat(L(:, 4)));
plot(G1);
plot(G2);
[M, F] = maxflow(G1, 'vs', 'vt');
b = full(adjacency(G1));
%b = full(adjacency(G1, 'weighted'));
%c = full(adjacency(G2, 'weighted'));
c = full(adjacency(G2));

f = optimvar('f', 5, 5, 'LowerBound', 0);
prob = optimproblem;
prob.Objective = sum(sum(b .* f));

con1 = {sum(f(1, :)) == M,
        sum(f(:, 2:end-1), 2) == sum(f(2:end-1, :)),
        sum(f(:, end)) == M};
prob.Constraints.con1 = con1;
prob.Constraints.con2 = f <= c;

[sol, fval, flag, out] = solve(prob);
ff = sol.f;
  