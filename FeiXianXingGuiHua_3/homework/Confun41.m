function [c,ceq] = nonlfun1(delta) %决策变量是六个飞机的变化角度
     x = [150 85 150 145 130  0]; % 飞机初始位置的横坐标
     y = [140 85 155  50 150  0]; % 飞机初始位置的纵坐标
     theta = [243 236 220.5 159 230 52] * pi / 180; % 飞机初始的飞行方向角
     v=800;
     co = cos(theta + delta);  % 包含6个元素的向量
     si = sin(theta + delta);  % 包含6个元素的向量
     d = zeros(6);  % 初始化飞机两两之间的最短距离矩阵
     for i = 2: 6
         for j = 1: i-1
             % 套用我们推导出来的公式计算飞机i和飞机j相距最近的时间
             fenzi = ((y(j)-y(i))*(si(j)-si(i)) +(x(j)-x(i))*(co(j)-co(i))) ;  % 分子
             fenmu =  v * ((co(j)-co(i))^2 + (si(j)-si(i))^2);  % 分母
             t(i,j) =- fenzi / fenmu;
             if t(i,j) <0  
                 d(i, j) = 1000; 
             else
                 d(i, j) = sqrt((x(j)-x(i)+v*t(i,j)*(co(j)-co(i)))^2+(y(j)-y(i)+v*t(i,j)*(si(j)-si(i)))^2); 
             end 
         end
     end
     %非线性不等式约束条件
     c = ones(15,1)*8.000001-[d(2,1);d(3,1:2)';d(4,1:3)';d(5,1:4)';d(6,1:5)'];
     % 15表示15种飞机匹配方式，取值为8.000001表示大于题设条件8
     %无非线性等式约束
     ceq=[];
end
