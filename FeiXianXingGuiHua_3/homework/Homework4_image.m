%% �������ܷɻ�
clear;clc
figure(1) %����һ��ͼ��
%�洢�й��ڷɻ����������ꡢ�Ƕ�
data = [150 140 243
    85  85  236
    150 155 220.5
    145 50  159 
    130 150 230
    0   0   52];
plot(data(:,1),data(:,2),'.r')
axis([0 160,0,160]);% ����������̶ȷ�Χ
hold on;
for i = 1:6
    txt = ['�ɻ�',num2str(i)];
    text(data(i,1)+2,data(i,2)+2,txt,'FontSize',8)
end
