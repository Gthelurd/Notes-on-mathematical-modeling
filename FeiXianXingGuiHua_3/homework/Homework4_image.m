%% 画出六架飞机
clear;clc
figure(1) %生成一个图像
%存储有关于飞机的数据坐标、角度
data = [150 140 243
    85  85  236
    150 155 220.5
    145 50  159 
    130 150 230
    0   0   52];
plot(data(:,1),data(:,2),'.r')
axis([0 160,0,160]);% 设置坐标轴刻度范围
hold on;
for i = 1:6
    txt = ['飞机',num2str(i)];
    text(data(i,1)+2,data(i,2)+2,txt,'FontSize',8)
end
