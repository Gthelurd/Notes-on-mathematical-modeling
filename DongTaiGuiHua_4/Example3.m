%This is Example3.m
clear,clc
a = [1 2 3 4;     % ��һ���ǽ������ͣ�������ʾϵͳ��״̬
     2 3 4 5;     % �ڶ����ǽ�������
     3 4 5 6];    % �������ǽ�����ֵ
Num=4;            % ����ǻ�������
Maxweight=8;      % ����Ǳ�������
%%�޸��������ݱ����ȥʵ�����󱳰���װ��Ʒ��ֵ���


b = perms(a(1, :));
v = [];
for i = 1:size(a,2)-1
    c = b;
    id1 = find(c <= i);
    id2 = find(c >  i);
    c(id1) = 0;
    c(id2) = 1;
    c = unique(c,'rows');
    v = [v; c];    				% ��0��1������ʾ��k״̬�ľ���
end
v = [ones(1,Num); v; zeros(1,Num)]; % ���н׶ε�����״̬�������v��
 
F = [];
for i = 1:size(v,1)
    if (a(2,:) * v(i,:)') <= Maxweight % Լ�������������ĳ��ط�Χ�ڣ�
        f = (a(3,:) * v(i,:)'); % �׶�ָ��
        F = [F, f];             % ָ�꺯��
    end
end
best_value = max(F)             % ָ�꺯������ֵ
