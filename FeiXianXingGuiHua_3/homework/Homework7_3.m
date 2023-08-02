x=[0,4.8,14.5];
y=[4.194,4.802,5];
%plot(x,y);
p=polyfit(x,y,2);
xx=0:0.05:14.5;
yy=polyval(p,xx);
plot(-yy,-xx,'b--');
legend('y=-0.0073*x^2+0.1618x+4.1940');