%This is Example2.m
clc,clear
now=[5,3,0,0 ,0,0,0,0 ,0,0,0,0 ,0,0,0,0
     1,3,6,0 ,0,8,7,6 ,0,0,0,0 ,0,0,0,0
     6,8,0,0 ,3,5,0,0 ,0,0,0,0 ,0,0,0,0
     2,2,0,0 ,1,2,0,0 ,3,3,0,0 ,0,0,0,0
     3,5,0,0 ,5,2,0,0 ,6,6,0,0 ,0,0,0,0
     4,0,0,0 ,3,0,0,0 ,0,0,0,0 ,0,0,0,0
     0,0,0,0 ,0,0,0,0 ,0,0,0,0 ,0,0,0,0];  %路程矩阵，第i行表示第i个阶段(最后一个阶段默认全为0)；n*m列，n个起点，m种不同走法，隔m个数开始下一个起点
h=7 ;        %阶段数
a=4   ;      %起点数
b=4;         %决策数(决策数一般等于起点数)
%%只需修改上面的代码，就可以嵌套进其他的最短路径求解%%
 
 
now(now==0)=inf;    %先把他写成全矩阵，没有路的用00补充，之后吧0转换成无穷大
road_sum=zeros(h,a*b);   %保存每个阶段的最短路程长
 
for i=h-1:-1:1      %不同阶段
    for n=1:a       %不同阶段下的几个不同起点
        for k=1:b   %不同起点下的几个不同决策
            road_sum(i,(n-1)*a+k)=now(i,(n-1)*a+k)+min(road_sum(i+1,(k-1)*a+1:k*a));   %当前路径加上上个阶段下的最短路径
        end
    end
end
 
road=[];                %用来保存选择的起点
for i=1:h-1
    if i==1
        start=find(road_sum(1,:)==min(road_sum(1,:)));       %找到起点之后的第一个点
    else
        start=find(road_sum(i,(start-1)*a+1:start*a)==min(road_sum(i,(start-1)*a+1:start*a))) ;      %找到起点之后的第一个点
    end
    if length(start)>0
        disp('注意该问题存在多条最优解，已自动帮您规划了一条路径')
        start=start(1);
    end
    road=[road,start] ;  %保存
end
 
disp(['最短路径和为：' num2str(min(road_sum(1,:)))])
disp('其中一条对应的路径选择为：从起点出发，')
for i=road
    disp(['选下一个阶段的起点' num2str(i) ','])
end
