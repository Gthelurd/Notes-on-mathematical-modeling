clc, clear
a=zeros(6); %邻接矩阵初始化
a(1,[2:6])=[56 35 21 51 60]; %输入邻接矩阵的上三角元素
a(2,[3:6])=[21 57 78 70];
a(3,[4:6])=[36 68 68];
a(4,[5 6])=[51 61]; a(5,6)=13;
a=a'; a=sparse(a); %变换成下三角矩阵，并转化成工具箱所需要的稀疏矩阵
[ST,pred] = graphminspantree(a,'method','Kruskal') %调用工具箱求最小生成树并定义用kruskal算法求解
nodestr={'L','M','N','Pa','Pe','T'}; %输入顶点名称的字符细胞数组
h=view(biograph(ST,nodestr,'ShowArrows','on','ShowWeights','on'))%将节点名称显示在图形上，并显示箭头以及对应的权重
h.EdgeType='segmented'; %边的连接为线段
h.LayoutType='equilibrium'; dolayout(h) %设置图形布局属性，并刷新图形布局