A=[1,3,2;
    2,5,3;
    3,6,4];
V=[0.3,0.2,0.1;
    0.4,0.5,0.2;
    0.5,0.9,0.7];
money=8;
max=0;
for i =1:3
   for j =1:3
       for k=1:3
       if A(i,1)+A(j,2)+A(k,3)<=money
          value=V(i,1)+V(j,2)+V(k,3);
          if value>max
              max=value;
              x=[i,j,k];
          end
       end
       end
   end
end
disp(x);
disp(max);