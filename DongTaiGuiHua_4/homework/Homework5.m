clear all
clear;
clc;

% �������˺����˵�����
m = 3; 
% ���ô����������ض�����
k = 2;

% �оٳ����а�ȫ�Ŀ����ԣ���ת��Ϊ��ά��ʽչʾ������1��ʾ��ȫ��0��ʾ����ȫ
m = m + 1; % ��һ�����������3�����˾���0��1��2��3һ���������
% ����һ��λ�����꣬�����Ϊ1����˵����ȫ�������Ϊ0����˵������ȫ
A = zeros(m,m); % �б�ʾ���ˣ��б�ʾ����
for i = 0:m - 1 
    for j = 0:m - 1
        if (i == j)||(i == m - 1)||(i == 0)
            A(i + 1,j + 1) = 1;
        end
    end
end

% ���������������ΪT
Tmax = 50;
% ����·��
location = {};
% ���ó�ʼλ��
location{1,1} = [m,m,1];

p = 1;  % ������ʾ����ÿһ�еĵڼ���

for t = 1:Tmax 
    repeat = 0; % �����ж��Ƿ��ظ�
    success = 0; % ��Ϊ1����˵���Ѿ���ɶɺ�����
    T = t; % T��¼���Ӵ���
    if k >= 2 * (m - 1) % ���һ���Կ��������������˺�����
        fprintf('Step of cross river is %d\n',1);
        fprintf('Step is (%d, %d) --> (%d, %d)\n',m - 1,m - 1,0,0);
        break;
    end 
    
    for a = 1:sum(~cellfun(@isempty, location(T,:))) % ��ʾ�м�������������ͬһ��T��˵��
        if a == 1 
            p = 1;
        end
        n1 = location{T,a}(1,1); % ������
        n2 = location{T,a}(1,2); % ������
        
        for i = 0:k % �ɺ�
            for j = 0:k
                if (i + j >= 1 && i + j <= k) && (n1 + i * (-1)^T <= m && n1 + i * (-1)^T >= 1) && (n2 + j * (-1)^T <= m && n2 + j * (-1)^T >= 1) && (A(n1 + i * (-1)^T,n2 + j * (-1)^T) == 1)
                % �����ж�
                    if T >= 2 % �ж��Ƿ��ظ�
                        for e = 1:sum(~cellfun(@isempty, location(T-1,:)))
                            if (location{T - 1,e}(1,1) == n1 + i * (-1)^T) && (location{T - 1,e}(1,2) == n2 + j * (-1)^T)
                                repeat = 1; % ��������ظ�������repeat = 1
                                break;
                            end
                        end
                    end
                    if repeat == 0 % �����ظ�����ѽ������location��
                        location{T + 1,p} = [n1 + i * (-1)^T,n2 + j * (-1)^T,a];
                        p = p + 1;
                    end
                    repeat = 0; % ÿһ��ѭ������Ҫ���ж��ظ��������0
                end
            end
        end
    end
    
    T = T + 1; % һ�ο������T+1
    location{T + 1,1}=[]; % ���´�����cell
    if sum(~cellfun(@isempty, location(T,:))) == 0 % �ж��Ƿ����µ�������ɣ�0��ʾcellȫ��Ϊ��
        fprintf('There is No answer for this situation!\n')
        break;
    end
    
    for win = 1:sum(~cellfun(@isempty, location(T,:))) % �ж��Ƿ����������������
        if location{T,win}(1,1) == 1 && location{T,win}(1,2) == 1
            success = 1;
            break;
        end
    end
    if success == 1  % ���Ѿ��н�������������
        T = T - 1;
        fprintf('Steps of cross river is %d\n',T);
        break;
    end
end

if success == 1  % ���һ����
    W = [];
    a = win;
    for b = 1 : T + 1
        W(b,1) = location{T + 2 - b,a}(1,1) - 1;
        W(b,2) = location{T + 2 - b,a}(1,2) - 1;
        a = location{T + 2 - b,a}(1,3);
    end
    W = flipud(W);  % ��תW��ֵ
    m = m - 1;
    fprintf('\t\t        �˰�                           �˰�\n');
    for i = 1:T
        fprintf('Step %2d is (%2d,%2d) --> (%2d,%2d)          (%2d,%2d) --> (%2d,%2d)\n',i, W(i,1),W(i,2),W(i+1,1),W(i+1,2),m - W(i,1),m - W(i,2),m - W(i+1,1),m - W(i+1,2));
    end
end