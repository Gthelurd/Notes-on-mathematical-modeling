clc,clear;
a=zeros(5);
a(1,[2:5])=[0.8,2,3.8,6];
a(2,[3:5])=[0.9,2.1,3.9];
a(3,[4:5])=[1.1,2.3];
a(4,5)=1.4;
b=sparse(a);
[dist,path]=graphshortestpath(b,1,5,'Directed',1);
disp(dist);
disp(path);