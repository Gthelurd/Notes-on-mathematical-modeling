clear all
clear;
clc;

% 设置商人和仆人的数量
m = 3; 
% 设置船上最多可以载多少人
k = 2;

% 列举出所有安全的可能性，并转化为二维形式展示，其中1表示安全，0表示不安全
m = m + 1; % 多一种情况，比如3个商人就是0，1，2，3一共四种情况
% 创建一个位置坐标，若结果为1，则说明安全，若结果为0，则说明不安全
A = zeros(m,m); % 列表示商人，行表示仆人
for i = 0:m - 1 
    for j = 0:m - 1
        if (i == j)||(i == m - 1)||(i == 0)
            A(i + 1,j + 1) = 1;
        end
    end
end

% 设置最大坐船次数为T
Tmax = 50;
% 设置路径
location = {};
% 设置初始位置
location{1,1} = [m,m,1];

p = 1;  % 用来表示放在每一行的第几列

for t = 1:Tmax 
    repeat = 0; % 用来判断是否重复
    success = 0; % 若为1，则说明已经完成渡河任务
    T = t; % T记录过河次数
    if k >= 2 * (m - 1) % 如果一次性可以送走所有商人和仆人
        fprintf('Step of cross river is %d\n',1);
        fprintf('Step is (%d, %d) --> (%d, %d)\n',m - 1,m - 1,0,0);
        break;
    end 
    
    for a = 1:sum(~cellfun(@isempty, location(T,:))) % 表示有几种情况（相对于同一个T来说）
        if a == 1 
            p = 1;
        end
        n1 = location{T,a}(1,1); % 商人数
        n2 = location{T,a}(1,2); % 仆人数
        
        for i = 0:k % 渡河
            for j = 0:k
                if (i + j >= 1 && i + j <= k) && (n1 + i * (-1)^T <= m && n1 + i * (-1)^T >= 1) && (n2 + j * (-1)^T <= m && n2 + j * (-1)^T >= 1) && (A(n1 + i * (-1)^T,n2 + j * (-1)^T) == 1)
                % 条件判断
                    if T >= 2 % 判断是否重复
                        for e = 1:sum(~cellfun(@isempty, location(T-1,:)))
                            if (location{T - 1,e}(1,1) == n1 + i * (-1)^T) && (location{T - 1,e}(1,2) == n2 + j * (-1)^T)
                                repeat = 1; % 如果发现重复，则设repeat = 1
                                break;
                            end
                        end
                    end
                    if repeat == 0 % 若不重复，则把结果存入location中
                        location{T + 1,p} = [n1 + i * (-1)^T,n2 + j * (-1)^T,a];
                        p = p + 1;
                    end
                    repeat = 0; % 每一次循环都需要把判断重复的语句置0
                end
            end
        end
    end
    
    T = T + 1; % 一次考虑完后T+1
    location{T + 1,1}=[]; % 往下创建空cell
    if sum(~cellfun(@isempty, location(T,:))) == 0 % 判断是否有新的情况生成，0表示cell全部为空
        fprintf('There is No answer for this situation!\n')
        break;
    end
    
    for win = 1:sum(~cellfun(@isempty, location(T,:))) % 判断是否已有完成任务的情况
        if location{T,win}(1,1) == 1 && location{T,win}(1,2) == 1
            success = 1;
            break;
        end
    end
    if success == 1  % 若已经有结果，则可输出结果
        T = T - 1;
        fprintf('Steps of cross river is %d\n',T);
        break;
    end
end

if success == 1  % 输出一组结果
    W = [];
    a = win;
    for b = 1 : T + 1
        W(b,1) = location{T + 2 - b,a}(1,1) - 1;
        W(b,2) = location{T + 2 - b,a}(1,2) - 1;
        a = location{T + 2 - b,a}(1,3);
    end
    W = flipud(W);  % 翻转W的值
    m = m - 1;
    fprintf('\t\t        此岸                           彼岸\n');
    for i = 1:T
        fprintf('Step %2d is (%2d,%2d) --> (%2d,%2d)          (%2d,%2d) --> (%2d,%2d)\n',i, W(i,1),W(i,2),W(i+1,1),W(i+1,2),m - W(i,1),m - W(i,2),m - W(i+1,1),m - W(i+1,2));
    end
end