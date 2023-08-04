clc;
clear;
N = 6;
visit = zeros(1,N+1);
d = zeros(1,N);
p = struct('fo1',0,'fo2',0);
flag = 1;
id = 1;
a=[3,1,1;8,0,2;12,1,2;10,0,3;5,1,3;9,0,4;2,1,4;6,0,5;9,1,5;3,0,6;11,1,6;1,0,7];
for i = 1:N*2
    if mod(i,2) == 1
        id = a(i,3);
        p(id).fo2 = a(i,1);
    else
        id = a(i,3);
        p(id).fo1 = a(i,1);
    end
end
p(1).fo1=0;
p(1).fo2=0;
p(2).fo1=3;
p(2).fo2=8;
p(3).fo1=12;
p(3).fo2=10;
p(4).fo1=5;
p(4).fo2=9;
p(5).fo1=2;
p(5).fo2=6;
p(6).fo1=9;
p(6).fo2=3;
p(7).fo1=11;
p(7).fo2=1;
a = sortrows(a,1);
s = 1; 
r = N;
for j = 1:N*2
    if visit(a(j,3)) ~= 1
        if a(j,2) == 0
            d(s) = a(j,3);
            s = s + 1;
            visit(a(j,3)) = 1;
        else
            d(r) = a(j,3);
            r = r - 1;
            visit(a(j,3)) = 1;
        end
    end
end
m1 = fix(p(d(1)).fo1);
end_time = (m1 + p(d(1)).fo2);
for i = 2:N
    m1 = m1 + p(d(i)).fo1;
    end_time =max(m1,end_time) + p(d(i)).fo2;
end
fprintf('最短的时间：%d\n', end_time);
fprintf('最优的顺序：');
for i = 1:N
    fprintf('%d ', d(i));
end
fprintf('\n');