clc,clear;
a=zeros(12);
a(1,[2:6])=1;
a(2,[8,9])=1;
a(3,[7:10])=[1,1,0,1];
a(4,[8,9])=1;
a(5,[8,9])=1;
a(6,[10,11])=1;
a([7:11],12)=1;
a=sparse(a);
[dist,path]=graphmaxflow(a,1,12)
view(biograph(path));