clc,clear;
a=[1,1,1,1;1,1,1,0;1,1,0,1;1,0,1,1;1,0,1,0;0,1,0,1;0,1,0,0;0,0,1,0;0,0,0,1;0,0,0,0];
b=[1,0,0,0;1,1,0,0;1,0,1,0;1,0,0,1];
w=zeros(10);
for i=1:9
    for j=i+1:10
        for k=1:4
            if findstr(xor(a(i,:),b(k,:)),a(j,:))
                w(i,j)=1;
            end
        end
    end
end
w=w';
c=sparse(w);
[x,y,z]=graphshortestpath(c,1,10,'Directed',0);
h=view(biograph(c,[],'ShowArrows','off','ShowWeights','off'));
Edges=getedgesbynodeid(h);
set(Edges,'LineColor',[0,0,0]);
set(Edges,'LineWidth',1.5);
disp(y);