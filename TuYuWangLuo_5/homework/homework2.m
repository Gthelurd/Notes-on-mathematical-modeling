clc, clear
a=zeros(6); %�ڽӾ����ʼ��
a(1,[2:6])=[56 35 21 51 60]; %�����ڽӾ����������Ԫ��
a(2,[3:6])=[21 57 78 70];
a(3,[4:6])=[36 68 68];
a(4,[5 6])=[51 61]; a(5,6)=13;
a=a'; a=sparse(a); %�任�������Ǿ��󣬲�ת���ɹ���������Ҫ��ϡ�����
[ST,pred] = graphminspantree(a,'method','Kruskal') %���ù���������С��������������kruskal�㷨���
nodestr={'L','M','N','Pa','Pe','T'}; %���붥�����Ƶ��ַ�ϸ������
h=view(biograph(ST,nodestr,'ShowArrows','on','ShowWeights','on'))%���ڵ�������ʾ��ͼ���ϣ�����ʾ��ͷ�Լ���Ӧ��Ȩ��
h.EdgeType='segmented'; %�ߵ�����Ϊ�߶�
h.LayoutType='equilibrium'; dolayout(h) %����ͼ�β������ԣ���ˢ��ͼ�β���