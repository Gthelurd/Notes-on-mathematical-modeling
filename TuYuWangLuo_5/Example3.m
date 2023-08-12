%This is example3.m
clc,clear;
x=[0,5,16,20,33,23,35,25,10];
y=[15,20,24,20,25,11,7,0,3];
xy=[x;y];
d=mandist(xy);
d=tril(d);
b=sparse(d)
[ST,pred]=graphminspantree(b,'Method','Kruskal');
st=full(ST);
TreeLength=sum(sum(st))
view(biograph(ST,[],'ShowArrows','off'));