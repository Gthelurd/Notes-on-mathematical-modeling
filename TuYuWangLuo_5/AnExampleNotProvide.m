clc;
clear;
close all;
% 计算任意两个之间的最小距离
sum = 0; %保存距离求和
a(1, 2) = 2057;
a(1, 3) = 2031; %点1和点2之间的距离为2057，点1和点3之间的距离为2031
a(2, 3) = 1967;
a(2, 5) = 1042;
a(2, 6) = 1403;
a(3, 4) = 821;
a(3, 5) = 1115;
a(4, 9) = 2281;
a(5, 8) = 1905;
a(6, 7) = 1329;
a(7, 8) = 1666;
a(8, 9) = 1513;
a = a'; %matlab工具箱要求数据是下三角矩阵
[i, j, v] = find(a);
b = sparse(i, j, v, 9, 9); %构造稀疏矩阵
[x, y, z] = graphshortestpath(b, 1, 9, 'directed', false); %函数括号内1和9分别代表图中第一和第九个顶点，更改数字即可求任意两点的最小距离，x为计算得到的1和9两点间的最小距离
disp('The shortest distance = ');
disp(x);
disp('The trail = ');
disp(y);