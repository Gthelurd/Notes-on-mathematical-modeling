hold on

h=1.8;d=4.5;D=19;c=1.1;H=5;n=18;

k=h+d*tan(2*10*pi/360)-c;p=0.7;xlabel('角度'),ylabel('平均满意度')

for t=10:0.1:20

     S=0;

     x0=tan(2*t*pi/360); x1=(H-c+d*x0)/(x0+tan(2*30*pi/360));

      for xi=4.5:0.8:19

             if xi<x1
                    S=S+p*atand(h*xi/(xi^2-k^2-xi^2*(tan(2*xi*pi/360))^2+2*k*xi*x0+k*h-k*h*(tan(2*xi*pi/360))^2))-(1-p)*atand((H-c+(d-xi)*x0)/xi);

              else  S=S+p*atand(h*xi/(xi^2-k^2-xi^2*(tan(2*xi*pi/360))^2+2*k*xi*x0+k*h-k*h*(tan(2*xi*pi/360))^2));

             end

      end

 S=S/n;plot(t,S,'+b');

end
legend('平均满意度');